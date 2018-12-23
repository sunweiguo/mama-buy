package com.njupt.swg.mamabuykeygenservice.web;

import com.njupt.swg.mamabuykeygenservice.KeyGen.KeyGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 【swg】.
 * @Date 2018/12/23 11:12
 * @DESC
 * @CONTACT 317758022@qq.com
 */
@RestController
@RequestMapping
public class KeyGeneratorController {


    @Autowired
    @Qualifier("snowFlakeKeyGenerator")
    private KeyGenerator keyGenerator;

    @RequestMapping("/keygen")
    public String generateKey() throws Exception {
        return String.valueOf(keyGenerator.generateKey().longValue());
    }

}
