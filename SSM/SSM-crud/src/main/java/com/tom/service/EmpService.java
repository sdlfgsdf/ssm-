package com.tom.service;

import com.tom.entity.Emp;

import java.util.List;

public interface EmpService {
    List<Emp> findAll();

    List<Emp> findByCondition(Integer empId, String name, String sex, Integer deptId);

    void saveEmp(Emp emp);

    void deleteEmp(Integer empId);

    Emp findById(Integer empId);

    void updateEmp(Emp emp);
}
