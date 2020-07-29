package com.neusoft.service.impl;

import com.neusoft.dao.ProductMapper;
import com.neusoft.entity.Product;
import com.neusoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    public ProductMapper productMapper;


    @Override
    public int insert(Product record) {
        return productMapper.insert(record);
    }

    @Override
    public int insertSelective(Product record) {
        return productMapper.insertSelective(record);
    }

    @Override
    public List<Product> selectAll() {
        return productMapper.selectAll();
    }

    @Override
    public List<Product> selectByNum(String product_num) {
        return productMapper.selectByNum(product_num);
    }

    @Override
    public List<Product> selectByName(String product_name) {
        return productMapper.selectByName(product_name);
    }

    @Override
    public int deleteByNum(String product_num) {
        return productMapper.deleteByNum(product_num);
    }
}
