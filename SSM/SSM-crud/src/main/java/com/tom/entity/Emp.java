package com.tom.entity;


import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component
public class Emp {
    private Integer empId;
    private String name;
    private String sex;
    private Integer age;
    private String phone;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date joinData;
    private String address;
    private Integer deptId;
    private String remark;
    private Dept dept;

    public Emp() {
    }

    public Emp(Integer empId, String name, String sex, Integer age, String phone, Date joinData, String address, Integer deptId, String remark, Dept dept) {
        this.empId = empId;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
        this.joinData = joinData;
        this.address = address;
        this.deptId = deptId;
        this.remark = remark;
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getJoinData() {
        return joinData;
    }

    public void setJoinData(Date joinData) {
        this.joinData = joinData;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", joinData=" + joinData +
                ", address='" + address + '\'' +
                ", deptId=" + deptId +
                ", remark='" + remark + '\'' +
                ", dept=" + dept +
                '}';
    }
}
