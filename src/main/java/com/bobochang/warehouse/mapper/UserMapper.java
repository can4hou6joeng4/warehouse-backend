package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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

    //查询用户总行数的方法
    public int selectUserCount(User user);

    //分页查询用户的方法
    public List<User> selectUserPage(Page page, User user);
}
