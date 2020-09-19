package com.service;

import java.util.List;

import com.dao.UserDao;
import com.dao.UserDaoimpl;
import com.domain.User;

public class UserServiceimpl implements UserService{
	private UserDao dao = new UserDaoimpl();

    @Override
    public User login(User user) {
        return dao.login(user);
    }
}
