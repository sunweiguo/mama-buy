package com.njupt.swg.mamabuytradeservice.trade.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class TradeItem {

    private Long id;

    private Long userUuid;

    private Long tradeNo;

    private Long skuId;

    private String skuName;

    private String skuImageUrl;

    private BigDecimal currentPrice;

    private Integer quantity;

    private BigDecimal totalPrice;

    private Date createTime;

    private Date updateTime;

}