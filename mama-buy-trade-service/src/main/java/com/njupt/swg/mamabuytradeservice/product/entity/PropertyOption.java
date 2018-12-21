package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

import java.util.Date;

@Data
public class PropertyOption {
    private Long id;

    private Long propertyId;

    private String optionName;

    private Date createTime;

    private Date updateTime;

}