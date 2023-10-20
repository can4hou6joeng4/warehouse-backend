package com.bobochang.warehouse.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 权限表
 * @TableName auth_info
 */
@TableName(value ="auth_info")
@Data
public class AuthInfo implements Serializable {
    /**
     * 权限id
     */
    @TableId(type = IdType.AUTO)
    private Integer authId;

    /**
     * 父id为空或为0，表示一级权限
     */
    private Integer parentId;

    /**
     * 权限名称
     */
    private String authName;

    /**
     * 权限介绍
     */
    private String authDesc;

    /**
     * 
     */
    private Integer authGrade;

    /**
     * 1 模块 、2  列表、 3  按钮
     */
    private String authType;

    /**
     * 
     */
    private String authUrl;

    /**
     * 
     */
    private String authCode;

    /**
     * 
     */
    private Integer authOrder;

    /**
     * 1 启用 、0 禁用
     */
    private String authState;

    /**
     * 
     */
    private Integer createBy;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private Integer updateBy;

    /**
     * 
     */
    private Date updateTime;

    //追加的List<Auth>集合属性 -- 用于存储当前权限(菜单)的子级权限(菜单)
    private List<AuthInfo> childAuth;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}