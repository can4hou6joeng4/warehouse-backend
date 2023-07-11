package com.bobochang.warehouse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.bobochang.warehouse.mapper")
@SpringBootApplication
public class WarehouseBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(WarehouseBackendApplication.class, args);
    }

}
