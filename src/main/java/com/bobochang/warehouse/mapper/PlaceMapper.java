package com.bobochang.warehouse.mapper;


import com.bobochang.warehouse.entity.Place;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlaceMapper {

    //查询所有产地
    public List<Place> findAllPlace();
}
