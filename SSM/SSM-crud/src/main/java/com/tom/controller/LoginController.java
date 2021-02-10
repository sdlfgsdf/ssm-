package com.tom.controller;

import com.tom.entity.User;
import com.tom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login.jsp")
    public String login(){
        return "login";
    }
    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> loginUser(String username, String password, String captcha, HttpSession session){
        Map<String,Object> map = new HashMap<>();
        if (StringUtils.isEmpty(username)){
            map.put("success",false);
            map.put("message","用户名不能为空");
            return map;
        }else if (StringUtils.isEmpty(password)){
            map.put("success",false);
            map.put("message","密码不能为空");
            return map;
        }else if (StringUtils.isEmpty(captcha)){
            map.put("success",false);
            map.put("message","验证码不能为空");
            return map;
        }
        //获取系统生成的验证码
        String _captcha = (String) session.getAttribute("captcha");
        if (captcha.equalsIgnoreCase(_captcha)){
            User user = userService.login(username,password);
            if (user == null){
                map.put("success",false);
                map.put("message","用户名或密码错误");
                return map;
            }else {
                session.setAttribute("user",user);
                map.put("success",true);
                map.put("message","登录成功");
            }
        }else {
            map.put("success",false);
            map.put("message","验证码错误");
            return map;
        }
        return map;
    }
}
