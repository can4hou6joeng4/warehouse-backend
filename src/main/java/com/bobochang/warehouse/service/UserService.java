package com.bobochang.warehouse.service;

import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.entity.User;

/**
 * 2023/7/12 - 10:06
 *
 * @author bobochang
 * @description
 */
public interface UserService {

    public User findUserByCode(String userCode);

    public Page queryUserPage(Page page, User user);


}
