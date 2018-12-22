package com.njupt.swg.mamabuystockservice.stock.dao;

import com.njupt.swg.mamabuystockservice.stock.entity.Stock;
import com.njupt.swg.mamabuystockservice.stock.entity.StockReduce;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Stock record);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);

    int reduceStock(StockReduce stockReduce);

    Stock selectBySkuId(Long skuId);
}