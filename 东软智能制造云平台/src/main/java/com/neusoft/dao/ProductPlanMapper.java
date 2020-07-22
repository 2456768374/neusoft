package com.neusoft.dao;

import com.neusoft.entity.ProductPlan;

public interface ProductPlanMapper {
    int insert(ProductPlan record);

    int insertSelective(ProductPlan record);
}