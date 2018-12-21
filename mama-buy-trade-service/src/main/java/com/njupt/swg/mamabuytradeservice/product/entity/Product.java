package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;
import org.springframework.data.annotation.Transient;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class Product implements Serializable{

    private Long id;

    private Long categoryId;

    private Long brandId;

    private String spuName;

    private BigDecimal price;

    private Byte status;

    private List<ProductSku> skuList;

    @Transient
    private Date createTime;
    @Transient
    private Date updateTime;


}