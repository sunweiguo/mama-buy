package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Category implements Serializable{

    private Long id;

    private Long parentId;

    private String name;

    private Boolean status;

    private Integer sortOrder;

    private Date createTime;

    private Date updateTime;

    private List<Category> children;

}