package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Holidays;
import com.bobochang.warehouse.service.HolidaysService;
import com.bobochang.warehouse.mapper.HolidaysMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【holidays】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class HolidaysServiceImpl extends ServiceImpl<HolidaysMapper, Holidays>
    implements HolidaysService{

}



