package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.FaceModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FaceModelMapper {
    // 查找用户的人脸模型
    public String searchFaceModel(int userId);

    // 判断是否有人脸模型
    public Integer haveFace(int userId);

    // 添加用户的人脸模型
    public void insert(FaceModel faceModel);

    // 删除用户的人脸模型
    public int deleteFaceModel(int userId);
}