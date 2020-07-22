package com.neusoft.dao;

import com.neusoft.entity.Product;

public interface ProductMapper {
    int insert(Product record);

    int insertSelective(Product record);
}