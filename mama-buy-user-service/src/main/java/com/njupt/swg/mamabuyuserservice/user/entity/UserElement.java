package com.njupt.swg.mamabuyuserservice.user.entity;

import lombok.Data;

import java.io.Serializable;

/**
 *
 * 用于缓存的user信息体
 */
@Data
public class UserElement implements Serializable{

    private Long userId;

    private Long uuid;

    private String email;

    private  String nickname;


}
