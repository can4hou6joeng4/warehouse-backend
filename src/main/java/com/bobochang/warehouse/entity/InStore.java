package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 入库单
 * @TableName in_store
 */
@TableName(value ="in_store")
@Data
public class InStore implements Serializable {
    /**
     * 入库单id
     */
    @TableId(type = IdType.AUTO)
    private Integer insId;

    /**
     * 仓库id
     */
    private Integer storeId;

    /**
     * 原材料id
     */
    private Integer materialId;

    /**
     * 入库数量/公司数量
     */
    private Integer inNum;

    /**
     * 对方数量
     */
    private Integer relativeNum;

    /**
     * 单价
     */
    private BigDecimal price;

    /**
     * 运费单价
     */
    private BigDecimal freight;

    /**
     * 入库车牌号
     */
    private String carNumber;

    /**
     * 所属合同id
     */
    private Integer contractId;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 创建人
     */
    private Integer createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 0 否 1 是
     */
    private String isIn;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}