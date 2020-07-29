package com.neusoft.service;

import com.neusoft.entity.OrderTrack;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderTrackService {

    int insertSelective(OrderTrack record);

    List<OrderTrack> selectAll();

    int update(String schedule_num, String equment_num, String hege_count,String jiagong_vount);

    int updateByNum(String schedule_num);
}
