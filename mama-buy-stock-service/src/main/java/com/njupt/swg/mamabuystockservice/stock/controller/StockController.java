package com.njupt.swg.mamabuystockservice.stock.controller;

import com.njupt.swg.mamabuystockservice.common.constants.Constants;
import com.njupt.swg.mamabuystockservice.common.resp.ApiResult;
import com.njupt.swg.mamabuystockservice.stock.entity.Stock;
import com.njupt.swg.mamabuystockservice.stock.entity.StockReduce;
import com.njupt.swg.mamabuystockservice.stock.service.IStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Author 【swg】.
 * @Date 2018/12/22 12:03
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@RestController
@RequestMapping("stock")
public class StockController {
    @Autowired
    private IStockService stockService;

    /**
     * 查询这个sku对应的库存
     * 返回skuID和skuCount实体
     */
    @RequestMapping("/query/{skuId}")
    public ApiResult<Stock> queryStock(@PathVariable long skuId){
        ApiResult<Stock>  result = new ApiResult(Constants.RESP_STATUS_OK,"库存查询成功");
        Stock stock = new Stock();
        stock.setSkuId(skuId);

        int stockCount = stockService.queryStock(skuId);

        stock.setStock(stockCount);
        result.setData(stock);
        return  result;
    }

    /**
     * @Description  多商品库存扣减
     */
    @RequestMapping("/reduce")
    public ApiResult<Map<Long,Integer>> reduceStock(@RequestBody List<StockReduce> stockReduceList){
        ApiResult result = new ApiResult(Constants.RESP_STATUS_OK,"库存扣减成功");
        Map<Long,Integer> resultMap =  stockService.reduceStock(stockReduceList);
        result.setData(resultMap);
        return result;
    }
}
