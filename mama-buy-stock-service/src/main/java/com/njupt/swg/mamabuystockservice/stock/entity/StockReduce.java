package com.njupt.swg.mamabuystockservice.stock.entity;

import lombok.Data;

/**
 * 接收前端购物车数据
 * @Date 17:12 2018/3/23
 */
@Data
public class StockReduce {

    private Long orderNo;

    private Long skuId;

    private Integer reduceCount; //正数为增加/释放库存  负数为扣减

}
