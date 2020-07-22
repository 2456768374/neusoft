package com.neusoft.dao;

import com.neusoft.entity.ProductSchedule;

public interface ProductScheduleMapper {
    int insert(ProductSchedule record);

    int insertSelective(ProductSchedule record);
}