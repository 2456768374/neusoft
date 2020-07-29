package com.neusoft.service.impl;

import com.neusoft.dao.ProductScheduleMapper;
import com.neusoft.entity.ProductSchedule;
import com.neusoft.service.ProductScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productscheduleServic")
public class ProductScheduleServiceImpl implements  ProductScheduleService{
    @Autowired
    public ProductScheduleMapper productScheduleMapper;

    @Override
    public int insertSelective(ProductSchedule record) {
        return productScheduleMapper.insertSelective(record);
    }

    @Override
    public List<ProductSchedule> selectAll() {
        return productScheduleMapper.selectAll();
    }

    @Override
    public List<ProductSchedule> selectByNum(String schedule_num) {
        return productScheduleMapper.selectByNum(schedule_num);
    }


    @Override
    public int updateByStatus(String schedule_num) {
        return productScheduleMapper.updateByStatus(schedule_num);
    }

    @Override
    public int deleteByNum(String schedule_num, String equipment_num) {
        return productScheduleMapper.deleteByNum(schedule_num, equipment_num);
    }

    @Override
    public List<ProductSchedule> selectByEqu(String equipment_num) {
        return productScheduleMapper.selectByEqu(equipment_num);
    }

    @Override
    public int updateByNum(String schedule_num) {
        return productScheduleMapper.updateByNum(schedule_num);
    }

}
