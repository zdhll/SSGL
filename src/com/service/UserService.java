package com.service;

import java.util.List;

import com.domain.User;

public interface UserService {
	 

    /**
     * 登录方法
     * @param user
     * @return
     */
	User login(User user);
}
