package com.njupt.swg.mamabuystockservice.stock.service;

import com.njupt.swg.mamabuystockservice.stock.entity.StockReduce;

import java.util.List;
import java.util.Map;

/**
 * @Author 【swg】.
 * @Date 2018/12/22 12:13
 * @DESC
 * @CONTACT 317758022@qq.com
 */
public interface IStockService {
    int queryStock(long skuId);

    Map<Long, Integer> reduceStock(List<StockReduce> stockReduceList);
}
