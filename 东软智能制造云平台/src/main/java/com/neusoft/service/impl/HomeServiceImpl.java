package com.neusoft.service.impl;

import com.neusoft.dao.EquipmentMapper;
import com.neusoft.dao.ProductOrderMapper;
import com.neusoft.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("homeService")
public class HomeServiceImpl implements HomeService {
    @Autowired
    private ProductOrderMapper productOrderMapper;

    @Autowired
    private EquipmentMapper equipmentMapper;

    public List<Map<String, Object>> queryForList() {
        return productOrderMapper.queryForList();
    }

    public List<Map<String, Object>> pie() {
        return productOrderMapper.pie();
    }

    public List<Map<String, Object>> get() {
        return equipmentMapper.get();
    }
}
