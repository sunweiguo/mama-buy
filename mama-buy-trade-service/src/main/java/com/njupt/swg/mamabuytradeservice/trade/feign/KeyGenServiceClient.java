package com.njupt.swg.mamabuytradeservice.trade.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 11:21
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@FeignClient(name = "key-generator",fallback = KeyGeneratorServiceFallback.class)
public interface KeyGenServiceClient {
    @RequestMapping("/keygen")
    String keyGenerator();
}
