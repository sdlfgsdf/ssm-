package com.tom.service;

import com.tom.entity.User;

public interface UserService {
    User login(String username, String password);

    void updatePwd(String username, String password, String name, String remark);
}
