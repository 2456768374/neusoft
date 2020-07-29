package com.neusoft.controller;

import com.neusoft.entity.Product;
import com.neusoft.entity.ProductOrder;
import com.neusoft.entity.ProductPlan;
import com.neusoft.service.ProductPlanService;
import com.neusoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductPlanService productPlanService;

    //查询所有产品
    @RequestMapping("/selecta")
    public ModelAndView selecta(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("product");
        List<Product> products=productService.selectAll();
        modelAndView.addObject("products",products);
        System.out.println(products);
        return modelAndView;
    }
    //查询产品并返回到新建订单的下拉框
    @RequestMapping("/selectb")
    public ModelAndView selectb(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("order");
        List<Product> products=productService.selectAll();
        modelAndView.addObject("products",products);

        return modelAndView;
    }
    //条件查询
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(@RequestParam("product_name") String product_name,HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("product");
        List<Product> products=productService.selectByName(product_name);
        modelAndView.addObject("products",products);
        System.out.println(products);
        return modelAndView;
    }
    //新增产品
    @RequestMapping("add")
    public ModelAndView add(@RequestParam("product_num") String product_num,
                                  @RequestParam("product_name") String product_name, HttpServletResponse response) throws IOException {
        Product products=new Product();
        products.setProductNum(product_num);

        products.setProductName(product_name);

        List<Product> productss=productService.selectByNum(product_num);
        if (productss.size()==0){
            List<Product> productsss=productService.selectByName(product_name);
            if (productsss.size()==0){
                int rrr=productService.insertSelective(products);
                System.out.println("添加成功！");
            }else {
                System.out.println("产品名称重复！");
            }
        }else {
            System.out.println("产品编号重复！");
        }

        ModelAndView modelAndView=new ModelAndView("product");
        return modelAndView;
    }
    //删除
    @RequestMapping("/deleteByNum")
    public ModelAndView deleteByNum(@RequestParam("product_num") String product_num){
        List<ProductPlan> productPlans=productPlanService.selectByNum(product_num);
        if (productPlans.size()==0){
            int rrr=productService.deleteByNum(product_num);
            System.out.println("删除成功！");
        }else {
            System.out.println("已经生成生产计划！");
        }

        ModelAndView modelAndView=new ModelAndView("product");
        return modelAndView;
    }


}
