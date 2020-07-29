package com.neusoft.dao;

import com.neusoft.entity.ProductSchedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductScheduleMapper {
    int insert(ProductSchedule record);

    int insertSelective(ProductSchedule record);

    List<ProductSchedule> selectAll();

    List<ProductSchedule> selectByNum(@Param("schedule_num") String schedule_num );

    int updateByStatus(@Param("schedule_num") String schedule_num);

    int deleteByNum(@Param("schedule_num") String schedule_num, @Param("equipment_num") String equipment_num);

    List<ProductSchedule> selectByEqu(@Param("equipment_num") String equipment_num);

    int updateByNum(@Param("schedule_num") String schedule_num);
}