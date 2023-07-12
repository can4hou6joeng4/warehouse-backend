package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Auth;

import java.util.List;

/**
 * 2023/7/12 - 11:12
 *
 * @author bobochang
 * @description
 */
public interface AuthService {

    public List<Auth> findAuthTree(Integer userId);
}
