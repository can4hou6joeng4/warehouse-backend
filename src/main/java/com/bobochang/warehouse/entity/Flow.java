package com.bobochang.warehouse.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author LI
 * @date 2023年10月10日
 */
@Data
public class Flow {

    private Integer id;

    //流程id
    private String instanceId;

    //合同id
    private int contractId;

    //采购单id
    private int purchaseId;

    //入库单id
    private int inStoreId;

    //出库单id
    private int outStoreId;

    //流程状态：0：无需采购，1：需要采购
    private Integer state;

    private Date createTime;

}
