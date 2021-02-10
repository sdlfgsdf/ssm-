package com.tom.service.impl;

import com.tom.dao.UserDao;
import com.tom.entity.User;
import com.tom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public User login(String username, String password) {
        return userDao.login(username,password);
    }

    @Override
    public void updatePwd(String username, String password, String name, String remark) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        user.setRemark(remark);
        userDao.updateUser(user);
    }
}
