package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;

/**
* @author HuihuaLi
* @description 针对表【product(商品表)】的数据库操作Service
* @createDate 2023-10-20 15:37:44
*/
public interface ProductService extends IService<Product> {
    //分页查询商品的业务方法
    public Page queryProductPage(Page page, Product product);

//    //添加商品的业务方法
//    public Result saveProduct(Product product);
//
//    //修改商品上下架状态的业务方法
//    public Result updateProductState(Product product);
//
//    //删除商品的业务方法
//    public Result deleteProduct(Integer productId);
//
//    //修改商品的业务方法
//    public Result updateProduct(Product product);
}
