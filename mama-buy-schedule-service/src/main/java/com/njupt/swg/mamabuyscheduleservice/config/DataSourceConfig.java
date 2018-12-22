package com.njupt.swg.mamabuyscheduleservice.config;

import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @Author 【swg】.
 * @Date 2018/12/22 23:05
 * @DESC 自定义数据源
 * @CONTACT 317758022@qq.com
 */
@Configuration
public class DataSourceConfig {

    @Bean("stockDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.stock")
    public DataSource stockDataSource(){
        return DataSourceBuilder.create().build();
    }



}
