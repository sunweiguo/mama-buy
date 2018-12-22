package com.njupt.swg.mamabuyscheduleservice.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @Author 【swg】.
 * @Date 2018/12/22 23:10
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@Configuration
@MapperScan(basePackages = {"com.njupt.swg.mamabuyscheduleservice.stock.dao"},sqlSessionFactoryRef = "stockSqlSessionFactory")
public class SqlSessionConfig {
    @Autowired
    @Qualifier("stockDataSource")
    private DataSource stockDataSource;

    @Bean(name = "stockSqlSessionFactory")
    public SqlSessionFactory stockSqlSessionFactory() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(stockDataSource);
        return  factoryBean.getObject();
    }
    @Bean("stockSqlSessionTemplate")
    public SqlSessionTemplate stockSqlSessionTemplate () throws Exception {
        SqlSessionTemplate template = new SqlSessionTemplate(stockSqlSessionFactory());
        return template;
    }
}
