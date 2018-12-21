package com.njupt.swg.mamabuytradeservice.product.service;

import com.njupt.swg.mamabuytradeservice.product.entity.Category;
import com.njupt.swg.mamabuytradeservice.product.entity.Product;

import java.io.IOException;
import java.util.List;

/**
 * @Author 【swg】.
 * @Date 2018/12/21 10:08
 * @DESC
 * @CONTACT 317758022@qq.com
 */
public interface IProductService {
    List<Product> search(int pageNumber, int pageSize, String searchContent) throws IOException;

    List<Category> listCategory();

    Product productDetail(Long id);
}
