<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN" style="width: 100%;height: 100%">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>宿舍学生信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script>
        function deleteStudent(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/delStudentServlet?id="+id;
            }
        }

        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){

                   var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }

                    if(flag){//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }

            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("uid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body style="width: 100%;height: 100%; font-size: 16px; background-color: #f3f8fd;background-image:url(img/list.jpg)">
<div class="container";">
    <h1 style="text-align: center;margin: 50px">宿舍学生信息列表</h1>

    <div style="float: left;margin-bottom: 20px">

        <form class="form-inline" action="${pageContext.request.contextPath}/studentListServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="sname" value="${condition.sname[0]}" class="form-control" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputName3">专业班级</label>
                <input type="text" name="sclass" value="${condition.sclass[0]}" class="form-control" id="exampleInputName3" >
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">宿舍楼</label>
                <input type="text" name="dor_rid" value="${condition.dor_rid[0]}" class="form-control" id="exampleInputEmail2"  >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加学生信息</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>

    </div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>编号</th>
            <th>姓名</th>
            <th>学号</th>
            <th>年龄</th>
            <th>性别</th>
            <th>专业班级</th>
            <th>电话号码</th>
            <th>宿舍楼</th>
            <th>宿舍号</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${student.list}" var="student" varStatus="s">
            <tr>
                <td><input type="checkbox" name="uid" value="${student.id}"></td>
                <td>${rows*(currentPage-1)+s.count}</td>
                <td>${student.sname}</td>
                <td>${student.snumber}</td>
                <td>${student.sage}</td>
                <td>${student.ssex}</td>
                <td>${student.sclass}</td>
                <td>${student.phone}</td>
                <td>${student.dor_rid}</td>
                <td>${student.dor_number}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findStudentServlet?id=${student.id}">修改</a>&nbsp;
                    <a class="btn btn-default btn-sm" href="javascript:deleteStudent(${student.id});">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${student.currentPage == 1}">
                    <li class="disabled">
                </c:if>

                <c:if test="${student.currentPage != 1}">
                    <li>
                </c:if>


                    <a href="${pageContext.request.contextPath}/studentListServlet?currentPage=${student.currentPage - 1}&rows=5&sname=${condition.sname[0]}&sclass=${condition.sclass[0]}&dor_rid=${condition.dor_rid[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>


                <c:forEach begin="1" end="${student.totalPage}" var="i" >


                    <c:if test="${student.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/studentListServlet?currentPage=${i}&rows=5&sname=${condition.sname[0]}&sclass=${condition.sclass[0]}&dor_rid=${condition.dor_rid[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${student.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/studentListServlet?currentPage=${i}&rows=5&sname=${condition.sname[0]}&sclass=${condition.sclass[0]}&dor_rid=${condition.dor_rid[0]}">${i}</a></li>
                    </c:if>

                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/studentListServlet?currentPage=${student.currentPage + 1}&rows=5&sname=${condition.sname[0]}&sclass=${condition.sclass[0]}&dor_rid=${condition.dor_rid[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${student.totalCount}条记录，共${student.totalPage}页
                </span>

            </ul>
        </nav>


    </div>


</div>


</body>
</html>
