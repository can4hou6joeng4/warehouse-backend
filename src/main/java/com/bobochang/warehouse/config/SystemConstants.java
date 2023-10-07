package com.bobochang.warehouse.config;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * SystemConstants
 * @author LI
 * 记录考勤时间的反射类
 */
@Data
@Component
public class SystemConstants {
    public String attendanceStartTime;
    public String attendanceTime;
    public String attendanceEndTime;
    public String closingStartTime;
    public String closingTime;
    public String closingEndTime;
}
