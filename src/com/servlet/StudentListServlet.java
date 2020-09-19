package com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.PageBean;
import com.domain.Student;
import com.service.StudentService;
import com.service.StudentServiceimpl;

@WebServlet("/studentListServlet")
public class StudentListServlet extends HttpServlet {
	
    /*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.调用UserService完成查询
        StudentService service = new StudentServiceimpl();
        List<Student> students = service.findAll();
        //2.将list存入request域
        request.setAttribute("students",students);
        //3.转发到list.jsp
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
				//获取参数
				String currentPage = request.getParameter("currentPage");//当前页码
		        String rows = request.getParameter("rows");//每页显示条数
		        
		       if(currentPage == null || "".equals(currentPage)){

		            currentPage = "1";
		        }
		        
		        if(rows == null || "".equals(rows)){
		            rows = "5";
		        }
		        
		        //获取条件查询的参数
		        Map<String, String[]> condition = request.getParameterMap();
		        
		        //2.调用service查询
		        StudentService service = new StudentServiceimpl();
		        PageBean<Student> student = service.findStudentByPage(currentPage,rows,condition);
		        
		        String str = student.toString();

		        //3.将PageBean存入request
		        request.setAttribute("student",student);
		        request.setAttribute("condition", condition);//将查询条件存入reque
		        //4.转发到seek.jsp
		        request.getRequestDispatcher("/list.jsp").forward(request,response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doPost(request, response);
	}
}
