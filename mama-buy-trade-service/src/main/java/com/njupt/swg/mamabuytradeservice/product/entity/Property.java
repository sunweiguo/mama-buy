package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

import java.util.Date;


@Data
public class Property {
    private Long id;

    private Long categoryId;

    private String propertyName;

    private Date createTime;

    private Date updateTime;

}