package com.neusoft.dao;

import com.neusoft.entity.OrderTrack;

public interface OrderTrackMapper {
    int insert(OrderTrack record);

    int insertSelective(OrderTrack record);
}