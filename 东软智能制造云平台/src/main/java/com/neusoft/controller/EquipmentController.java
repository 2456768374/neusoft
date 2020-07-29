package com.neusoft.controller;

import com.neusoft.entity.Equipment;
import com.neusoft.entity.Product;
import com.neusoft.entity.ProductPlan;
import com.neusoft.entity.ProductSchedule;
import com.neusoft.service.EquipmentService;
import com.neusoft.service.ProductScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private ProductScheduleService productScheduleService;

    //查询所有设备
    @RequestMapping("/selecta")
    public ModelAndView selecta(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("equipment");
        List<Equipment> equipments=equipmentService.selectAll();
        modelAndView.addObject("equipments",equipments);
        System.out.println(equipments);
        return modelAndView;
    }
    //条件查询
    @RequestMapping("/selectByNum")
    public ModelAndView selectByNum(@RequestParam("equipment_num") String equipment_num,HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("equipment");
        List<Equipment> equipments=equipmentService.selectByNum(equipment_num);
        modelAndView.addObject("equipments",equipments);

        return modelAndView;
    }
    //新增设备
    @RequestMapping("add")
    public ModelAndView add(@RequestParam("equipment_num") String equipment_num,
                            @RequestParam("equipment_status") String equipment_status){
        Equipment equipments=new Equipment();
        equipments.setEquipmentNum(equipment_num);

        equipments.setEquipmentStatus(equipment_status);

        List<Equipment> equipmentss=equipmentService.selectByNum(equipment_num);
        if (equipmentss.size()==0){
            int rrr=equipmentService.insertSelective(equipments);
            System.out.println("添加成功！");
        }else {
            System.out.println("设备重复！");
        }

        ModelAndView modelAndView=new ModelAndView("equipment");
        return modelAndView;
    }
    //删除
    @RequestMapping("/deleteByEqu")
    public ModelAndView deleteByNum(@RequestParam("equipment_num") String equipment_num){
        List<ProductSchedule> productSchedules=productScheduleService.selectByEqu(equipment_num);
        if (productSchedules.size()==0){
            int rrr=equipmentService.deleteByNum(equipment_num);
            System.out.println("删除成功！");
        }else {
            System.out.println("已经进行产品调度！");
        }

        ModelAndView modelAndView=new ModelAndView("equipment");
        return modelAndView;
    }
    //停用
    @RequestMapping("/update")
    public ModelAndView update(@RequestParam("equipment_num") String equipment_num){
        int rrr=equipmentService.update(equipment_num);

        ModelAndView modelAndView=new ModelAndView("equipment");
        return  modelAndView;
    }
    //启用
    @RequestMapping("/update2")
    public ModelAndView update2(@RequestParam("equipment_num") String equipment_num){
        int rrr=equipmentService.update2(equipment_num);

        ModelAndView modelAndView=new ModelAndView("equipment");
        return  modelAndView;
    }
}
