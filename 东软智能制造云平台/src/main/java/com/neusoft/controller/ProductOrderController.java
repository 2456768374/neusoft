package com.neusoft.controller;

import com.alibaba.fastjson.JSONObject;
import com.neusoft.entity.Factory;
import com.neusoft.entity.Product;
import com.neusoft.entity.ProductOrder;
import com.neusoft.entity.ProductPlan;
import com.neusoft.service.ProductOrderService;
import com.neusoft.service.ProductPlanService;
import com.neusoft.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/order")
public class ProductOrderController {
    @Autowired
    private ProductOrderService productOrderService;
    @Autowired
    private ProductPlanService productPlanService;
    @Autowired
    private ProductService productService;

    //Ajax测试，查询所有并返回JSON数据---本次未使用
    @RequestMapping("/select")
    public  @ResponseBody String get(@RequestParam("order_num") String order_num, @RequestParam("product_num") String product_num,
                                     HttpServletRequest request, HttpServletResponse response) throws IOException {
        order_num=request.getParameter("order_num");
        product_num=request.getParameter("product_num");
        List<ProductOrder> productOrders= productOrderService.selectByNumAndStatus(order_num, product_num);
        System.out.println(productOrders);
        return JSONObject.toJSONString(productOrders);

    }
    //Ajax测试，查询所有并返回JSON数据---本次未使用
    @RequestMapping("/all")
    public  @ResponseBody String getall(){
        List<ProductOrder> productOrders= productOrderService.selectAll();
        System.out.println(productOrders);
        return JSONObject.toJSONString(productOrders);

    }
    //selecta，注意有小写字母a
    //查询所有订单并返回到order页面
    @RequestMapping("/selecta")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("order");
//        modelAndView.addObject("title", "This is a title!");
        List<ProductOrder> productOrders= productOrderService.selectAll();
        modelAndView.addObject("productOrders",productOrders);
        return modelAndView;
    }
    //条件查询
    @RequestMapping("/selectByNumAndStatus2")
    public ModelAndView selectByNumAndStatus2(@RequestParam("order_num") String order_num,
                                              @RequestParam("order_status") String order_status,
                                              HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("order");
//        modelAndView.addObject("title", "This is a title!");
        List<ProductOrder> productOrders= productOrderService.selectByNumAndStatus2(order_num, order_status);

        return modelAndView;
    }
    //添加订单，并返回到order页面，此时页面无内容，需要点击“显示全部”来刷新页面
    @RequestMapping("/add")
    public ModelAndView add(@RequestParam("order_num") String order_num, @RequestParam("order_source") String order_source,
                        @RequestParam("product_num") String product_num, @RequestParam("product_count") String product_count,
                        @RequestParam("end_date") String end_date, @RequestParam("order_status") String order_status,
                        HttpServletRequest request, HttpServletResponse response) throws IOException {
            ProductOrder productOrder=new ProductOrder();
            productOrder.setOrderNum(order_num);
            productOrder.setOrderSource(order_source);
            productOrder.setProductNum(product_num);
            productOrder.setProductCount(product_count);
            productOrder.setEndDate(end_date.toString());
            productOrder.setOrderStatus(order_status);

            List<ProductOrder> productOrders=productOrderService.selectByNum(order_num);
            if (productOrders.size()==0){
                int rrr= productOrderService.insertSelective(productOrder);
                System.out.println("订单创建成功！");
            }else {
                System.out.println("此订单编号已存在");
            }
            ModelAndView modelAndView=new ModelAndView("order");
            return modelAndView;
    }
    //实现“接单”功能,就是把状态为10的改为20
    @RequestMapping("/updateByStatus")
    public ModelAndView updateByStatus(@RequestParam("order_num") String order_num){
            int rrr=productOrderService.updateByStatus(order_num);

            System.out.println(rrr);
            ModelAndView modelAndView=new ModelAndView("order");
            return modelAndView;
    }
    //实现拒单功能
    @RequestMapping("updateByStatus2")
    public ModelAndView updateByStatus2(@RequestParam("order_num") String order_num){
        int rrr=productOrderService.updateByStatus2(order_num);

        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("order");
        return  modelAndView;
    }
    //完成订单 并且将生产计划完成
    @RequestMapping("updateByStatus3")
    public ModelAndView updateByStatus3(@RequestParam("order_num") String order_num){
        int rrr=productOrderService.updateByStatus3(order_num);
        int ggg=productPlanService.updateByStatus2(order_num);

        ModelAndView modelAndView=new ModelAndView("order");
        return  modelAndView;
    }
    //转为生产计划
    @RequestMapping("transplan")
    public ModelAndView transplan(@RequestParam("plan_num") String plan_num, @RequestParam("order_num") String order_num,
                                  @RequestParam("product_num") String product_num, @RequestParam("plan_count") String plan_count,
                                  @RequestParam("plan_start_date") String plan_start_date, @RequestParam("plan_end_date") String plan_end_date,
                                  @RequestParam("plan_status") String plan_status){
        ProductPlan productPlan=new ProductPlan();
        productPlan.setPlanNum(plan_num);
        productPlan.setOrderNum(order_num);
        productPlan.setProductNum(product_num);
        productPlan.setPlanCount(plan_count);
        productPlan.setPlanStartDate(plan_start_date.toString());
        productPlan.setPlanEndDate(plan_end_date.toString());
        productPlan.setPlanStatus(plan_status);

        List<ProductPlan> productPlans=productPlanService.selectByPlan(plan_num);
        if (productPlans.size()==0){
            int rrr=productPlanService.insertSelective(productPlan);
            System.out.println("计划创建成功！");
        }else{
            System.out.println("该计划已存在！");
        }


        ModelAndView modelAndView=new ModelAndView("order");
        return modelAndView;

    }





}
