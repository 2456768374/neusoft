package com.neusoft.service.impl;

import com.neusoft.dao.FactoryMapper;

import com.neusoft.entity.Factory;

import com.neusoft.service.FactoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("factoryService")
public class FactoryServiceimpl implements FactoryService {
    @Autowired
    private FactoryMapper factoryMapper;


    @Override
    public Factory getUser(String uname, String upwd) {
        return factoryMapper.selectByUnameAndUpwd(uname, upwd);
    }

    @Override
    public Factory getUser1(String uname) {
        return factoryMapper.selectByPrimaryKey(uname);
    }

    @Override
    public Factory getUser2(String ufty) {
        return factoryMapper.selectByUfty(ufty);
    }

    @Override
    public void insert(Factory record) {
        factoryMapper.insert(record);
    }
}
