package com.neusoft.service.impl;

import com.neusoft.dao.ProductOrderMapper;
import com.neusoft.entity.ProductOrder;
import com.neusoft.service.ProductOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productOrderService")
public class ProductOrderServiceimpl implements ProductOrderService {
    @Autowired
    public ProductOrderMapper productOrderMapper;

    @Override
    public List<ProductOrder> selectByNumAndStatus(String order_num, String product_num) {
        return productOrderMapper.selectByNumAndStatus(order_num, product_num);
    }

    @Override
    public List<ProductOrder> selectAll() {
        return productOrderMapper.selectAll();
    }

    @Override
    public List<ProductOrder> selectByNum(String order_num) {
        return productOrderMapper.selectByNum(order_num);
    }

    @Override
    public int insertSelective(ProductOrder record) {
        return productOrderMapper.insertSelective(record);
    }

    @Override
    public int insert(ProductOrder record) {
        return productOrderMapper.insert(record);
    }

    @Override
    public int updateByStatus(String order_num) {
        return productOrderMapper.updateByStatus(order_num);
    }

    @Override
    public int updateByStatus2(String order_num) {
        return productOrderMapper.updateByStatus2(order_num);
    }

    @Override
    public int updateByStatus3(String order_num) {
        return productOrderMapper.updateByStatus3(order_num);
    }

    @Override
    public int updateByStatus4(String order_num) {
        return productOrderMapper.updateByStatus4(order_num);
    }

    @Override
    public List<ProductOrder> selectByNumAndStatus2(String order_num, String order_status) {
        return productOrderMapper.selectByNumAndStatus2(order_num, order_status);
    }


}
