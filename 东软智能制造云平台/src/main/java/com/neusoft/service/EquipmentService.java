package com.neusoft.service;

import com.neusoft.entity.Equipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EquipmentService {

    List<Equipment> selectAll();

    int insert(Equipment record);

    int insertSelective(Equipment record);

    List<Equipment> selectByNum(String equipment_num);

    int deleteByNum(String equipment_num);

    int update(String equipment_num);

    int update2(String equipment_num);
}
