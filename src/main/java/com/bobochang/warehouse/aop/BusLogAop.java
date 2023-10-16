package com.bobochang.warehouse.aop;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.entity.BusLogDao;
import com.bobochang.warehouse.service.impl.BusLogServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.json.JsonMapper;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
@Aspect
@Slf4j
public class BusLogAop implements Ordered {
    @Autowired
    private BusLogServiceImpl busLogService;


    public static final String path= "D:/project/warehouse/warehouse-backend/log/";

    /**
     * 定义BusLogAop的切入点为标记@BusLog注解的方法
     */
    @Pointcut(value = "@annotation(com.bobochang.warehouse.annotation.BusLog)")
    public void pointcut() {
    }

    /**
     * 业务操作环绕通知
     *
     * @param proceedingJoinPoint
     * @retur
     */
    @Around("pointcut()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) {
        log.info("----BusAop 环绕通知 start");
        //执行目标方法
        Object result = null;
        try {
            result = proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        //目标方法执行完成后，获取目标类、目标方法上的业务日志注解上的功能名称和功能描述
        Object target = proceedingJoinPoint.getTarget();
        MethodSignature signature = (MethodSignature) proceedingJoinPoint.getSignature();
        BusLog anno1 = target.getClass().getAnnotation(BusLog.class);
        BusLog anno2 = signature.getMethod().getAnnotation(BusLog.class);
        BusLogDao busLogBean = new BusLogDao();
        String logName = anno1.name();
        String logDescrip = anno2.descrip();
        String operPerson = anno2.operPerson();
        busLogBean.setBusName(logName);
        busLogBean.setBusDescrip(logDescrip);
        busLogBean.setOperPerson(operPerson);
        busLogBean.setOperTime(new Date());
        String text = operPerson + "-" + logName + "-" + new Date();
        //把参数报文写入到文件中
        OutputStream outputStream = null;
        try {
            // String paramFilePath = System.getProperty("user.dir") + File.separator + DateUtil.format(new Date(), DatePattern.PURE_DATETIME_MS_PATTERN) + ".log";
            String paramFilePath = path + logName + File.separator + DateUtil.format(new Date(), DatePattern.PURE_DATE_FORMATTER) + ".log";
            // todo 判断当前文件夹是否存在 若存在则追加 反之创建
//            File dirFile = new File(path + logName);
            outputStream = new FileOutputStream(paramFilePath);
            outputStream.write(text.getBytes(StandardCharsets.UTF_8));
//            busLogBean.setParamFile(paramFilePath);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.flush();
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        //保存业务操作日志信息
//        this.busLogDao.insert(busLogBean);
        busLogService.insert(busLogBean);
        log.info("----BusAop 环绕通知 end");
        return result;
    }

    @Override
    public int getOrder() {
        return 1;
    }
}
