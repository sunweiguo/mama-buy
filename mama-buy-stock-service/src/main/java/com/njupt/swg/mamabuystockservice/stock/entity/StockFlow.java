package com.njupt.swg.mamabuystockservice.stock.entity;

import lombok.Data;

import java.util.Date;

/**
 * 记录库存的扣减流水
 * 定时任务去同步库存数据
 * 即记录了变化过程
 * 不直接去操作库存表
 */
@Data
public class StockFlow {
    private Long id;

    private Long orderNo;

    private Long skuId;

    private Integer stockBefore;

    private Integer stockAfter;

    private Integer stockChange;

    private Integer lockStockBefore;

    private Integer lockStockAfter;

    private Integer lockStockChange;

    private Date createTime;

    private Date updateTime;

}