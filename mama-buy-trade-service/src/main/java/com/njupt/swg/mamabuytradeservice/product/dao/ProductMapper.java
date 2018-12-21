package com.njupt.swg.mamabuytradeservice.product.dao;

import com.njupt.swg.mamabuytradeservice.product.entity.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selectByCategory(Long categoryId);

    Product selectByPrimaryKeyWithSku(Long id);
}