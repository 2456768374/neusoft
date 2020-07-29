package com.neusoft.service.impl;

import com.neusoft.dao.OrderTrackMapper;
import com.neusoft.entity.OrderTrack;
import com.neusoft.service.OrderTrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ordertrackService")
public class OrderTrackServiceImpl implements OrderTrackService {
    @Autowired
    public OrderTrackMapper orderTrackMapper;

    @Override
    public int insertSelective(OrderTrack record) {
        return orderTrackMapper.insertSelective(record);
    }

    @Override
    public List<OrderTrack> selectAll() {
        return orderTrackMapper.selectAll();
    }

    @Override
    public int update(String schedule_num, String equment_num, String hege_count, String jiagong_vount) {
        return orderTrackMapper.update(schedule_num, equment_num, hege_count, jiagong_vount);
    }

    @Override
    public int updateByNum(String schedule_num) {
        return orderTrackMapper.updateByNum(schedule_num);
    }


}
