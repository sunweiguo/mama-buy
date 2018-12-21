package com.njupt.swg.mamabuyuserservice.common.exception;


import com.njupt.swg.mamabuyuserservice.common.constants.Constants;

/**
 * Created by JackWang<coder520.com>
 *
 * @Date 18:52 2018/1/16
 */
public class MamaBuyException extends RuntimeException{

    private int statusCode = Constants.RESP_STATUS_INTERNAL_ERROR;

    public MamaBuyException(int statusCode,String message) {
        super(message);
        this.statusCode = statusCode;
    }
    public MamaBuyException(String message) {
        super(message);
    }

    public int getStatusCode() {
        return statusCode;
    }
}
