package com.neusoft.dao;

import com.neusoft.entity.ProductOrder;

public interface ProductOrderMapper {
    int insert(ProductOrder record);

    int insertSelective(ProductOrder record);
}