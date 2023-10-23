package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 
 * @TableName material_supply
 */
@TableName(value ="material_supply")
@Data
public class MaterialSupply implements Serializable {
    /**
     * 
     */
    @TableId
    private Integer id;

    /**
     * 材料id
     */
    private Integer materialId;

    /**
     * 供应商id
     */
    private Integer supplyId;

    /**
     * 报价
     */
    private BigDecimal quotation;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}