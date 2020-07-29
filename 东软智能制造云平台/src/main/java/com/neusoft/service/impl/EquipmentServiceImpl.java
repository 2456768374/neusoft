package com.neusoft.service.impl;

import com.neusoft.dao.EquipmentMapper;
import com.neusoft.entity.Equipment;
import com.neusoft.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService{
    @Autowired
    public EquipmentMapper equipmentMapper;


    @Override
    public List<Equipment> selectAll() {
        return equipmentMapper.selectAll();
    }

    @Override
    public int insert(Equipment record) {
        return equipmentMapper.insert(record);
    }

    @Override
    public int insertSelective(Equipment record) {
        return equipmentMapper.insertSelective(record);
    }

    @Override
    public List<Equipment> selectByNum(String equipment_num) {
        return equipmentMapper.selectByNum(equipment_num);
    }

    @Override
    public int deleteByNum(String equipment_num) {
        return equipmentMapper.deleteByNum(equipment_num);
    }

    @Override
    public int update(String equipment_num) {
        return equipmentMapper.update(equipment_num);
    }

    @Override
    public int update2(String equipment_num) {
        return equipmentMapper.update2(equipment_num);
    }
}
