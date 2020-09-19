package com.service;

import java.util.List;
import java.util.Map;

import com.dao.StudentDao;
import com.dao.StudentDaoimpl;
import com.domain.PageBean;
import com.domain.Student;
import com.domain.User;

public class StudentServiceimpl implements StudentService{
	
	private StudentDao dao = new StudentDaoimpl();
	
	 @Override
	    public List<Student> findAll() {
	        //调用Dao完成查询
	        return dao.findAll();
	    }
	
	@Override
    public void addStudent(Student student) {
        dao.add(student);
    }
	
	@Override
    public void deleteStudent(String id) {
        dao.delete(Integer.parseInt(id));
    }
	
	@Override
    public Student findStudentById(String id) {
        return dao.findById(Integer.parseInt(id));
    }

    @Override
    public void updateStudent(Student student) {
        dao.update(student);
    }

    @Override
    public void delSelectedStudent(String[] ids) {
        if(ids != null && ids.length > 0){
            //1.遍历数组
            for (String id : ids) {
                //2.调用dao删除
                dao.delete(Integer.parseInt(id));
            }
        }

    }
	
	@Override
    public PageBean<Student> findStudentByPage(String _currentPage, String _rows, Map<String, String[]> condition) {

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean对象
        PageBean<Student> student = new PageBean<Student>();
        //2.设置参数
        student.setCurrentPage(currentPage);
        student.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findTotalCount(condition);
        student.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<Student> list = dao.findByPage(start,rows,condition);
        student.setList(list);

        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        student.setTotalPage(totalPage);


        return student;
    }
}
