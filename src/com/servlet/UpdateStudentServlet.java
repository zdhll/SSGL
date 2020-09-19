package com.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.domain.Student;
import com.service.StudentService;
import com.service.StudentServiceimpl;

@WebServlet("/updateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        //2.获取map
        Map<String, String[]> map = request.getParameterMap();
        //3.封装对象
        Student student = new Student();
        try {
            BeanUtils.populate(student,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用Service修改
        StudentService service = new StudentServiceimpl();
        service.updateStudent(student);

        //5.跳转到查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/studentListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
