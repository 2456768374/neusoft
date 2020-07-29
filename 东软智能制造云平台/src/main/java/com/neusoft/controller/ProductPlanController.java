package com.neusoft.controller;

import com.neusoft.dao.ProductScheduleMapper;
import com.neusoft.entity.ProductOrder;
import com.neusoft.entity.ProductPlan;
import com.neusoft.entity.ProductSchedule;
import com.neusoft.service.ProductOrderService;
import com.neusoft.service.ProductPlanService;
import com.neusoft.service.ProductScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/plan")
public class ProductPlanController {
    @Autowired
    private ProductPlanService productPlanService;
    @Autowired
    private ProductScheduleService productScheduleService;
    @Autowired
    private ProductOrderService productOrderService;
//查看全部
    @RequestMapping("/selecta")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("plan");
//        modelAndView.addObject("title", "This is a title!");
        List<ProductPlan> productPlans= productPlanService.selectAll();
        modelAndView.addObject("productPlans",productPlans);
        return modelAndView;
    }
    //启动 同时把订单状态转为生产中
    @RequestMapping("/updateByStatus")
    public ModelAndView updateByStatus(@RequestParam("plan_num") String plan_num, @RequestParam("order_num") String order_num){
        int rrr=productPlanService.updateByStatus(plan_num);
        int ggg=productOrderService.updateByStatus4(order_num);

        ModelAndView modelAndView=new ModelAndView("plan");
        return modelAndView;
    }
    //删除
    @RequestMapping("/deleteByNum")
    public ModelAndView deleteByNum(@RequestParam("plan_num") String plan_num){
        int rrr=productPlanService.deleteByNum(plan_num);

        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("plan");
        return modelAndView;
    }
    //进行生产调度
    @RequestMapping("/transchedule")
    public ModelAndView transchedule(@RequestParam("plan_num") String plan_num, @RequestParam("product_num") String product_num,
                                  @RequestParam("plan_count") String plan_count, @RequestParam("schedule_num") String schedule_num,
                                  @RequestParam("equipment_num") String equipment_num, @RequestParam("start_date") String start_date,
                                  @RequestParam("end_date") String end_date, @RequestParam("schedule_status") String schedule_status,
                                     HttpServletRequest request, HttpServletResponse response)throws IOException {
        ProductSchedule productSchedule=new ProductSchedule();

        productSchedule.setPlanNum(plan_num);
        productSchedule.setProductNum(product_num);
        productSchedule.setPlanCount(plan_count);
        productSchedule.setScheduleNum(schedule_num);
        productSchedule.setEquipmentNum(equipment_num);
        productSchedule.setStartDate(start_date.toString());
        productSchedule.setEndDate(end_date.toString());
        productSchedule.setScheduleStatus(schedule_status);

        List<ProductSchedule> productSchedules=productScheduleService.selectByNum(schedule_num);
        if (productSchedules.size()==0){
            int rrr=productScheduleService.insertSelective(productSchedule);
            System.out.println("创建成功！");
        }else {
            System.out.println("该调度已存在！");
        }

        ModelAndView modelAndView=new ModelAndView("plan");
        return modelAndView;

    }

}
