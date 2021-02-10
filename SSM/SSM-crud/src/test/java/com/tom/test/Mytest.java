package com.tom.test;

import com.tom.entity.Dept;
import com.tom.entity.Emp;
import com.tom.service.DeptService;
import com.tom.service.EmpService;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class Mytest {
    @Test
    public void test1(){
        String conglg = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(conglg);
       EmpService empService = (EmpService) ac.getBean("empServiceImpl");
        List<Emp> all = empService.findAll();
        all.forEach(emp -> System.out.println(emp));
    }
    @Test
    public void test2(){
        String conglg = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(conglg);
        DeptService empService = (DeptService) ac.getBean("deptServiceImpl");
        List<Dept> all = empService.findAll();
        all.forEach(dept -> System.out.println(dept));
    }
    @Test
    public void test3(){
        String conglg = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(conglg);
        EmpService empService = (EmpService) ac.getBean("empServiceImpl");
        List<Emp> byCondition = empService.findByCondition(null, null, null, 1);
        byCondition.forEach(emp -> System.out.println(emp));
    }
    @Test
    public void test4(){
        String conglg = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(conglg);
        EmpService empService = (EmpService) ac.getBean("empServiceImpl");
        Emp emp = new Emp();
        emp.setName("赵静怡11");
        emp.setSex("女");
        emp.setAge(22);
        emp.setJoinData(new Date());
        emp.setAddress("sss");
        emp.setRemark("无");
        emp.setDeptId(2);
        empService.saveEmp(emp);
    }
}
