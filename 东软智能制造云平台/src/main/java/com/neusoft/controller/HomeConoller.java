package com.neusoft.controller;

import com.neusoft.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/home")
public class HomeConoller {
    @Autowired
    private HomeService homeService;

    @RequestMapping("/toIndex")
    public ModelAndView toIndex() {
        ModelAndView mav = new ModelAndView("index");
        return mav;
    }

    @RequestMapping("/queryForList")
    public @ResponseBody
    List<Map<String, Object>> queryForList() {
        return homeService.queryForList();
    }
    @RequestMapping("/pie")
    public @ResponseBody
    List<Map<String, Object>> pie() {
        return homeService.pie();
    }

    @RequestMapping("/get")
    public @ResponseBody
    List<Map<String, Object>> get() {
        return homeService.get();
    }
}
