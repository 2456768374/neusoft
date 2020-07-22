package com.neusoft.dao;

import com.neusoft.entity.Factory;
import org.apache.ibatis.annotations.Param;

public interface FactoryMapper {
    int insert(Factory record);

    int insertSelective(Factory record);

    Factory selectByPrimaryKey(@Param("username")String uname);

    Factory selectByUnameAndPwd(@Param("uname") String uname, @Param("upwd") String upwd);

    Factory selectByUfty(@Param("ufty")String ufty);
}