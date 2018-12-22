package com.njupt.swg.mamabuyscheduleservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {
        DataSourceAutoConfiguration.class
})
public class MamaBuyScheduleServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MamaBuyScheduleServiceApplication.class, args);
    }

}

