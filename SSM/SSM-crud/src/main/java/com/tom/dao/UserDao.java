package com.tom.dao;

import com.tom.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User login(@Param("username") String username,@Param("password") String password);

    void updateUser(User user);
}
