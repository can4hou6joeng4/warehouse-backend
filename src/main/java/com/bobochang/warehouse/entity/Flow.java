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

    //部署状态：1=进行中，0=已结束
    private Integer state;

    private Date createTime;

}
