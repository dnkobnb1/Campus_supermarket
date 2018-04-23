<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
	<link rel="stylesheet" type="text/css" href="style/reset.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<div class="headerBar">
		<div class="logoBar login_logo">
			<div class="comWidth">
				<div class="logo fl">
					<a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
				</div>
				<h3 class="welcome_title">欢迎注册</h3>
			</div>
		</div>
	</div>
	<div class="position">
		<div class="comWidth">
			<a href="index.jsp">首页</a>->注册
		</div>
	</div>
	<div class="login_cont">
	<div class="loginBox">
		<form action="/campus_supermarket/regester" method="post">
		<ul class="login">
			<li class="l_tit">账户名</li>
			<li><input type="text" name="usname"class="login_input"></li>
			<li class="l_tit">密码</li>
			<li><input type="text" name="pwd" class="login_input"></li>
			<li class="l_tit">确认密码</li>
			<li><input type="text" class="login_input"></li>
			<li class="l_tit">邮箱</li>
			<li><input type="text" name="email" class="login_input"></li>
			<li class="l_tit">地址</li>
			<li><input type="text" name="address" class="login_input"></li>
			<li><input type="checkbox" id="a1"><label id="a1">自动登陆</label></li>
			<li><input type="submit" value="" class="sub_btn"></li>
		</ul>
		</form>
	</div>
	</div>
	<div class="footer">
		<p><a href="#">平台简介</a>|<a href="#">网站公告</a>|招纳贤士|联系我们|客服热线:400-678-1234</p>
		<p></p>
		<p><a href="#"><img src="images/logo.jpg" alt="logo"></iframe></a></p>
	</div>
</body>
</html>
