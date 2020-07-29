package com.neusoft.service;

import com.neusoft.entity.ProductPlan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductPlanService {

    int insertSelective(ProductPlan record);

    List<ProductPlan> selectAll();

    int updateByStatus(String plan_num);

    int deleteByNum(String plan_num);

    List<ProductPlan> selectByNum(String product_num);

    int updateByStatus2(String order_num);

    List<ProductPlan> selectByPlan(String plan_num);
}
