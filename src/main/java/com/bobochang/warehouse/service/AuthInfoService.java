package com.bobochang.warehouse.service;

import com.bobochang.warehouse.domain.AuthInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author magic'book
* @description 针对表【auth_info(权限表)】的数据库操作Service
* @createDate 2023-10-19 17:22:39
*/
public interface AuthInfoService extends IService<AuthInfo> {
    List<AuthInfo> findAuthTree(Integer userId);
}
