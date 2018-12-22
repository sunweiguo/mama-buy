package com.njupt.swg.mamabuyscheduleservice.stock.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Stock {

    private Long id;

    private Long skuId;

    private Integer stock;

    private Integer lockStock;

    private Date createTime;

    private Date updateTime;

}