package com.neusoft.controller;

import com.neusoft.entity.Factory;

import com.neusoft.service.FactoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class FactoryController {
    @Autowired
    private FactoryService factoryService;

    @RequestMapping(value = "/loginservice",method = {RequestMethod.POST})
    public void loginService(@RequestParam(required = true) String uname,
                             @RequestParam(required = true) String upwd,
                             HttpSession session,
                             HttpServletResponse response) throws IOException {

        //1取  取参数  见形参
        // 2调 调用业务逻辑层
        Factory factory=factoryService.getUser(uname,upwd);
        //不为空则登录成功
        if(factory!=null){
            //记录登录状态 让后面访问的页面都知道我已登录
            // 将用户信息存放入session中
            // session对象存储在服务端
            session.setAttribute("user",factory);



            response.sendRedirect("/index.jsp");
        }
        else
        {
            //登录不成功,返回登录页面
            response.sendRedirect("/login.html");
            System.out.println("登录失败");
        }

    }
    @RequestMapping(value="registerservice" ,method = {RequestMethod.POST})
    public void registerService(
            @RequestParam(required = true) String uname,
            @RequestParam(required = true) String upwd,
            @RequestParam(required = true) String ufty,
            HttpServletResponse response) throws IOException, InterruptedException {
        Factory user1=factoryService.getUser1(uname);
        if(user1!=null){
            response.setCharacterEncoding("utf-8");
            PrintWriter pw=response.getWriter();
            pw.write("<script language='javascript' charset='utf-8' >alert('该用户名已被注册')</script>");
        }
        else {
            Factory user2=factoryService.getUser2(ufty);
            if (user2!=null){
                response.setCharacterEncoding("utf-8");
                PrintWriter pw=response.getWriter();
                pw.write("<script language='javascript' charset='utf-8' >alert('该工厂名已被注册')</script>");
            }
            else {
                Factory user = new Factory();
                user.setCreateUserid(uname);
                user.setPassword(upwd);
                user.setFactoryName(ufty);
                user.setFactoryStatus(1);
                user.setFactoryImgUrl(null);
                factoryService.insert(user);
                response.setCharacterEncoding("utf-8");
                PrintWriter pw=response.getWriter();
                pw.write("<script language='javascript' charset='utf-8' >alert('注册成功，请重新登录');" +
                        "window.location='/login.html'</script>");
            }
        }
    }

    @RequestMapping("/logout")
    public String logOut(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
