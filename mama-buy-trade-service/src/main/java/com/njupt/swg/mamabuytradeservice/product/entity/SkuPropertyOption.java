package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

import java.util.Date;

@Data
public class SkuPropertyOption {
    private Long id;

    private Long skuId;

    private Long propertyId;

    private Long propertyOptionId;

    private Byte enableFlag;

    private Date createTime;

    private Date updateTime;

}