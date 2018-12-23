package com.njupt.swg.mamabuytradeservice.trade.feign;

import com.njupt.swg.mamabuytradeservice.common.constants.Constants;
import com.njupt.swg.mamabuytradeservice.common.resp.ApiResult;
import com.njupt.swg.mamabuytradeservice.trade.entity.StockReduce;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by JackWangon[www.coder520.com] 2018/4/15.
 */
public class StockServiceFallback implements StockServiceClient{
    @Override
    public ApiResult<Map<Long, Integer>> reduceStock(List<StockReduce> stockReduceList) {
        ApiResult<Map<Long, Integer>> result = new ApiResult(Constants.RESP_STATUS_INTERNAL_ERROR,"请求失败,请稍后再试");
        result.setData(Collections.EMPTY_MAP);
        return result;
    }
}
