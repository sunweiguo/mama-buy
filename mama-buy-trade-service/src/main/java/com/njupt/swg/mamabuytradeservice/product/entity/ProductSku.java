package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class ProductSku {

    private Long id;

    private Long spuId;

    private String skuName;

    private BigDecimal skuPrice;

    private String imgUrl;

    private byte enableFlag;

    private byte status;

    private List<SkuPropertyOption> skuPropertyOptions;

    private Date createTime;

    private Date updateTime;


}