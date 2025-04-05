package org.huang.dlyk_server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashMap;

@MapperScan("org.huang.dlyk_server.mapper")
@SpringBootApplication
public class DlykServerApplication {
    
    // 缓存
    public static final HashMap<String, Object> CACHE = new HashMap<>();
    
    public static void main(String[] args) {
        SpringApplication.run(DlykServerApplication.class, args);
    }
    
}
