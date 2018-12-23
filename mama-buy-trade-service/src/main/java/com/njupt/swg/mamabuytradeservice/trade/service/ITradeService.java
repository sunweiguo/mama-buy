package com.njupt.swg.mamabuytradeservice.trade.service;

import com.njupt.swg.mamabuytradeservice.trade.entity.TradeItem;

import java.util.List;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 10:58
 * @DESC
 * @CONTACT 317758022@qq.com
 */
public interface ITradeService {
    List<TradeItem> createOrder(List<TradeItem> tradeItems);
}
