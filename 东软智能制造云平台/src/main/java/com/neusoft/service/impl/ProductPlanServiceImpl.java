package com.neusoft.service.impl;

import com.neusoft.dao.ProductPlanMapper;
import com.neusoft.entity.ProductPlan;
import com.neusoft.service.ProductPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productplanService")
public class ProductPlanServiceImpl implements ProductPlanService {
    @Autowired
    public ProductPlanMapper productPlanMapper;

    @Override
    public int insertSelective(ProductPlan record) {
        return productPlanMapper.insertSelective(record);
    }

    @Override
    public List<ProductPlan> selectAll() {
        return productPlanMapper.selectAll();
    }

    @Override
    public int updateByStatus(String plan_num) {
        return productPlanMapper.updateByStatus(plan_num);
    }

    @Override
    public int deleteByNum(String plan_num) {
        return productPlanMapper.deleteByNum(plan_num);
    }

    @Override
    public List<ProductPlan> selectByNum(String product_num) {
        return productPlanMapper.selectByNum(product_num);
    }

    @Override
    public int updateByStatus2(String order_num) {
        return productPlanMapper.updateByStatus2(order_num);
    }

    @Override
    public List<ProductPlan> selectByPlan(String plan_num) {
        return productPlanMapper.selectByPlan(plan_num);
    }
}
