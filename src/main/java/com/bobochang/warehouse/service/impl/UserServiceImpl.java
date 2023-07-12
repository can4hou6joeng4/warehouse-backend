package com.bobochang.warehouse.service.impl;


import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.entity.User;
import com.bobochang.warehouse.mapper.UserMapper;
import com.bobochang.warehouse.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 2023/7/12 - 10:07
 *
 * @author bobochang
 * @description
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User findUserByCode(String userCode) {
        return userMapper.findUserByCode(userCode);
    }

    @Override
    public Page queryUserPage(Page page, User user) {
        //查询用户总行数
        int userCount = userMapper.selectUserCount(user);

        //分页查询用户
        List<User> userList = userMapper.selectUserPage(page, user);

        //将查询到的总行数和当前页数据组装到Page对象
        page.setTotalNum(userCount);
        page.setResultList(userList);

        return page;
    }
}
