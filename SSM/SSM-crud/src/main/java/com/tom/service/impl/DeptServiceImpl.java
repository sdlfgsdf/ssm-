package com.tom.service.impl;

import com.tom.dao.DeptDao;
import com.tom.entity.Dept;
import com.tom.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    DeptDao deptDao;
    @Override
    public List<Dept> findAll() {
        return deptDao.findAll();
    }
}
