<%@page import="com.library.service.noteServiceImpl"%>
<%@page import="com.library.service.noteService"%>
<%@page import="com.library.bean.Note"%>
<%@page import="com.library.service.remarkServiceImpl"%>
<%@page import="com.library.service.remarkService"%>
<%@page import="com.library.bean.Remark"%>
<%@page import="com.library.service.bookServiceImpl"%>
<%@page import="com.library.service.bookService"%>
<%@page import="com.library.bean.Book"%>
<%@page import="com.library.dao.bookDaoImpl"%>
<%@page import="com.library.dao.bookDao"%>
<%@page import="com.library.bean.History"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.library.dao.userDaoImpl"%>
<%@page import="com.library.dao.userDao"%>
<%@page import="com.library.bean.User"%>
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
<title>书籍信息</title>
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
	<div
		class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main bg bg-success">


		<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
		<div id="content" class="bg bg-success">
			<div class="col-xs-0.5"></div>
			<div class="col-xs-11.5 main">
		  	<h1 class="page-header">还书板块</h1>
				<div class="panel panel-primary">
					<!-- Default panel contents -->
					<div class="panel-heading">
						借书信息 <i class="fa fa-thumb-tack pull-right"></i>
					</div>
                
					<div class="panel-body">
				
						<form class="form-horizontal" >
						<table>
						<tr style="height: 500px">
						<td width="10%"></td>
						<td width="30%" height="100%">
							  <img alt="logo图片" src="../img/book.png">
						 </td>
						<td width="20%"></td>
					   <td width="50%">
						  <% 
						     int hId=Integer.parseInt(request.getParameter("hId"));
						     System.out.println(hId);
						     bookService bookService=new bookServiceImpl();
						     History history=bookService.getHistoryInfo(hId);
						     Book  book=bookService.getBookInfo(history.getbId());
						  %>
						  <font color="gray">书名：<%=history.getBookName() %></font><br>
						    <font color="gray">作者：<%=book.getAuthor() %></font><br>
						  <font color="gray"
						  >类型：<%=book.getBookSort() %></font><br>
						  <font color="gray">出版社：<%=book.getPress() %></font><br>
						  <font color="gray">剩余本数：<%=book.getBookNum() %></font><br>
						 <font color="red"> 价格：<%=book.getBookPrice() %></font><br>
						  <font color="red">开始时间：<%=history.getBeginTime() %></font><br>
						  <font color="red">最大借阅时间：<%=history.getEndTimemax() %></font>
						  </td>
						  </tr> 
						  </table>
						</form>
				<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">笔记
							 <i class="pull-right">
								 <a href="#remarks" data-toggle="modal">添加</a></i></div>
						</div>
						<div class="bootstrap-admin-panel-content">
							<ul>
						<% 
							ArrayList<Note> noteData = new ArrayList<Note>();	
						   noteService noteService=new noteServiceImpl();
						   noteData = noteService.select(book.getbId(), aId);
						      System.out.println(noteData);
						       if(noteData.size()==0){
						     %>
						     	<li>把觉得有意义的信息记录下来，方便下次查找和回忆。</li>
						     <%}else{
								for (Note r1 : noteData) {
								%>
								<li style="width: 100%;border: 1px solid black;list-style-position: inside;margin: 3px;">
								<font color="red"><%=r1.getNoteTime() %></font>
								<font style="padding-left: 10px;"><%=r1.getNoteContent() %></font>
								</li>
							   <%}}%>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
			   
			    <div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
							<font style="width: 80%">评论</font> 
							
								 <i class="pull-right">
								 <a href="#comment" data-toggle="modal">评论</a></i>
								
							</div>
						</div>
						<div class="bootstrap-admin-panel-content">
						<ul>
						<% 
							ArrayList<Remark> remarkData = new ArrayList<Remark>();	
						   remarkService remarkService=new remarkServiceImpl();
						      remarkData = remarkService.select(book.getbId(), book.getBookName());
						      System.out.println(remarkData);
						       if(remarkData.size()==0){
						     %>
						     	<li>此书还没有评论过，快去抢占沙发吧！</li>
						     <%}else{
								for (Remark r1 : remarkData) {
								%>
								<li style="width: 100%;border: 1px solid black;list-style-position: inside;margin: 3px;">
								<font color="red"><%=r1.getTrueName() %></font>
								<font color="red" style="float: right;padding-right: 50px;"><%=r1.getRemarkTime() %></font><br>
								<p style="padding-left: 30px;"><%=r1.getRemarkContent() %></p>
								</li>
							   <%}}%>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
            <button type="button" onclick="returnbook(<%=history.gethId() %>)" class="btn btn-primary" style="width: 150px;margin-left: 45%">还书</button> 
				</div>
						</div>
						</div>
			</div>
		</div>
		</div>
			<form >

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="remarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">笔记</h4>
						</div>
						<div class="modal-body">
						<textarea name="textarea1" id="textarea1" style="width:100%;height: 300px;" rows="" cols="" autofocus="autofocus" maxlength="300" placeholder="请输入对该书有意义的备注信息"></textarea> 
						<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-textarea11">备注不能为空</span>
						<label class="control-label" style="display: none"></label>									 
						
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="button"  class="sub-remarks btn btn-primary">添加</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>

		</form>
				<form >

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="comment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">评论</h4>
						</div>
						<div class="modal-body">
						<textarea name="textarea" id="textarea" style="width:100%;height: 300px;" rows="" cols="" autofocus="autofocus" maxlength="300" placeholder="请输入对该书的评论"></textarea> 
						<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-textarea1">评论不能为空</span>
						<label class="control-label" style="display: none"></label>									 
						
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="button"  class="sub-comment btn btn-primary">评论</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>

		</form>
			<form >

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">修改密码</h4>
						</div>
						<div class="modal-body">

							<!--正文-->
							<input type="hidden" name="flag" value="1"> <input type="hidden" name="url" value="index">
							<div class="row">
								<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">原密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="Password" id="oldPwd" placeholder="请输入原密码"> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-password1">新密码不能为空</span>
									<label class="control-label" style="display: none"></label>									 
								</div>
							</div>
                         
							<div class="row">
								<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">新密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="Password2" id="Password2" placeholder="请输入新密码"> 
									 <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-password2">新密码不能为空</span>
									<label class="control-label"  style="display: none"></label>
								
								</div> 
							</div>
							<div class="row">
								<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">确认密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="Password3" id="Password3" placeholder="请输入新密码">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-password3">确认密码不能为空</span>
									<label class="control-label"  style="display: none" ></label>							  
								</div>					
							</div>  
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="button"  class="sub-btn3 btn btn-primary">修改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>

		</form>
