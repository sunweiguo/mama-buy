package com.njupt.swg.mamabuytradeservice.product.dao;


import com.njupt.swg.mamabuytradeservice.product.entity.SkuPropertyOption;

public interface SkuPropertyOptionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SkuPropertyOption record);

    int insertSelective(SkuPropertyOption record);

    SkuPropertyOption selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SkuPropertyOption record);

    int updateByPrimaryKey(SkuPropertyOption record);
}