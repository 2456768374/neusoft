package com.neusoft.dao;

import com.neusoft.entity.Factory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FactoryMapper {
    int insert(Factory record);

    int insertSelective(Factory record);

    Factory selectByUnameAndUpwd(@Param("uname") String uname, @Param("upwd") String upwd);

    Factory selectByPrimaryKey(@Param("uname")String uname);

    Factory selectByUfty(@Param("ufty")String ufty);

    List<Factory> selectAll();
}