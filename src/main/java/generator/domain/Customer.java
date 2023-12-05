package generator.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
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

    /**
     * 联系人
     */
    private String concat;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 地址
     */
    private String address;

    /**
     * 是否启用：0:可用  1:不可用
     */
    private String isDelete;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}