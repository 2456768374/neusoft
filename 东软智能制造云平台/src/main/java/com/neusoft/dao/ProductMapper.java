package com.neusoft.dao;

import com.neusoft.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectAll();

    List<Product> selectByNum(@Param("product_num") String product_num);

    List<Product> selectByName(@Param("product_name") String product_name);

    int deleteByNum(@Param("product_num") String product_num);
}