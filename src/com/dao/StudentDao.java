package com.dao;

import java.util.List;
import java.util.Map;

import com.domain.Student;

public interface StudentDao {
	
	public List<Student> findAll();
	
	void add(Student student);
	
	void delete(int id);
	
	Student findById(int i);

    void update(Student student);
	
	/**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Student> findByPage(int start, int rows, Map<String, String[]> condition);
	
}
