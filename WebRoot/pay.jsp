<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>购物车结算</title>
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
	  <body>
	<div class="headerBar">
		<div class="logoBar login_logo">
			<div class="comWidth">
				<div class="logo fl">
					<a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
				</div>
				<h3 class="welcome_title">购物车结算</h3>
			</div>
		</div>
	</div>
	<div class="position">
		<div class="comWidth">
			<a href="index.jsp">首页</a>->购物车结算
		</div>
	</div>
	<div class="pay">
		<div class="tips">收货信息</div>
		<div class="receive">
			<ul>
			<br/>
			<li class="l_tit">收货地址</li>
			<li><input type="text" class="re_input"></li>
			<br/>
			<li class="l_tit">收货人</li>
			<li><input type="text" class="re_input"></li>
			<br/>
			<li class="l_tit">联系电话</li>
			<li><input type="text" class="re_input"></li>
			<br/>
			</ul>
		</div>
		<div class="tips">支付方式</div>
		<div class="method">
			<br/>
			&nbsp;&nbsp;&nbsp;<input type="radio" name="me" value="1">微信支付</input><br/><br/>
			&nbsp;&nbsp;&nbsp;<input type="radio" name="me" value="2">货到付款</input>
		</div>
		<div class="tips">送货清单</div>
		<div class="list">
			<%
			double total=0;
			if(session.getAttribute("cart")==null)return;
			Collection<supermarket.Commodity> c=(Collection<supermarket.Commodity>)session.getAttribute("cart");
			Iterator it=c.iterator();
			while(it.hasNext())
			{
				supermarket.Commodity com=(supermarket.Commodity)it.next();
				String na=com.getName();
				String picture=com.getPicture();
				double price=com.getPrice();
				total+=price;
				out.print("<div class='commodity2'>");
				out.print("<img src='"+picture+"'><br/>");
				out.print(na+"<br/>");
				out.print("<span>价格:"+price+"<span><br/>");
				out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("</div>");
			}
				 %>
		</div>
		<div class="total">
			<span>总价:<%out.print(total);%></span>
			<input type="button" class="pay_btn"></input>
		</div>
	</div>
	<div class="footer">
		<p><a href="#">平台简介</a>|<a href="#">网站公告</a>|招纳贤士|联系我们|客服热线:400-678-1234</p>
		<p></p>
		<p><a href="#"><img src="images/logo.jpg" alt="logo"></iframe></a></p>
	</div>
</body>
</body>
</html>
