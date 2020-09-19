<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN" style="width: 100%;height: 100%">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改信息</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </head>
    <body style="width: 100%;height: 100%;background-image:url(img/bg9.jpg)">
        <div class="container" style="width: 400px;">
        <h3 style="text-align: center;">修改学生信息</h3>
        <form action="${pageContext.request.contextPath}/updateStudentServlet" method="post">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="id" value="${student.id}">

          <div class="form-group">
            <label for="sname">姓名：</label>
            <input type="text" class="form-control" id="sname" name="sname"  value="${student.sname}" readonly="readonly" placeholder="请输入姓名" />
          </div>
          
          <div class="form-group">
            <label for="snumber">学号：</label>
            <input type="text" class="form-control" id="snumber" name="snumber"  value="${student.snumber}"  placeholder="请输入学号" />
          </div>
          
          <div class="form-group">
            <label for="sage">年龄：</label>
            <input type="text" class="form-control" value="${student.sage}" id="sage"  name="sage" placeholder="请输入年龄" />
          </div>

          <div class="form-group">
            <label>性别：</label>
              <c:if test="${student.ssex == '男'}">
                  <input type="radio" name="ssex" value="男" checked />男
                  <input type="radio" name="ssex" value="女"  />女
              </c:if>

              <c:if test="${student.ssex == '女'}">
                  <input type="radio" name="ssex" value="男"  />男
                  <input type="radio" name="ssex" value="女" checked  />女
              </c:if>


          </div>

          <div class="form-group">
            <label for="sclass">专业班级：</label>
            <input type="text" class="form-control" value="${student.sclass}" id="sclass"  name="sclass" placeholder="请输入专业班级" />
          </div>
          

          <div class="form-group">
            <label for="phone">电话号码：</label>
            <input type="text" id="phone" class="form-control" value="${student.phone}" name="phone" placeholder="请输入电话号码"/>
          </div>

          <div class="form-group">
            <label for="dor_rid">宿舍楼：</label>
            <input type="text" id="dor_rid" class="form-control" value="${student.dor_rid}" name="dor_rid" placeholder="请输入宿舍楼"/>
          </div>
          
          <div class="form-group">
            <label for="dor_number">宿舍号：</label>
            <input type="text" id="dor_number" class="form-control" value="${student.dor_number}" name="dor_number" placeholder="请输入宿舍号"/>
          </div>

             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
                <a class="btn btn-default" href="${pageContext.request.contextPath}/studentListServlet">返回</a>
             </div>
        </form>
        </div>
    </body>
</html>