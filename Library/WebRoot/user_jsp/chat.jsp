<%@page import="com.library.bean.Book"%>
<%@page import="com.library.dao.bookDaoImpl"%>
<%@page import="com.library.dao.bookDao"%>
<%@page import="com.library.bean.History"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.library.dao.userDaoImpl"%>
<%@page import="com.library.dao.userDao"%>
<%@page import="com.library.bean.User"%>
<%@page import="com.library.service.bookServiceImpl"%>
<%@page import="com.library.service.bookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<%-- 在IE运行最新的渲染模式 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<%-- 初始化移动浏览显示 --%>
		<meta name="Author" content="Dreamer-1.">

		<!-- 引入各种CSS样式表 -->
		<link rel="icon" href="https://v3.bootcss.com/favicon.ico">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet"
	type="text/css">
<link href="../css/wall.css" rel="stylesheet" type="text/css" />
<link href="../css/base.css" rel="stylesheet" type="text/css" />
<link href="../css/forget_phone.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/font-awesome.css">
<link href="../css/register.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css">
<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
<link rel="stylesheet" href="../css/font-change.css">
<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->
<script type="text/javascript"
	src="../js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<script src="http://code.changer.hk/jquery/plugins/jquery.cookie.js"></script>
		<title>还书</title>
	</head>
	<body>
		<%
		User user = new User();
		String aId = (String) session.getAttribute("aId");
		if(aId==null){
		%>
		<script type="text/javascript">
		alert("还未登录，请去登录！！")
		window.location.href= "http://120.26.187.198:8080/Library/login.jsp";
		</script>
		<% 
		}else{
		userDao userDao = new userDaoImpl();
		user = userDao.getAidInfo2(aId);
		}%>
	


		<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="userInterface.jsp">在线图书管理系统</a>
				</div>

				<div id="navbar" class="navbar-collapse collapse">

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						<li class="dropdown"><a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i>
								欢迎您，<%=user.getTrueName() %><i class="caret"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
								<li role="presentation" class="divider"></li>
								<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
								<li role="presentation" class="divider"></li>
							<li><a href="#" onClick="break1();return false;">退出</a></li>
							</ul>
						</li>
					</ul>

				</div>
			</div>
		</nav>

		<!-- 左侧菜单选项========================================= -->
		<div class="container-fluid">
			<div class="row-fluie">
			<div class="col-sm-3 col-md-2 sidebar">		
					<ul class="nav nav-sidebar">
						<!-- 一级菜单 -->
						<li class="active"><a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-user"></i>&nbsp; 书籍管理 <span class="sr-only">(current)</span></a>
						</li> 
						<!-- 二级菜单 -->
						<!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
						<ul id="userMeun" class="nav nav-list collapse menu-second">
							<li><a href="borrow.jsp"><i class="fa fa-users"></i> 借书</a></li>
                            <li><a href="return.jsp" ><i class="fa fa-users"></i> 还书</a></li>	
                             <li><a href="chat.jsp" ><i class="fa fa-users"></i> 社交</a></li>						
 						</ul>	 
						<li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp; 个人信息 <span class="sr-only">(current)</span></a>
						</li> 
						<ul id="productMeun" class="nav nav-list collapse menu-second">
							<li><a href="User.jsp" ><i class="fa fa-list-alt"></i> 基本信息</a></li>
						</ul>		
					</ul>
				</div>
			</div>
		</div>


		<!-- 右侧内容展示==================================================   -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main bg bg-success">


			<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
			<div id="content" class="bg bg-success">
			
				<div class="col-xs-0.5"></div>
			   <div class="col-xs-11.5"><font>神话类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">347451301</font><br>
			   <img style="padding-left: 150px;" height="150px;" alt="logo图片" src="../img/chat1.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>职场类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1127853790</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat2.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>哲学类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">650570939</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat3.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>心理类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">789142436</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat4.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>儿童类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1127618130</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat5.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>自然类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1127617557</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat6.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>百科类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1127854860</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat7.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>文学类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1050745908</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat8.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>历史类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">597105346</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat9.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>法律类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1127856495</font><br>
			   <img align="center" height="150px; alt="logo图片" src="../img/chat10.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>管理类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">971527617</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat11.jpg">
			   </div><br>
			   <div class="col-xs-11.5"><font>传记类型QQ交流群：</font>
			   <font color="red" style="padding-left: 10px;">1077843919</font><br>
			   <img height="150px; alt="logo图片" src="../img/chat12.jpg">
			   </div>
				</div>
				</div>

</body>
</html>