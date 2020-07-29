package com.neusoft.controller;

import com.neusoft.entity.OrderTrack;
import com.neusoft.entity.ProductPlan;
import com.neusoft.entity.ProductSchedule;
import com.neusoft.service.OrderTrackService;
import com.neusoft.service.ProductScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/schedule")
public class ProductScheduleController {
    @Autowired
    private ProductScheduleService productScheduleService;
    @Autowired
    private OrderTrackService orderTrackService;

    //查看全部
    @RequestMapping("/selecta")
    public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("schedule");

        List<ProductSchedule> productSchedules= productScheduleService.selectAll();
        modelAndView.addObject("productSchedules",productSchedules);
        return modelAndView;
    }
    //启动
    @RequestMapping("/updateByStatus")
    public ModelAndView updateByStatus(@RequestParam("schedule_num") String schedule_num){
        int rrr=productScheduleService.updateByStatus(schedule_num);

//        List<ProductSchedule> productSchedules= productScheduleService.selectByNum(schedule_num);
//        System.out.println(productSchedules);


        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("schedule");
        return modelAndView;
    }
    //删除
    @RequestMapping("/deleteByNum")
    public ModelAndView deleteByNum(@RequestParam("schedule_num") String schedule_num, @RequestParam("equipment_num") String equipment_num){
        int rrr=productScheduleService.deleteByNum(schedule_num, equipment_num);

        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("schedule");
        return modelAndView;
    }
    //进行订单跟踪
    @RequestMapping("/transtrack")
    public ModelAndView transchedule(@RequestParam("schedule_num") String schedule_num, @RequestParam("plan_num") String plan_num,
                                     @RequestParam("schedule_status") String schedule_status, @RequestParam("product_num") String product_num,
                                     @RequestParam("equment_num") String equment_num,
                                     HttpServletRequest request, HttpServletResponse response)throws IOException {
        OrderTrack orderTrack=new OrderTrack();

        orderTrack.setScheduleNum(schedule_num);
        orderTrack.setPlanNum(plan_num);
        orderTrack.setScheduleStatus(schedule_status);
        orderTrack.setProductNum(product_num);
        orderTrack.setEqumentNum(equment_num);

        int rrr=orderTrackService.insertSelective(orderTrack);


        ModelAndView modelAndView=new ModelAndView("schedule");
        return modelAndView;

    }

}