<form>

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="flag" value="2"> <input
							type="hidden" name="url" value="index">
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="trueName"
									name="trueName" placeholder="请输入您的真实姓名"
									value='<%=user.getTrueName()%>'> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-trueName">姓名不能为空</span>
									<label class="control-label"  style="display: none"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="Email" name="Email"
									placeholder="请输入您的邮箱" value='<%=user.getEmail()%>'>
								<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-Email">邮箱不能为空</span>
									 <label class="control-label" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="sub-btn4 btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	
</body>
<script type="text/javascript">

function returnbook(hId) {
	var con = confirm("是否还书?");
	if (con) {
		window.location.href= "http://120.26.187.198:8080/Library/borServlet?flag=2&room=1&hId=" + hId;
	}
}
function break1 () {
	var con = confirm("是否退出?");
	if (con) {
		
		location.href= "http://120.26.187.198:8080/Library/login.jsp";
	}
}
$(function(){ 
	$(".sub-remarks").on("click", function(){
		var data = {};
		 data.bId=<%=book.getbId()%>
		data.textarea1 = $("#textarea1").val();
		if(data.textarea1 == '' || data.textarea1 ==null  || data.textarea1 == "undefined"){
			$("#form-ipt-error-cl-textarea11").addClass("is-visible");
	        $("#form-ipt-error-cl-textarea11").prev().addClass("input-error");
			$("#form-ipt-error-cl-textarea11").html("评论不能为空");
			return;
		}else{
			$("#form-ipt-error-cl-textarea11").removeClass("is-visible");
			$("#form-ipt-error-cl-textarea11").prev().removeClass("input-error");
		}
		data.information=1;
		$.ajax({
	        url: "http://120.26.187.198:8080/Library/information",
	        async : true,
	        type: "get",
	        dataType: "text",
	        data: data,
	        success: function (data) {
	        	if(data =='1'){
	        	window.location.href =window.location.href;
	        		return ;
	        	}
	        	if(data =='-4'){
	        		$("#form-ipt-error-cl-textarea11").addClass("is-visible");
	                $("#form-ipt-error-cl-textarea11").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-textarea11").html("未知错误");
	        		alert("未知错误");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-textarea11").removeClass("is-visible");
	    			$("#form-ipt-error-cl-textarea11").prev().removeClass("input-error");
	        	}
	        }
		})
		})
	$(".sub-comment").on("click", function(){
	var data = {};
	 data.bId=<%=book.getbId()%>
	data.textarea1 = $("#textarea").val();
	if(data.textarea1 == '' || data.textarea1 ==null  || data.textarea1 == "undefined"){
		$("#form-ipt-error-cl-textarea1").addClass("is-visible");
        $("#form-ipt-error-cl-textarea1").prev().addClass("input-error");
		$("#form-ipt-error-cl-textarea1").html("评论不能为空");
		return;
	}else{
		$("#form-ipt-error-cl-textarea1").removeClass("is-visible");
		$("#form-ipt-error-cl-textarea1").prev().removeClass("input-error");
	}
	data.information=0;
	$.ajax({
        url: "http://120.26.187.198:8080/Library/information",
        async : true,
        type: "get",
        dataType: "text",
        data: data,
        success: function (data) {
        	if(data =='1'){
        	window.location.href =window.location.href;
        		return ;
        	}
        	if(data =='-4'){
        		$("#form-ipt-error-cl-password1").addClass("is-visible");
                $("#form-ipt-error-cl-password1").prev().addClass("input-error");
    			$("#form-ipt-error-cl-password1").html("未知错误");
        		alert("未知错误");
        		return ;
        	}else{
        		$("#form-ipt-error-cl-password1").removeClass("is-visible");
    			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
        	}
        }
	})
	})
	$(".sub-btn3").on("click", function(){
		var $password=$("input[name=Password]");
		var data = {};
		data.password1 = $.trim($("input[name=Password2]").val());
		data.password2 = $.trim($("input[name=Password3]").val());
		data.password = $.trim($password.val());
		if(data.password == '' || data.password ==null  || data.password == "undefined"){
			$("#form-ipt-error-cl-password1").addClass("is-visible");
            $("#form-ipt-error-cl-password1").prev().addClass("input-error");
			$("#form-ipt-error-cl-password1").html("请输入以字母开头，长度在6-18之间的新密码");
			alert("请输入新密码");
			return;
		}else{
			$("#form-ipt-error-cl-password1").removeClass("is-visible");
			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
		}
		var reg1 =/^[a-zA-Z]\w{5,17}$/;
		if(data.password1 == '' || data.password1 ==null  || data.password1 == "undefined"){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("请输入以字母开头，长度在6-18之间的新密码");
			alert("请输入新密码");
			return ;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(!reg1.test(data.password1)){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("请输入有效的密码");
			alert('请输入有效的密码');
			return ;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(data.password2 == ''||data.password2 ==null  || data.password2 == "undefined"){
			$("#form-ipt-error-cl-password3").addClass("is-visible");
            $("#form-ipt-error-cl-password3").prev().addClass("input-error");
			$("#form-ipt-error-cl-password3").html("确认密码不能为空");
			alert('请输入确认密码');
			return;
		}else{
			$("#form-ipt-error-cl-password3").removeClass("is-visible");
			$("#form-ipt-error-cl-password3").prev().removeClass("input-error");
		}
		if(data.password1 != data.password2){
			$("#form-ipt-error-cl-password3").addClass("is-visible");
            $("#form-ipt-error-cl-password3").prev().addClass("input-error");
			$("#form-ipt-error-cl-password3").html("两次输入的密码不相同");
			alert('两次输入的密码不相同');
			return;
		}else{
			$("#form-ipt-error-cl-password3").removeClass("is-visible");
			$("#form-ipt-error-cl-password3").prev().removeClass("input-error");
		}
		data.repassword=0;
		$.ajax({
	        url: "http://120.26.187.198:8080/Library/chUserPassword",
	        async : true,
	        type: "post",
	        dataType: "text",
	        data: data,
	        success: function (data) {
	        	if(data =='1'){
	        		alert("修改成功");
	        	window.location.href ="http://120.26.187.198:8080/Library/login.jsp";
	        		return ;
	        	}
	        	if(data =='-4'){
	        		$("#form-ipt-error-cl-password1").addClass("is-visible");
	                $("#form-ipt-error-cl-password1").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-password1").html("未知错误");
	        		alert("未知错误");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-password1").removeClass("is-visible");
	    			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
	        	}
	        	if(data =='-8'){
	        		$("#form-ipt-error-cl-password2").addClass("is-visible");
	                $("#form-ipt-error-cl-password2").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-password2").html("旧密码和新密码相同");
	        		alert("旧密码和新密码相同");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-password2").removeClass("is-visible");
	    			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
	        	}
	        	if(data =='-5'){
	        		$("#form-ipt-error-cl-password1").addClass("is-visible");
	                $("#form-ipt-error-cl-password1").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-password1").html("原始密码错误");
	        		alert("原始密码错误");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-password1").removeClass("is-visible");
	    			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
	        	}
	        }
    	});
		})
		$(".sub-btn4").on("click", function(){
    		var $Email=$("input[name=Email]");
    		var data = {};
    		data.trueName = $.trim($("input[name=trueName]").val());
    		data.Email = $.trim($Email.val());
    		if(data.Email == '' || data.Email ==null  || data.Email == "undefined"){
    			$("#form-ipt-error-cl-Email").addClass("is-visible");
                $("#form-ipt-error-cl-Email").prev().addClass("input-error");
    			$("#form-ipt-error-cl-Email").html("邮箱不能为空");
    			alert("请输入邮箱");
    			return;
    		}else{
    			$("#form-ipt-error-cl-Email").removeClass("is-visible");
    			$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
    		}
    		var reg5 = /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/
    		if(!reg5.test(data.Email)){
    			$("#form-ipt-error-cl-Email").addClass("is-visible");
                $("#form-ipt-error-cl-Email").prev().addClass("input-error");
    			$("#form-ipt-error-cl-Email").html("请输入有效的邮箱账号");
    			alert('请输入有效的邮箱账号');
    			return ;
    			}else{
    				$("#form-ipt-error-cl-Email").removeClass("is-visible");
        			$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
    		}
    		if(data.trueName == '' || data.trueName ==null  || data.trueName == "undefined"){
    			$("#form-ipt-error-cl-trueName").addClass("is-visible");
                $("#form-ipt-error-cl-trueName").prev().addClass("input-error");
    			$("#form-ipt-error-cl-trueName").html("请输入姓名");
    			alert("请输入姓名");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-trueName").removeClass("is-visible");
    			$("#form-ipt-error-cl-trueName").prev().removeClass("input-error");
    		}
    		var reg3 =/^([\u4e00-\u9fa5]){2,7}$/;
    		if(!reg3.test(data.trueName)){
    			$("#form-ipt-error-cl-trueName").addClass("is-visible");
                $("#form-ipt-error-cl-trueName").prev().addClass("input-error");
    			$("#form-ipt-error-cl-trueName").html("请输入合法的姓名");
    			alert('请输入合法的姓名');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-trueName").removeClass("is-visible");
    			$("#form-ipt-error-cl-trueName").prev().removeClass("input-error");
    		}
    		data.flag=0;
    		$.ajax({
    	        url: "http://120.26.187.198:8080/Library/adminServlet",
    	        async : true,
    	        type: "post",
    	        dataType: "text",
    	        data: data,
    	        success: function (data) {
    	        	if(data =='1'){
    	        		alert("修改成功");
    	        	window.location.href =window.location.href;
    	        		return ;
    	        	}
    	        	if(data =='-4'){
    	        		$("#form-ipt-error-cl-Email").addClass("is-visible");
    	                $("#form-ipt-error-cl-Email").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-Email").html("未知错误");
    	        		alert("未知错误");
    	        		return ;
    	        	}else{
    	        		$("#form-ipt-error-cl-Email").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
    	        	}      
    	        }
        	});
    	
 	});
});
</script>
</html>