package com.njupt.swg.mamabuyserverregistry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class MamaBuyServerRegistryApplication {

    public static void main(String[] args) {
        SpringApplication.run(MamaBuyServerRegistryApplication.class, args);
    }

}

