package com.njupt.swg.mamabuytradeservice.trade.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Trade {
    private Long id;

    private Long tradeNo;

    private Long userUuid;

    private BigDecimal payment;

    private Byte paymenyType;

    private Byte status;

    private Date paymentTime;

    private Date closeTime;

    private Date createTime;

    private Date updateTime;

}