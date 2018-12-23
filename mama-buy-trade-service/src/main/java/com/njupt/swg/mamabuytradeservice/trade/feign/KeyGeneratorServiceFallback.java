package com.njupt.swg.mamabuytradeservice.trade.feign;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 11:25
 * @DESC
 * @CONTACT 317758022@qq.com
 */
public class KeyGeneratorServiceFallback implements KeyGenServiceClient{
    @Override
    public String keyGenerator() {
        return null;
    }
}
