package com.njupt.swg.mamabuyuserservice.user.service;

import com.njupt.swg.mamabuyuserservice.user.entity.User;
import com.njupt.swg.mamabuyuserservice.user.entity.UserElement;

/**
 * @Author 【swg】.
 * @Date 2018/12/18 10:25
 * @DESC
 * @CONTACT 317758022@qq.com
 */
public interface IUserService {
    UserElement login(User user);

    void registerUser(User user) throws Exception;
}
