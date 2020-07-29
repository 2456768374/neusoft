package com.neusoft.service;

import com.neusoft.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectAll();

    List<Product> selectByNum(String product_num);

    List<Product> selectByName(String product_name);

    int deleteByNum(String product_num);
}
