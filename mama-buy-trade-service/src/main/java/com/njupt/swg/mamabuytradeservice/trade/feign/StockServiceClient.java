package com.njupt.swg.mamabuytradeservice.trade.feign;

import com.njupt.swg.mamabuytradeservice.common.resp.ApiResult;
import com.njupt.swg.mamabuytradeservice.trade.entity.StockReduce;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

/**
 * Created by JackWangon[www.coder520.com] 2018/4/15.
 */
@FeignClient(name = "stock-service",fallback = StockServiceFallback.class)
public interface StockServiceClient {

    @RequestMapping(value = "/stock/reduce",method = RequestMethod.POST)
    ApiResult<Map<Long,Integer>> reduceStock(@RequestBody List<StockReduce> stockReduceList);

}
