package com.bobochang.warehouse.entity;

import com.bobochang.warehouse.mapper.BusLogMapper;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author bobochang
 * @Description
 * @Date 2023/10/16 - 14:46
 */
@Data
public class BusLogDao {
    private String busName;

    private String busDescrip;

    private String operPerson;

    private Date operTime;
}
