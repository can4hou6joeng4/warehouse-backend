package com.bobochang.warehouse.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 合同表
 * @TableName contract
 */
@TableName(value ="contract")
@Data
public class Contract implements Serializable {
    /**
     * 仓库id
     */
    @TableId(type = IdType.AUTO)
    private Integer contractId;

    /**
     * 仓库名称
     */
    private String contractName;

    /**
     * 仓库介绍
     */
    private String contractDesc;

    /**
     * 0未审核、1 待结算 、2 结算中、 3 已结算
     */
    private String contractState;

    /**
     * 关联工区
     */
    private String associatedArea;

    /**
     * 相关附件
     */
    private String files;

    /**
     *
     */
    private Date createTime;

    /**
     * 
     */
    private Date updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}