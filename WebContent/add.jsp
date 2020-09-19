<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN" style="width: 100%; height: 100%">
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
    <title>添加学生信息</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    
    
</head>
<body style="width: 100%;height: 100%;background-image:url(img/bg10.jpg)">
<div class="container">
    <center><h3 style="margin-top: 50px; margin-bottom: 30px; margin-right: 60px">添加宿舍学生信息</h3></center>
    <form action="${pageContext.request.contextPath}/addStudentServlet" method="post" style="width: 600px; margin-left: 230px;">
        <div class="form-group">
            <label for="sname">姓名：</label>
            <input type="text" class="form-control" id="sname" name="sname" placeholder="请输入姓名">
        </div>
		
		<div class="form-group">
            <label for="snumber">学号：</label>
            <input type="text" class="form-control" id="snumber" name="snumber" placeholder="请输入学号">
        </div>
        
        <div class="form-group">
            <label for="sage">年龄：</label>
            <input type="text" class="form-control" id="sage" name="sage" placeholder="请输入年龄">
        </div>
		
        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="ssex" value="男" checked="checked"/>男
            <input type="radio" name="ssex" value="女"/>女
        </div>


        <div class="form-group">
            <label for="sclass">专业班级：</label>
            <input type="text" class="form-control" id="sclass" name="sclass" placeholder="请输入专业班级">
        </div>

        <div class="form-group">
            <label for="phone">电话号码：</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号码"/>
        </div>

        <div class="form-group">
            <label for="dor_rid">宿舍楼：</label>
            <input type="text" class="form-control" id="dor_rid" name="dor_rid" placeholder="请输入宿舍楼"/>
        </div>
		
		 <div class="form-group">
            <label for="dor_number">宿舍号：</label>
            <input type="text" class="form-control" id="dor_number" name="dor_number" placeholder="请输入宿舍号"/>
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