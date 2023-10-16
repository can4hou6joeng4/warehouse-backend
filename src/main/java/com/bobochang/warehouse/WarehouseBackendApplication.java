package com.bobochang.warehouse;

import com.bobochang.warehouse.config.SystemConstants;
import com.bobochang.warehouse.entity.SysConfig;
import com.bobochang.warehouse.mapper.SysConfigMapper;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import cn.hutool.core.util.StrUtil;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;


import javax.annotation.PostConstruct;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MapperScan("com.bobochang.warehouse.mapper")
@SpringBootApplication(exclude = { SecurityAutoConfiguration.class,
        SecurityAutoConfiguration.class,
        ManagementWebSecurityAutoConfiguration.class
})
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
        /*
          考勤时间设定
         */
        List<SysConfig> list=sysConfigMapper.selectAllParam();
        list.forEach(one->{
            String key=one.getParamKey();
            key= StrUtil.toCamelCase(key);
            String value=one.getParamValue();
            try{
                Field field=constants.getClass().getDeclaredField(key);
                field.set(constants,value);
            }catch (Exception e){
                log.error("执行异常",e);
            }
        });
    }
}
