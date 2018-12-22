package com.njupt.swg.mamabuyscheduleservice.stock.dao;

import com.njupt.swg.mamabuyscheduleservice.stock.entity.StockFlow;


public interface StockFlowMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockFlow record);

    int insertSelective(StockFlow record);

    StockFlow selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StockFlow record);

    int updateByPrimaryKey(StockFlow record);
}