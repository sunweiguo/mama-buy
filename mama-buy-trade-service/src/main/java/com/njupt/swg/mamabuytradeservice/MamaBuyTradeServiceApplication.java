package com.njupt.swg.mamabuytradeservice;

import com.njupt.swg.mamabuytradeservice.common.constants.Parameters;
import io.searchbox.client.JestClientFactory;
import io.searchbox.client.config.HttpClientConfig;
import io.searchbox.client.http.JestHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.net.UnknownHostException;

@SpringBootApplication
@EnableTransactionManagement
@EnableDiscoveryClient
@EnableCaching
@EnableFeignClients
public class MamaBuyTradeServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MamaBuyTradeServiceApplication.class, args);
    }

    @Autowired
    private Parameters parameters;

    /**
     * ES客户端
     */
    @Bean
    public JestHttpClient getESClient() throws UnknownHostException {
        JestClientFactory factory = new JestClientFactory();
        factory.setHttpClientConfig(new HttpClientConfig
                .Builder("http://"+parameters.getEsHost())
                .multiThreaded(true)
                .readTimeout(10000)
                .build());
        JestHttpClient client = (JestHttpClient)factory.getObject();
        return client;
    }
}

