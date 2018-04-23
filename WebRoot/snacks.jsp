<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
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
		<div class="topBar">
			<div class="comWidth">
				<div class="leftArea">
					<a href="#" class="collection">收藏本站</a>
				</div>
				<div class="rightArea">
					欢迎来到EasyBuy平台！<% 
					if(session.getAttribute("username")==null)
					out.print("<a href='login.jsp'>[登录]</a><a href='regester.jsp'>[免费注册]</a>");
					else
					{
					out.print(session.getAttribute("username")+"&nbsp;&nbsp;");
					out.print("<a href='/campus_supermarket/remove'>退出</a>");
					}%>
				</div>
			</div>
		</div>
		<div class="logoBar">
			<div class="comWidth">
				<div class="logo fl">
					<a href="#"><img src="images/logo.jpg"></a>
				</div>
				<div class="search_box fl">
					<form action="search.jsp" method="post">
					<input type="text" name="search" class="search_text">
					<input type="submit" value="搜素" class="search_btn fr">
					</form>
				</div>
				<div class="shopCar fr">
					<span class="shopText fl"><a href="pay.jsp">购物车</a></span>
					<span class="shopNum fl"><% if(session.getAttribute("amount")==null)
					out.print("0");
					else
					{
					out.print(session.getAttribute("amount"));
					}%></span>
				</div>
			</div>
		</div>
		<div class="navBox">
			<div class="comWidth">
				<div class="shopClass fl">
					<h3 style="color: #FFF">全部商品分类</h3>
				</div>
				<ul class="nav">
					<li><a href="index.jsp">首页</a></li>
					<li><a href="life.jsp">生活用品</a></li>
					<li><a href="drink.jsp">酒水饮料</a></li>
					<li><a href="noodles.jsp">方便速食</a></li>
					<li><a href="snacks.jsp">零食</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="position">
		<div class="comWidth">
			当前位置->零食
		</div>
	</div>
	<div class="main">
		<div class="comWidth">
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root", "123456");
		Statement stmt=conn.createStatement();
		String sql="select * from commdity where type='snacks'";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			String name=rs.getNString(1);
			double price=rs.getDouble(2);
			String picture=rs.getNString(3);
			int id =rs.getInt(6);
			out.print("<div class='commodity'>");
			out.print("<img src='"+picture+"'><br/>");
			out.print(name+"<br/>");
			out.print("<span>价格:"+price+"<span><br/>");
			out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print("<a href='/campus_supermarket/buy?id="+id+"&name="+name+"&picture="+picture+"&price="+price+"'>加入购物车</a>");
			out.print("</div>");
		}
	    %>	
		</div>
	</div>
	<div class="footer">
		<p><a href="#">平台简介</a>|<a href="#">网站公告</a>|招纳贤士|联系我们|客服热线:400-678-1234</p>
		<p></p>
		<p><a href="#"><img src="images/logo.jpg" alt="logo"></iframe></a></p>
	</div>
</body>
</html>
