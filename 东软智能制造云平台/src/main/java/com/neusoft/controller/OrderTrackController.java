package com.neusoft.controller;

import com.neusoft.entity.OrderTrack;
import com.neusoft.entity.Product;
import com.neusoft.service.OrderTrackService;
import com.neusoft.service.ProductScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/track")
public class OrderTrackController {
    @Autowired
    private OrderTrackService orderTrackService;
    @Autowired
    private ProductScheduleService productScheduleService;
//查询全部
    @RequestMapping("/selecta")
    public ModelAndView selecta(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("track");
        List<OrderTrack> orderTracks=orderTrackService.selectAll();
        modelAndView.addObject("orderTracks",orderTracks);
        System.out.println(orderTracks);
        return modelAndView;
    }
    //报工
    @RequestMapping("/update")
    public ModelAndView update(@RequestParam("schedule_num") String schedule_num,
                               @RequestParam("equment_num") String equment_num,
                               @RequestParam("hege_count") String hege_count,
                               @RequestParam("jiagong_vount") String jiagong_vount){
        int rrr=orderTrackService.update(schedule_num,equment_num,hege_count,jiagong_vount);

        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("track");
        return  modelAndView;
    }
    //完成报工 并将调度完成
    @RequestMapping("/updateByNum")
    public ModelAndView updateByNum(@RequestParam("schedule_num") String schedule_num){
        int rrr=orderTrackService.updateByNum(schedule_num);
        int ggg=productScheduleService.updateByNum(schedule_num);

        System.out.println(rrr);
        ModelAndView modelAndView=new ModelAndView("track");
        return  modelAndView;
    }

}
