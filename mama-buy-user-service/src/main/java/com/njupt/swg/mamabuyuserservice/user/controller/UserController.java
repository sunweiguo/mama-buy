package com.njupt.swg.mamabuyuserservice.user.controller;

import com.njupt.swg.mamabuyuserservice.common.constants.Constants;
import com.njupt.swg.mamabuyuserservice.common.resp.ApiResult;
import com.njupt.swg.mamabuyuserservice.user.entity.User;
import com.njupt.swg.mamabuyuserservice.user.entity.UserElement;
import com.njupt.swg.mamabuyuserservice.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * @Author 【swg】.
 * @Date 2018/12/17 19:29
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("login")
    public ApiResult login(@RequestBody @Valid User user, HttpSession session){
        ApiResult<UserElement> result = new ApiResult<>(Constants.RESP_STATUS_OK,"登录成功");

        UserElement ue= userService.login(user);
        if(ue != null){
            if(session.getAttribute(Constants.REQUEST_USER_SESSION) == null){
                session.setAttribute(Constants.REQUEST_USER_SESSION,ue);
            }
            result.setData(ue);
        }

        return result;
    }

    /**
     *
     * @Description  用户注册
     */
    @RequestMapping("/register")
    public ApiResult register (@RequestBody @Valid User user) throws Exception {

        userService.registerUser(user);

        return new ApiResult(Constants.RESP_STATUS_OK,"注册成功");

    }



}
