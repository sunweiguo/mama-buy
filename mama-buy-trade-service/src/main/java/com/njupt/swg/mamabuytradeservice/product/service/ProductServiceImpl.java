package com.njupt.swg.mamabuytradeservice.product.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.njupt.swg.mamabuytradeservice.common.constants.Constants;
import com.njupt.swg.mamabuytradeservice.product.dao.CategoryMapper;
import com.njupt.swg.mamabuytradeservice.product.dao.ProductMapper;
import com.njupt.swg.mamabuytradeservice.product.entity.Category;
import com.njupt.swg.mamabuytradeservice.product.entity.Product;
import io.searchbox.client.http.JestHttpClient;
import io.searchbox.core.Search;
import io.searchbox.core.SearchResult;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author 【swg】.
 * @Date 2018/12/21 10:08
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Service
@Slf4j
public class ProductServiceImpl implements IProductService{
    int PAGE_SIZE = 15; //默认分页大小

    int PAGE_NUMBER = 0; //默认当前分页

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private JestHttpClient esClient;


    /**
     * ES全文检索
     */
    @Override
    public List<Product> search(int pageNumber, int pageSize, String searchContent) throws IOException {
        if(pageSize==0) {
            pageSize = PAGE_SIZE;
        }
        if(pageNumber<=0) {
            pageNumber = PAGE_NUMBER;
        }

        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders//组合查询
                .boolQuery()
                .must(QueryBuilders.matchQuery("spu_name",searchContent))//must：必须匹配，相当于and；should：相当于or；must not：不匹配
                .must(QueryBuilders.matchQuery("status",1)))//第二个条件是必须是在架的商品
                .from(pageNumber*pageSize)//分页展示的起始位置
                .size(pageSize);//每页展示多少
        searchSourceBuilder.highlight()
                .field("spu_name")
                .preTags("<em>").postTags("</em>")
                .fragmentSize(200);
        Search search = new Search.Builder(searchSourceBuilder.toString())
                .addIndex("jdbc")
                .build();
        SearchResult response = esClient.execute(search);
        String jsonString = response.getJsonString();
        List<Product> productList = parseResult(jsonString);

        return productList;
    }

    @Override
    @Cacheable(cacheNames = Constants.CACHE_PRODUCT_CATEGORY)
    public List<Category> listCategory() {
        return categoryMapper.selectAll();
    }

    @Override
    public Product productDetail(Long id) {
        Product product = productMapper.selectByPrimaryKeyWithSku(id);

        return product;
    }

    private List<Product> parseResult(String jsonString) {
        JSONArray jsonArray = JSON.parseObject(jsonString).getJSONObject("hits").getJSONArray("hits");
        List<Product> productList = new ArrayList<>();
        for(int i=0;i<jsonArray.size();i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            JSONObject productObj = jsonObject.getJSONObject("_source");
            Product product = new Product();
            product.setId(productObj.getLongValue("id"));
            product.setCategoryId(productObj.getLongValue("category_id"));
            product.setBrandId(productObj.getLongValue("brand_id"));
            product.setSpuName(productObj.getString("spu_name"));
            product.setPrice(productObj.getBigDecimal("price"));

            productList.add(product);
        }
        return productList;
    }
}
