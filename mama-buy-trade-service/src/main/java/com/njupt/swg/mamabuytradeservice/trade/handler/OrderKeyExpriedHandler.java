package com.njupt.swg.mamabuytradeservice.trade.handler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 14:53
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Configuration
public class OrderKeyExpriedHandler {
    @Bean
    public RedisMessageListenerContainer configRedisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory){
        RedisMessageListenerContainer listenerContainer = new RedisMessageListenerContainer();
        listenerContainer.setConnectionFactory(redisConnectionFactory);
        listenerContainer.addMessageListener((message,listener)->{
            //处理key过期事件逻辑
            System.out.println("------redis过期事件"+new String(message.getBody()));

        }, new PatternTopic("__keyevent@*__:expired"));
        return listenerContainer;
    }
}
