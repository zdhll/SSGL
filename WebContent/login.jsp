<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
    <link rel="icon" type="image/png" href="img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>管理员登录</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="css/demo.css" rel="stylesheet" />
    <!-- Canonical SEO -->
    <link rel="canonical" href="" />
    <!--  Social tags      -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    
    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //切换验证码
        function refreshCode(){
            //1.获取验证码图片对象
            var vcode = document.getElementById("vcode");

            //2.设置其src属性，加时间戳
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
        }
    </script>
    
    
</head>

<body class="login-page sidebar-collapse">
	
    <!-- End Navbar -->
    <div  class="page-header" filter-color="orange" style="padding-bottom:9px; margin:0; border-bottom: 1px solid #eee">
        <div class="page-header-image" style="background-image:url(img/login.jpg)"></div>
        <div class="container">
            <div class="col-md-4 content-center">
                <div class="card card-login card-plain">
                    <form class="form" action="${pageContext.request.contextPath}/loginServlet" method="post">
                        <div class="header header-primary text-center">
                            <div class="logo-container">
                                <img src="img/now-logo.png" alt="">
                            </div>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <label for="user"></label>
                                <input type="text" class="form-control" name="username" id="user" placeholder="输入用户名">
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                               <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <label for="password"></label>
                                <input type="password" placeholder="输入密码" name="password" id="password" class="form-control" />
                            </div>
							<div class="form-inline" style="margin-top: 20px;">
								<label for="vcode">验证码：</label>
								<input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
								<a href="javascript:refreshCode();">
									<img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
								</a>
							</div>
                        </div>
                        <div class="footer text-center">
                            <!--<a href="#pablo" class="btn btn-primary btn-round btn-lg btn-block">登录</a>-->
							<input class="btn btn-primary btn-round btn-lg btn-block" style="background-color: #ef7259;" type="submit" value="登录">
                        </div>
						<!-- 出错显示的信息框 -->
						<div class="alert alert-warning alert-dismissible" role="alert" style="background-color: rgba(277, 146, 23, 1);">
							<button type="button" class="close" data-dismiss="alert" >
								<span>&times;</span>
							</button>
							<strong><h4 style="color: #e8160c">${login_msg}</h4></strong>
						</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="js/core/popper.min.js" type="text/javascript"></script>
<script src="js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Share Library etc -->
<script src="js/plugins/jquery.sharrre.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</html>