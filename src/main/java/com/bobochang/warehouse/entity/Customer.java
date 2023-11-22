package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName customer
 */
@TableName(value ="customer")
@Data
public class Customer implements Serializable {
    /**
     * 客户id
     */
    @TableId(type = IdType.AUTO)
    private Integer customerId;

    /**
     * 客户名称
     */
    private String customerName;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}