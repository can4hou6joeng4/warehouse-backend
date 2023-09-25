package com.bobochang.warehouse.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 合同表
 *
 * @TableName contract
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Contract implements Serializable {
    /**
     *
     */
    private Integer contractId;

    /**
     *
     */
    private String contractName;

    /**
     *
     */
    private String contractDesc;

    /**
     * 1 待结算 、2 结算中、 3 已结算
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
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     *
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}