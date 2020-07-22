package com.neusoft.dao;

import com.neusoft.entity.Equipment;

public interface EquipmentMapper {
    int insert(Equipment record);

    int insertSelective(Equipment record);
}