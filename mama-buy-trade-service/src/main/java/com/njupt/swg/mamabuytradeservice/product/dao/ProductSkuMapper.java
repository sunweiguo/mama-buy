package com.njupt.swg.mamabuytradeservice.product.dao;

import com.njupt.swg.mamabuytradeservice.product.entity.ProductSku;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

@Mapper
public interface ProductSkuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ProductSku record);

    int insertSelective(ProductSku record);

    ProductSku selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ProductSku record);

    int updateByPrimaryKey(ProductSku record);

    List<ProductSku> selectBySkuIdList(@Param("skuIdSet") Set<Long> skuIdSet);
}