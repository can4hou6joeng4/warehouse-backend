package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * @TableName checkin
 */
@TableName(value = "checkin")
@Data
public class Checkin implements Serializable {
    /**
     *
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     *
     */
    private Integer userId;

    /**
     *
     */
    private String address;
    private String workAddr;
    private String offAddr;

    /**
     *
     */
    private Integer status;

    /**
     *
     */
    private Integer risk;

    /**
     *
     */
    private Date date;

    private Date workTime;
    private Date offTime;
    private Integer identification;
    private String brand;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}