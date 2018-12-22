package com.njupt.swg.mamabuystockservice.stock.entity;

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