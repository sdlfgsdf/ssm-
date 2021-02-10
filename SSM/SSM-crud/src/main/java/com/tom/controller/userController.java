package com.tom.controller;

import com.tom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class userController {
    @Autowired
    UserService userService;
    @RequestMapping("/updatePwd.jsp")
    public String updatePwd() {
        return "user/updatePwd";
    }
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map<String,Object> updatePwd(String username, String password, String name, String remark){
        Map<String,Object> map = new HashMap<>();
        userService.updatePwd(username,password,name,remark);
        map.put("success",true);
        map.put("message","密码修改成功");
        return map;
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/pages/login.jsp";
    }
}
