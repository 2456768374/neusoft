package com.neusoft.dao;

import com.neusoft.entity.EquipmentProduct;

public interface EquipmentProductMapper {
    int insert(EquipmentProduct record);

    int insertSelective(EquipmentProduct record);
}