package com.tom.dao;

import com.tom.entity.Emp;

import java.util.List;

public interface EmpDao {
    List<Emp> findAll();

    List<Emp> findByCondition(Emp emp);

    void insert(Emp emp);

    void deleteEmp(Integer empId);

    Emp findById(Integer empId);

    void updateEmp(Emp emp);
}
