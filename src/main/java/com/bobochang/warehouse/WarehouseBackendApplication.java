package com.bobochang.warehouse;

import com.bobochang.warehouse.config.SystemConstants;
import com.bobochang.warehouse.entity.SysConfig;
import com.bobochang.warehouse.mapper.SysConfigMapper;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import cn.hutool.core.util.StrUtil;


import javax.annotation.PostConstruct;
import java.io.File;
import java.lang.reflect.Field;
import java.util.List;

@MapperScan("com.bobochang.warehouse.mapper")
@SpringBootApplication
@Slf4j
public class WarehouseBackendApplication {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @Autowired
    private SystemConstants constants;

    public static void main(String[] args) {
        SpringApplication.run(WarehouseBackendApplication.class, args);
    }

    /**
     * 在运行后自动执行，用于sysconfig的反射
     */
    @PostConstruct
    public void init(){
        List<SysConfig> list=sysConfigMapper.selectAllParam();
        list.forEach(one->{
            String key=one.getParamKey();
            key= StrUtil.toCamelCase(key);
            String value=one.getParamValue();
            try{
                Field field=constants.getClass().getDeclaredField(key);
                field.set(constants,value);
                System.out.println(field);
            }catch (Exception e){
                log.error("执行异常",e);
            }
        });
    }
}
