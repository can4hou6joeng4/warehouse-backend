package com.bobochang.warehouse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 出库单
 * @TableName out_store
 */
@TableName(value ="out_store")
@Data
public class OutStore implements Serializable {
    /**
     * 出库单id
     */
    @TableId(type = IdType.AUTO)
    private Integer outsId;

    /**
     * 产品id
     */
    private Integer productId;

    /**
     * 仓库id
     */
    private Integer storeId;

    /**
     * 出库数量
     */
    private Integer outNum;

    /**
     * 工区名称
     */
    private String workRegion;

    /**
     * 客户
     */
    private String custom;

    /**
     * 所属合同id
     */
    private Integer contractId;

    /**
     * 出库车牌
     */
    private String carNumber;

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
    private String isOut;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}