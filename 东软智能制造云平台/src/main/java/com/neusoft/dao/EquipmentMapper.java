package com.neusoft.dao;

import com.neusoft.entity.Equipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EquipmentMapper {
    int insert(Equipment record);

    int insertSelective(Equipment record);

    List<Equipment> selectAll();

    List<Equipment> selectByNum(@Param("equipment_num") String equipment_num);

    int deleteByNum(@Param("equipment_num") String equipment_num);

    int update(@Param("equipment_num") String equipment_num);

    int update2(@Param("equipment_num") String equipment_num);

    public List<Map<String, Object>> get();
}