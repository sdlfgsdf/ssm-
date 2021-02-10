package com.tom.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tom.entity.Dept;
import com.tom.entity.Emp;
import com.tom.service.DeptService;
import com.tom.service.EmpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    @RequestMapping("/list")
    public String main(Integer currentPage, ModelMap modelMap) {
        if (currentPage == null) {
            currentPage = 1;
        }
        PageHelper.startPage(currentPage, 6);
        List<Emp> emps = empService.findAll();
        PageInfo pageInfo = new PageInfo(emps, 5);
        modelMap.addAttribute("pageInfo", pageInfo);
        int pageNum = pageInfo.getPageNum();
        modelMap.addAttribute("pageNum", pageNum);
        List<Dept> depts = deptService.findAll();
        modelMap.addAttribute("depts", depts);
        return "emp/list";
    }

    @RequestMapping("/findByCondition")
    public String findByCondition(@Param("empId") Integer empId, String name, String sex, @Param("deptId") Integer deptId,
                                  Integer currentPage, ModelMap modelMap) {
        if (currentPage == null) {
            currentPage = 1;
        }
        PageHelper.startPage(currentPage, 6);
        List<Emp> emps = empService.findByCondition(empId, name, sex, deptId);
        PageInfo pageInfo = new PageInfo(emps, 5);
        modelMap.addAttribute("pageInfo", pageInfo);
        int pageNum = pageInfo.getPageNum();
        modelMap.addAttribute("pageNum", pageNum);
        List<Dept> depts = deptService.findAll();
        modelMap.addAttribute("depts", depts);
        return "emp/list";
    }

    //跳转添加页
    @RequestMapping("/dept")
    public String add(ModelMap modelMap) {
        //查询部门信息
        List<Dept> depts = deptService.findAll();
        modelMap.addAttribute("depts", depts);
        return "emp/add";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map<String, Object> saveEmp(Emp emp) {
        Map<String, Object> map = new HashMap<>();
        empService.saveEmp(emp);
        map.put("success", true);
        map.put("message", "添加成功");
        return map;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map<String, Object> deleteEmp(Integer empId) {
        Map<String, Object> map = new HashMap<>();
        empService.deleteEmp(empId);
        map.put("success", true);
        map.put("message", "删除成功");
        return map;
    }

    @RequestMapping("/edit.html")
    public String edit(Integer empId, Integer currentPage, ModelMap modelMap) {
        Emp emp = empService.findById(empId);
        List<Dept> depts = deptService.findAll();
        modelMap.addAttribute("emp", emp);
        modelMap.addAttribute("depts", depts);
        modelMap.addAttribute("pageNum", currentPage);
        return "emp/edit";
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String, Object> updateEmp(Emp emp) {
        Map<String,Object> map = new HashMap<>();
        empService.updateEmp(emp);
        map.put("success", true);
        map.put("message", "删除成功");
        return map;
    }


}
