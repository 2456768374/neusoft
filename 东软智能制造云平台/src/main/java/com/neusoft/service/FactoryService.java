package com.neusoft.service;


import com.neusoft.entity.Factory;

public interface FactoryService {
    Factory getUser(String uname, String upwd);

    Factory getUser1(String uname);

    Factory getUser2(String ufty);

    void insert(Factory record);
}


