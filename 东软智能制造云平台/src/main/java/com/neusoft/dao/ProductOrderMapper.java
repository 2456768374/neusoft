package com.neusoft.dao;

import com.neusoft.entity.ProductOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductOrderMapper {
    int insert(ProductOrder record);

    int insertSelective(ProductOrder record);

    List<ProductOrder> selectByNumAndStatus(@Param("order_num") String order_num, @Param("product_num") String product_num);

    List<ProductOrder> selectAll();

    List<ProductOrder> selectByNum(@Param("order_num") String order_num);

    int updateByStatus(@Param("order_num") String order_num);

    int updateByStatus2(@Param("order_num") String order_num);

    int updateByStatus3(@Param("order_num") String order_num);

    int updateByStatus4(@Param("order_num") String order_num);

    List<ProductOrder> selectByNumAndStatus2(@Param("order_num") String order_num, @Param("order_status") String order_status);

    public List<Map<String, Object>> queryForList();

    public List<Map<String, Object>> pie();

}