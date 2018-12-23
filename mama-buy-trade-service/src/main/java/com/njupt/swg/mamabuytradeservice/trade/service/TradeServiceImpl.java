package com.njupt.swg.mamabuytradeservice.trade.service;

import com.njupt.swg.mamabuytradeservice.common.resp.ApiResult;
import com.njupt.swg.mamabuytradeservice.enums.TradeStatus;
import com.njupt.swg.mamabuytradeservice.product.dao.ProductSkuMapper;
import com.njupt.swg.mamabuytradeservice.product.entity.ProductSku;
import com.njupt.swg.mamabuytradeservice.trade.dao.TradeItemMapper;
import com.njupt.swg.mamabuytradeservice.trade.dao.TradeMapper;
import com.njupt.swg.mamabuytradeservice.trade.entity.StockReduce;
import com.njupt.swg.mamabuytradeservice.trade.entity.Trade;
import com.njupt.swg.mamabuytradeservice.trade.entity.TradeItem;
import com.njupt.swg.mamabuytradeservice.trade.feign.KeyGenServiceClient;
import com.njupt.swg.mamabuytradeservice.trade.feign.StockServiceClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 10:58
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Service
public class TradeServiceImpl implements ITradeService{
    @Autowired
    private KeyGenServiceClient keyGenServiceClient;
    @Autowired
    private StockServiceClient stockServiceClient;
    @Autowired
    private TradeMapper tradeMapper;
    @Autowired
    private TradeItemMapper tradeItemMapper;
    @Autowired
    private ProductSkuMapper productSkuMapper;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    @Transactional
    public List<TradeItem> createOrder(List<TradeItem> tradeItemList) {
        //拿到唯一ID
        String orderNo = keyGenServiceClient.keyGenerator();
        Long tradeNo = Long.parseLong(orderNo);
        Long userId = tradeItemList.get(0).getUserUuid();
        //构建扣减库存用到的reduceList
        List<StockReduce> stockReduceList = new ArrayList<>();
        tradeItemList.stream().forEach(
                param->{
                    StockReduce stockReduce = new StockReduce();
                    stockReduce.setOrderNo(tradeNo);
                    stockReduce.setSkuId(param.getSkuId());
                    stockReduce.setReduceCount(-param.getQuantity());

                    stockReduceList.add(stockReduce);
                }
        );
        //扣减库存,只是从redis中预减库存和写入流水表，真正的库存表是在定时任务中用流水表去同步
        ApiResult<Map<Long,Integer>> stockResult =  stockServiceClient.reduceStock(stockReduceList);
        Map<Long,Integer> stockResultMap = stockResult.getData();

        //查询相关SKU的属性
        List<ProductSku> skuResult = productSkuMapper.selectBySkuIdList(stockResultMap.keySet());

        //判断库存逻辑  插入订单
        Trade trade = new Trade();
        trade.setTradeNo(tradeNo);
        trade.setStatus(TradeStatus.WAITING_PAY.getValue());
        trade.setUserUuid(userId);
        tradeMapper.insertSelective(trade);
        //将扣减库存失败的商品选出来，然后去tradeItems中去移除
        stockResultMap.keySet().stream().forEach(
                param->{
                    //扣库存失败的移除
                    if(stockResultMap.get(param)==-1){
                        TradeItem tradeItem =  tradeItemList.stream().filter(
                                item->item.getSkuId()==param
                        ).findFirst()
                                .get();
                        tradeItemList.remove(tradeItem);
                    }
                }
        );
        //计算商品价格等信息
        tradeItemList.stream().forEach(
                param->{
                    ProductSku sku = skuResult.stream().filter(
                            skuParam->param.getSkuId()==skuParam.getId()
                    ).findFirst()
                            .get();
                    param.setTradeNo(tradeNo);
                    param.setSkuImageUrl(sku.getImgUrl());
                    param.setSkuName(sku.getSkuName());
                    param.setCurrentPrice(sku.getSkuPrice());
                    param.setTotalPrice(sku.getSkuPrice().multiply(new BigDecimal(param.getQuantity())));

                    tradeItemMapper.insertSelective(param);
                }
        );

        //设置redis 订单号过期
        redisTemplate.opsForValue().set(tradeNo.toString(),tradeNo.toString(),20, TimeUnit.MINUTES);

        return tradeItemList;
    }
}
