package com.neusoft.service;

import com.neusoft.entity.ProductSchedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductScheduleService {

    int insertSelective(ProductSchedule record);

    List<ProductSchedule> selectAll();

    List<ProductSchedule> selectByNum(String schedule_num);

    int updateByStatus(String schedule_num);

    int deleteByNum(String schedule_num, String equipment_num);

    List<ProductSchedule> selectByEqu(String equipment_num);

    int updateByNum(String schedule_num);

}
