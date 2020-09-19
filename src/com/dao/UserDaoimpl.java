package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.domain.User;
import com.util.JDBCUtils;


public class UserDaoimpl implements UserDao{
	private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
	
	
  
    public User login(User loginUser) {
        try {
            String sql = "select * from user where username = ? and password = ? ";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),loginUser.getUsername(),loginUser.getPassword());
            //template.queryForOb
            //User user = (User) template.queryForList(sql, new BeanPropertyRowMapper<User>(User.class),username,password);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
	
	
	
	
}
