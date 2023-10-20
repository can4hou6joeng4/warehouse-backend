package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.RoleAuth;
import com.bobochang.warehouse.service.RoleAuthService;
import com.bobochang.warehouse.mapper.RoleAuthMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【role_auth(角色权限表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class RoleAuthServiceImpl extends ServiceImpl<RoleAuthMapper, RoleAuth>
    implements RoleAuthService{

}



