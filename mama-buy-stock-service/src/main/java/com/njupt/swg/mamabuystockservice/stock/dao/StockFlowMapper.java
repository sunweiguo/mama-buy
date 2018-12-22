package com.njupt.swg.mamabuystockservice.stock.dao;

import com.njupt.swg.mamabuystockservice.stock.entity.StockFlow;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockFlowMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockFlow record);

    int insertSelective(StockFlow record);

    StockFlow selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StockFlow record);

    int updateByPrimaryKey(StockFlow record);
}