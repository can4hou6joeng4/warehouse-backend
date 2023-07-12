package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 2023/7/12 - 10:02
 *
 * @author bobochang
 * @description
 */
@Mapper
public interface UserMapper {

    // 根据账号查询用户信息
    public User findUserByCode(String userCode);
}
