package com.service;

import java.util.List;
import java.util.Map;

import com.domain.PageBean;
import com.domain.Student;

public interface StudentService {
	
	  /**
     * 查询所有用户信息
     * @return
     */
    public List<Student> findAll();

	
	/**
     * 保存User
     * @param user
     */
    void addStudent(Student student);
    
    /**
     * 根据id删除User
     * @param id
     */
    void deleteStudent(String id);
    
    /**
     * 根据id查询
     * @param id
     * @return
     */
    Student findStudentById(String id);

    /**
     * 修改用户信息
     * @param user
     */
    void updateStudent(Student student);

    /**
     * 批量删除用户
     * @param ids
     */
    void delSelectedStudent(String[] ids);
	
    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Student> findStudentByPage(String currentPage, String rows, Map<String, String[]> condition);
}
