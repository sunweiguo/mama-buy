package com.njupt.swg.mamabuyuserservice.user.service;

import com.njupt.swg.mamabuyuserservice.common.constants.Constants;
import com.njupt.swg.mamabuyuserservice.common.exception.MamaBuyException;
import com.njupt.swg.mamabuyuserservice.user.dao.UserMapper;
import com.njupt.swg.mamabuyuserservice.user.entity.User;
import com.njupt.swg.mamabuyuserservice.user.entity.UserElement;
import lombok.extern.slf4j.Slf4j;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.locks.InterProcessLock;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @Author 【swg】.
 * @Date 2018/12/18 10:25
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Service
@Slf4j
public class UserService implements IUserService{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private CuratorFramework zkClient;


    @Override
    public UserElement login(User user) {
        UserElement ue = null;
        User userExist = userMapper.selectByEmail(user.getEmail());
        if(userExist != null){
            //对密码与数据库密码进行校验
            boolean result = passwordEncoder.matches(user.getPassword(),userExist.getPassword());
            if(!result){
                throw new MamaBuyException("密码错误");
            }else{
                //校验全部通过，登陆通过
                ue = new UserElement();
                ue.setEmail(userExist.getEmail());
                ue.setUserId(userExist.getId());
                ue.setNickname(userExist.getNickname());
                ue.setUuid(userExist.getUuid());
            }
        }else {
            throw new MamaBuyException("用户不存在");
        }
        return ue;
    }

    @Override
    public void registerUser(User user) throws Exception {
        InterProcessLock lock = null;
        try{
            lock = new InterProcessMutex(zkClient, Constants.USER_REGISTER_DISTRIBUTE_LOCK_PATH);
            boolean retry = true;
            do{
                if (lock.acquire(3000, TimeUnit.MILLISECONDS)){
                    log.info(user.getEmail()+Thread.currentThread().getName()+"获取锁");
                    //查询重复用户
                    User repeatedUser = userMapper.selectByEmail(user.getEmail());
                    if(repeatedUser!=null){
                        throw  new MamaBuyException("用户邮箱重复");
                    }
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                    user.setNickname("码码购用户"+user.getEmail());
                    userMapper.insertSelective(user);
                    //跳出循环
                    retry = false;
                }
                //可以适当休息一会...也可以设置重复次数，不要无限循环
            }while (retry);
        }catch (Exception e){
            log.error("用户注册异常",e);
            throw  e;
        }finally {
            if(lock != null){
                try {
                    lock.release();
                    log.info(user.getEmail()+Thread.currentThread().getName()+"释放锁");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
