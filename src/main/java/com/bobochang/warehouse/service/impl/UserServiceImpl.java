package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.User;
import com.bobochang.warehouse.mapper.UserMapper;
import com.bobochang.warehouse.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
