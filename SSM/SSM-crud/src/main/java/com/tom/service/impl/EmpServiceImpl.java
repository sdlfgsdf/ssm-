package com.tom.service.impl;

import com.tom.dao.EmpDao;
import com.tom.entity.Emp;
import com.tom.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    EmpDao empDao;
    @Override
    public List<Emp> findAll() {
        return empDao.findAll();
    }

    @Override
    public List<Emp> findByCondition(Integer empId, String name, String sex, Integer deptId) {
        if("".equals(name)) {
            name = null;
        }
        if("".equals(sex)) {
            sex = null;
        }
        if("".equals(deptId)) {
            deptId = null;
        }
        Emp emp = new Emp();
        emp.setEmpId(empId);
        emp.setName(name);
        emp.setSex(sex);
        emp.setDeptId(deptId);
        return empDao.findByCondition(emp);
    }

    @Override
    public void saveEmp(Emp emp) {
        empDao.insert(emp);
    }

    @Override
    public void deleteEmp(Integer empId) {
        empDao.deleteEmp(empId);
    }

    @Override
    public Emp findById(Integer empId) {
        return empDao.findById(empId);
    }

    @Override
    public void updateEmp(Emp emp) {
        empDao.updateEmp(emp);
    }
}
