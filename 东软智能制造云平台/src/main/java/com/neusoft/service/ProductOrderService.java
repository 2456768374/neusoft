package com.neusoft.service;

import com.neusoft.entity.ProductOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductOrderService {


    List<ProductOrder> selectByNumAndStatus(String order_num,String product_num);

    List<ProductOrder> selectAll();

    List<ProductOrder> selectByNum(String order_num);

    int insertSelective(ProductOrder record);

    int insert(ProductOrder record);

    int updateByStatus(String order_num);

    int updateByStatus2(String order_num);

    int updateByStatus3(String order_num);

    int updateByStatus4(String order_num);

    List<ProductOrder> selectByNumAndStatus2(String order_num, String order_status);
}
