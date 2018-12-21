package com.njupt.swg.mamabuytradeservice.product.controller;

import com.njupt.swg.mamabuytradeservice.common.resp.ApiResult;
import com.njupt.swg.mamabuytradeservice.product.entity.Category;
import com.njupt.swg.mamabuytradeservice.product.entity.PageSearch;
import com.njupt.swg.mamabuytradeservice.product.entity.Product;
import com.njupt.swg.mamabuytradeservice.product.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

/**
 * @Author 【swg】.
 * @Date 2018/12/21 10:08
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@RestController
@RequestMapping("/product")
public class PorductController {
    @Autowired
    private IProductService productService;

    /**
     * 商品搜索
     */
    @RequestMapping("/search")
    public ApiResult<List<Product>> searchProduct(@RequestBody PageSearch pageSearch) throws IOException {
        ApiResult<List<Product>> result = new ApiResult<>(200,"检索数据成功");
        List<Product> data = productService.search(pageSearch.getPageNumber(),pageSearch.getPageSize(),pageSearch.getSearchContent());
        result.setData(data);

        return result;
    }

    /**
     * 查询所有层级的分类
     */
    @RequestMapping("/category")
    public ApiResult<List<Category>> listCategory(){

        ApiResult<List<Category>> result = new ApiResult<>(200,"查询分类成功");

        List<Category> list =  productService.listCategory();

        result.setData(list);
        return result;
    }

    /**
     * 显示商品详情，就是sku
   */
    @RequestMapping("/detail/{id}")
    public ApiResult<Product> productDetail(@PathVariable Long id){

        ApiResult<Product> result = new ApiResult<>(200,"获取商品详情成功");

        Product product =  productService.productDetail(id);

        result.setData(product);

        return result;

    }


}
