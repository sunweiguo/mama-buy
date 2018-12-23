package com.njupt.swg.mamabuytradeservice.trade.controller;

import com.njupt.swg.mamabuytradeservice.common.constants.Constants;
import com.njupt.swg.mamabuytradeservice.common.resp.ApiResult;
import com.njupt.swg.mamabuytradeservice.trade.entity.TradeItem;
import com.njupt.swg.mamabuytradeservice.trade.service.ITradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 10:57
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@RestController
@RequestMapping("trade")
public class TradeController {
    @Autowired
    private ITradeService tradeService;

    @RequestMapping("/order")
    public ApiResult<List<TradeItem>> createOrder(@RequestBody List<TradeItem> tradeItemList){

        ApiResult<List<TradeItem>> result = new ApiResult(Constants.RESP_STATUS_OK,"订单提交成功");

        List<TradeItem> tradeItemSuccResult =tradeService.createOrder(tradeItemList);
        result.setData(tradeItemSuccResult);

        return  result;
    }

}
