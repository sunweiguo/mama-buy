package com.njupt.swg.mamabuystockservice.stock.service;

import com.njupt.swg.mamabuystockservice.common.constants.Constants;
import com.njupt.swg.mamabuystockservice.common.utils.RedisUtils;
import com.njupt.swg.mamabuystockservice.stock.dao.StockFlowMapper;
import com.njupt.swg.mamabuystockservice.stock.dao.StockMapper;
import com.njupt.swg.mamabuystockservice.stock.entity.Stock;
import com.njupt.swg.mamabuystockservice.stock.entity.StockFlow;
import com.njupt.swg.mamabuystockservice.stock.entity.StockReduce;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author 【swg】.
 * @Date 2018/12/22 12:13
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Service
@Slf4j
public class StockServiceImpl implements IStockService{

    @Autowired
    private StockMapper stockMapper;

    @Autowired
    private StockFlowMapper stockFlowMapper;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private RedisTemplate redisTemplate;


    @Override
    public int queryStock(long skuId) {
        //先查redis
        Stock stock ;
        String stockKey = Constants.CACHE_PRODUCT_STOCK+":"+skuId;
        String stockLockKey = Constants.CACHE_PRODUCT_STOCK_LOCK+":"+skuId;
        //只需要查询一个即可，比如我这里只查询库存就行
        Object stockObj = redisTemplate.opsForValue().get(stockKey);
        Integer stockInRedis = null ;
        if(stockObj!=null){
            stockInRedis = Integer.valueOf(stockObj.toString());
        }
        //没有，那么我就需要将数据库中的数据初始化到redis中
        if(stockInRedis==null){
            //redis中为空 初始化一次
            stock = stockMapper.selectBySkuId(skuId);
            //两个key和两个库存值通过lua脚本塞到redis中
            //这里如果发生两个用户并发初始化redis，脚本中会进行判断，如果已经初始化了，脚本就会停止执行
            // 设置库存不应该在这配置，应该是后台管理系统进行设置，所以正常情况下，这里redis中应该是必然存在的
            //如果是在后台配置，就没有必要这么复杂了
            redisUtils.skuStockInit(stockKey,stockLockKey,stock.getStock().toString(),stock.getLockStock().toString());
        }else{
            return stockInRedis;
        }
        //缓存结果可能会返回设置不成功，所以还是返回数据库查询结果
        return stock.getStock();
    }

    @Override
    @Transactional
    public Map<Long, Integer> reduceStock(List<StockReduce> stockReduceList) {
        //防止扣减库存时MQ正常重试时的不幂等
        //以订单ID 加个缓存锁 防止程序短时间重试 重复扣减库存 不用解锁 自己超时
        Long orderNo = stockReduceList.get(0).getOrderNo();
        boolean lockResult = redisUtils.distributeLock(Constants.ORDER_RETRY_LOCK+orderNo.toString(),orderNo.toString(),300000);
        if(!lockResult){
            //锁定失败 重复提交
            return  Collections.EMPTY_MAP;
        }


        Map<Long, Integer> resultMap = new HashMap<>();
        //遍历去减库存，增加锁定库存
        stockReduceList.forEach(param -> {
            String stockKey = Constants.CACHE_PRODUCT_STOCK+":"+param.getSkuId();
            String stockLockKey = Constants.CACHE_PRODUCT_STOCK_LOCK+":"+param.getSkuId();
            Object result = redisUtils.reduceStock(stockKey,
                                                   stockLockKey,
                                                   param.getReduceCount().toString(),//incrby一个负数，就是减
                                                   String.valueOf(Math.abs(param.getReduceCount())));//incrby一个正数，就是加
            if(result instanceof Long){
                //库存不存在或者不足 扣减失败 sku下单失败 记录下来
                resultMap.put(param.getSkuId(),-1);
            }else if (result instanceof List){
                //扣减成功 记录扣减流水
                List resultList =  ((List) result);
                int stockAftChange =  ((Long)resultList.get(0)).intValue();
                int stockLockAftChange = ((Long) resultList.get(1)).intValue();
                StockFlow stockFlow = new StockFlow();
                stockFlow.setOrderNo(param.getOrderNo());
                stockFlow.setSkuId(param.getSkuId());
                stockFlow.setLockStockAfter(stockLockAftChange);
                stockFlow.setLockStockBefore(stockLockAftChange+param.getReduceCount());
                stockFlow.setLockStockChange(Math.abs(param.getReduceCount()));
                stockFlow.setStockAfter(stockAftChange);
                stockFlow.setStockBefore(stockAftChange+Math.abs(param.getReduceCount()));
                stockFlow.setStockChange(param.getReduceCount());
                stockFlowMapper.insertSelective(stockFlow);
                resultMap.put(param.getSkuId(),1);
            }
        });
        return resultMap;
    }
}
