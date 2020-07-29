package com.neusoft.dao;

import com.neusoft.entity.OrderTrack;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface OrderTrackMapper {
    int insert(OrderTrack record);

    int insertSelective(OrderTrack record);

    List<OrderTrack> selectAll();

    int update(@Param("schedule_num") String schedule_num, @Param("equment_num") String equment_num,
               @Param("hege_count") String hege_count, @Param("jiagong_vount") String jiagong_vount);

    int updateByNum(@Param("schedule_num") String schedule_num);

}