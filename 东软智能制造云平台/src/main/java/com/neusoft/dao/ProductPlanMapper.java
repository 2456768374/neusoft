package com.neusoft.dao;

import com.neusoft.entity.ProductPlan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductPlanMapper {
    int insert(ProductPlan record);

    int insertSelective(ProductPlan record);

    List<ProductPlan> selectAll();

    int updateByStatus(@Param("plan_num") String plan_num);

    int deleteByNum(@Param("plan_num") String plan_num);

    List<ProductPlan> selectByNum(@Param("product_num") String product_num);

    int updateByStatus2(@Param("order_num") String order_num);

    List<ProductPlan> selectByPlan(@Param("plan_num") String plan_num);

}