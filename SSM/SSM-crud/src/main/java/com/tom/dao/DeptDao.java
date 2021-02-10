package com.tom.dao;

import com.tom.entity.Dept;

import java.util.List;

public interface DeptDao {
    List<Dept> findAll();
}
