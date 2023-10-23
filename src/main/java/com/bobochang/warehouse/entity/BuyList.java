package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 采购单
 * @TableName buy_list
 */
@TableName(value ="buy_list")
@Data
public class BuyList implements Serializable {
    /**
     * 采购id
     */
    @TableId(type = IdType.AUTO)
    private Integer buyId;

    /**
     * 材料id
     */
    private Integer materialId;

    /**
     * 仓库id
     */
    private Integer storeId;

    /**
     * 实际购买数量
     */
    private Integer buyNum;

    /**
     * 计划购买数量
     */
    private Integer factBuyNum;

    /**
     * 采购时间
     */
    private Date buyTime;

    /**
     * 购买人
     */
    private String buyUser;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 所属合同id
     */
    private Integer contractId;

    /**
     * 0 否 1 是
     */
    private String isIn;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}