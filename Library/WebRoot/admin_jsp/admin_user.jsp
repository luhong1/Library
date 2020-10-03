
<%@page import="java.util.ArrayList"%>
<%@page import="com.library.dao.userDaoImpl"%>
<%@page import="com.library.dao.userDao"%>
<%@page import="com.library.bean.User"%>
<%@page import="com.library.bean.User"%>
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
<html lang="zh-CN">
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
<title>管理员</title>
<body>
		<%
		User user1 = new User();
		String aId = (String) session.getAttribute("aId");
		userDao userDao = new userDaoImpl();
		if(aId==null){
		%>
		<script type="text/javascript">
		alert("还未登录，请去登录！！")
		window.location.href= "http://120.26.187.198:8080/Library/login.jsp";
		</script>
		<% 
		}else{
		user1 = userDao.getAidInfo2(aId);
		}%>

	<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin.jsp">在线图书管理系统</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="glyphicon glyphicon-user"></i> 欢迎您，<%=user1.getTrueName()%>
				</a>

					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownMenu1">
						<li role="presentation"><a href="#updateinfo"
							data-toggle="modal">个人资料</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a href="#updatepwd"
							data-toggle="modal">修改密码</a></li>
						<li role="presentation" class="divider"></li>
					<li><a href="#" onClick="break1();return false;">退出</a></li>
					</ul></li>
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
					<li class="active"><a href="#userMeun"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-user"></i>&nbsp; 书籍管理 <span class="sr-only">(current)</span>
					</a></li>
					<!-- 二级菜单 -->
					<!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
					<ul id="userMeun" class="nav nav-list collapse menu-second">
						<li><a href="admin_book.jsp"><i class="fa fa-users"></i>
								书籍管理</a></li>
						<li><a href="admin_history.jsp"><i
								class="fa fa-users"></i> 订单管理</a></li>
					</ul>
					<li><a href="#productMeun"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp; 用户管理 <span class="sr-only">(current)</span>
					</a></li>
					<ul id="productMeun" class="nav nav-list collapse menu-second">
						<li><a href="admin_user.jsp"><i class="fa fa-list-alt"></i>
								用户管理</a></li>
					</ul>
				</ul>

			</div>
		</div>
	</div>


	<!-- 右侧内容展示==================================================   -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main bg bg-success">


		<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
		<div id="content" class="bg bg-success">
			
				<h1 class="page-header">读者管理</h1>

				<div class="panel panel-primary">
					<!-- Default panel contents -->
					<div class="panel-heading">
						借阅列表 <i class="fa fa-thumb-tack pull-right"></i>
					</div>
					<div class="panel-body">
						<div class="row" style="margin-bottom: 15px">
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" id="txtName" name="txtName" class="form-control" placeholder="根据账号/姓名/昵称/邮箱/手机号/身份证号  进行搜索">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick="ss()">搜索</button>
									</span>
								</div>
								<!-- /input-group -->

							</div>
							<div class="col-md-6">
								<a  class="btn btn-primary" id="btn_add"
									style="margin-left: 30px; margin-top: 50px" data-toggle="modal" data-target="#addModal">添加用户</a>
								 <a href="#" class="btn btn-primary" data-target="#addadminModal" data-toggle="modal" style="margin-left: 57px; margin-top: 50px">添加管理员</a>
							</div>
							<!-- /.col-md-4 -->
						</div>
						<!-- /.row -->
						<table class="table table-bordered" id="show_tab">
							<thead>
								<tr id="show_tab_one">
									<th><input type="checkbox"
										onclick="selectAll(this.checked)" /></th>
									<th >账号</th>
									<th>姓名</th>
									<th>昵称</th>
									<th>邮箱</th>
									<th>手机号</th>
									<th>身份证号码</th>
									<th>借阅天数</th>
									<th>最大借阅数量</th>

									<th scope="col" style="text-align: center;">操作</th>
								</tr>
							</thead>
	                     <tbody>
							<%
								ArrayList<User> data2 = new ArrayList<User>();
								data2 = (ArrayList<User>) request.getAttribute("data");
								if (data2 == null) {
									data2 = (ArrayList<User>) userDao.getAllUser();
								}
								for (User user : data2) {
							%>

						
								<tr id="show_tab_tr">
									<td><input type="checkbox" name="check" /></td>
									<td><%=user.getLoginName()%></td>
									<td><%=user.getTrueName()%></td>
									<td><%=user.getNiceName()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getPhoneNumber()%></td>
									<td><%=user.getIdNumber()%></td>
									<td><%=user.getLendNum()%></td>
									<td><%=user.getMaxNum()%></td>
									<td>
									<div style="text-align: center;">
											<a href="#" onClick="deletebook(<%=user.getaId()%>);return false;"
												class="btn btn-danger btn-sm">删除</a>
											<button type="button" class="btn btn-warning btn-xs"
												data-toggle="modal" data-target="#updateModal"
												id="btn_update"
												onclick="showInfo2('<%=user.getaId()%>','<%=user.getLoginName()%>',
               					 	'<%=user.getTrueName()%>','<%=user.getNiceName() %>','<%=user.getEmail()%>',
'<%=user.getPhoneNumber()%>','<%=user.getIdNumber()%>','<%=user.getPassword()%>','<%=user.getLendNum()%>','<%=user.getMaxNum()%>')">修改</button>
										</div>
									</td>
								</tr>
							
							<%
								}
							%>
							</tbody>
						</table>

						<nav aria-label="Page navigation" class="text-right"> <input
							id="lastpage" type="button" class="btn btn-default" value="«">

						<input id="curPage" type="text" size="1" width="5px"> <input
							id="npage" type="button" class="btn btn-default" value="确定">

						<input id="nextpage" type="button" class="btn btn-default"
							value="»"> 共<input id="page" type="text" size="1"
							readonly="readonly" width="5px">页 每页显示<input
							id="pageSize" type="text" value="5" size="1" width="5px">行
						<input class="btn btn-default" type="button" value="确定"
							onclick="pageSize2()"> </nav>
					</div>

				</div>
			</div>
		</div>

	
	
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
									value='<%=user1.getTrueName()%>'> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-trueName">姓名不能为空</span>
									<label class="control-label"  style="display: none"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="Email" name="Email"
									placeholder="请输入您的邮箱" value='<%=user1.getEmail()%>'>
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
	
	



	<div class="modal fade" id="modal_info" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="infoModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12" id="div_info"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btn_info_close"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 修改模态框（Modal） -->
	<form>
	
		<!--保证样式水平不混乱-->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLabel">修改读者信息</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->
                     <div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">ID</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="useraId"
									name="aId1" placeholder="请输入账号" readonly="readonly"> <label
									class="control-label" for="useraId" style="display: none;"></label>
							</div>
						</div>
                     
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">账号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateusername"
									name="loginName1" placeholder="请输入账号"> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-updateusername">账号已存在</span>
									<label class="control-label" for="updateusername" style="display: none;"></label>
							</div>
						</div>
                      
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatename"
									name="trueName1" placeholder=""> <label
									class="control-label" for="updatename"
									style="display: none;"></label>
							</div>
						</div>

 
                 	<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">昵称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatennicename"
									name="niceName1" placeholder=""> <label
									class="control-label" for="updatennicename"
									style="display: none;"></label>
							</div>
						</div>
						
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateemail"
									name="Email1" placeholder=""> <label
									class="control-label" for="updateemail" style="display: none;"></label>
							</div>
						</div>


						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatephone"
									name="phoneNumber1" placeholder=""> <label
									class="control-label" for="updatephone" style="display: none;"></label>
							</div>
						</div>
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">密码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatepassword"
									name="Password1" placeholder=""> <label
									class="control-label" for="updatepassword" style="display: none;"></label>
							</div>
						</div>
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">身份证号码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateidnumber"
									name="idNumber1" placeholder="" readonly="readonly"> <label
									class="control-label" for="updateidnumber" style="display: none;"></label>
							</div>
						</div>
					<div class="row">
						<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">可借阅天数</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="updatelend_num"
								name="lendNum1" placeholder=""> <label
								class="control-label" for="updatelend_num" style="display: none;"></label>
						</div>
					</div>

					<div class="row">
						<label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">最大借阅数量</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="updatemax_num"
								name="maxNum1" placeholder=""> 
								<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-updatemax_num">账号已存在</span>
								<label class="control-label" for="updatemax_num" style="display: none;"></label>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="upDateUser btn btn-primary">修改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
</div>
	</form>

	<!--------------------------------------添加的模糊框------------------------>
	<form>
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加新读者</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="username"
									id="addISBN" required="required" placeholder="请输入账号"> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addusername">请输入姓名</span>
									<label class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name"
									id="addBookName" required="required" placeholder="请输入姓名">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addname">请输入姓名</span>
								<label class="control-label" for="addBookName"
									style="display: none;"></label>
							</div>
						</div>



						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="addemail"
									id="addAutho" required="required" placeholder="请输入邮箱">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addemail">请输入邮箱</span>
								<label class="control-label" for="addAutho"
									style="display: none;"></label>
							</div>
						</div>


						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="phone"
									 required="required" placeholder="请输入手机号">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-phone">请输入手机号</span>
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>
						
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">身份证号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="addID"
									 required="required" placeholder="请输入身份证号">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addID">请输入身份证号</span>
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>
						
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="password"
									id="addPassword" required="required" placeholder="请输入密码">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addpassword">请输入身份证号</span>
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="lend_num"
									id="addlend_num" required="required" placeholder="请输入可借阅天数">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addlend_num">未知错误</span>
								<label class="control-label" for="addNum" style="display: none;"></label>
							</div>
						</div>
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">最大可借数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="max_num"
									id="addmax_num" required="required" placeholder="请输入最大可借数">
										<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-add">未知错误</span>
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>


						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="addUser btn btn-primary">添加</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	
	<form>
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addadminModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabe2" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加新管理者</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="adminname"
									id="addadminISBN" required="required" placeholder="请输入账号"> 
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadminname">请输入姓名</span>
									<label class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="admintruename"
									id="addadminName" required="required" placeholder="请输入姓名">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadmintruename">请输入姓名</span>
								<label class="control-label" for="addadminName"
									style="display: none;"></label>
							</div>
						</div>



						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="addadminemail"
									id="addadminAutho" required="required" placeholder="请输入邮箱">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadminemail">请输入邮箱</span>
								<label class="control-label" for="addadminAutho"
									style="display: none;"></label>
							</div>
						</div>


						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="adminphone"
									 required="required" placeholder="请输入手机号">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-adminphone">请输入手机号</span>
								<label class="control-label" for="addadminPress"
									style="display: none;"></label>
							</div>
						</div>
						
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">身份证号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="addadminID"
									 required="required" placeholder="请输入身份证号">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadminID">请输入身份证号</span>
								<label class="control-label" for="addadminPress"
									style="display: none;"></label>
							</div>
						</div>
						
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="adminpassword"
									id="addadminPassword" required="required" placeholder="请输入密码">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadminpassword">请输入身份证号</span>
								<label class="control-label" for="addadminPress"
									style="display: none;"></label>
							</div>
						</div>

						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="adminlend_num"
									id="addadminlend_num" required="required" placeholder="请输入可借阅天数">
									<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadminlend_num">未知错误</span>
								<label class="control-label" for="addadminNum" style="display: none;"></label>
							</div>
						</div>
						<div class="row">
							<label for="firstname" class="col-sm-3 control-label">最大可借数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="adminmax_num"
									id="addadminmax_num" required="required" placeholder="请输入最大可借数">
										<span class="form-ipt-error errorico-em" id="form-ipt-error-cl-addadmin">未知错误</span>
								<label class="control-label" for="addadminPress"
									style="display: none;"></label>
							</div>
						</div>


						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="addadmin btn btn-primary">添加</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>


	<script type="text/javascript">
	function break1 () {
		var con = confirm("是否退出?");
		if (con) {
			location.href= "http://120.26.187.198:8080/Library/login.jsp";
		}
	}
		//删除用户函数
		function showInfo2(aId, loginName, trueName, niceName,Email,phoneNumber, idNumber,Password, lendNum, maxNum) {	
			console.log("aId"+aId);
			document.getElementById("useraId").value = aId;
				document.getElementById("updateusername").value = loginName;
				document.getElementById("updatename").value = trueName;
				document.getElementById("updatennicename").value = niceName;
				document.getElementById("updateemail").value = Email;
				document.getElementById("updateidnumber").value = idNumber;
				document.getElementById("updatephone").value = phoneNumber;
				document.getElementById("updatepassword").value = Password;
				document.getElementById("updatelend_num").value = lendNum;
				document.getElementById("updatemax_num").value = maxNum;
			}
			function deletebook(aId) {
				var con = confirm("是否删除?");
				if (con) {
					window.location.href = "http://120.26.187.198:8080/Library/delUserServlet?aId=" + aId;
				}
			}
			
			//实现搜索功能
			 function ss() {
		        	$().ready(function(){
		  		      $("#txtName").keyup(
		  		        function(){          
		  		          $("table tr:gt(2)").hide();
		  		          var $d = $("table tr:gt(2)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show();   
		  		          
		  		          $("table tr:gt(0)").hide();
		  		          var $d = $("table tr:gt(0)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show(); 
		  		          
		  		          $("table tr:gt(1)").hide();
		  		          var $d = $("table tr:gt(1)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show();   
		  		          
		  		          $("table tr:gt(3)").hide();
		  		          var $d = $("table tr:gt(3)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show(); 
		  		          
		  		          $("table tr:gt(4)").hide();
		  		          var $d = $("table tr:gt(4)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show(); 
		  		          
		  		          $("table tr:gt(5)").hide();
		  		          var $d = $("table tr:gt(5)").filter(":contains('"+$.trim($("#txtName").val())+"')");
		  		          $d.show(); 
		  		        }
		  		      )
		  		    
		  		    });
				}
				$().ready(function(){
				      $("#txtName").keyup(
				        function(){          
				          $("table tr:gt(2)").hide();
				          var $d = $("table tr:gt(2)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show();   
				          
				          $("table tr:gt(0)").hide();
				          var $d = $("table tr:gt(0)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show(); 
				          
				          $("table tr:gt(1)").hide();
				          var $d = $("table tr:gt(1)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show();   
				          
				          $("table tr:gt(3)").hide();
				          var $d = $("table tr:gt(3)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show(); 
				          
				          $("table tr:gt(4)").hide();
				          var $d = $("table tr:gt(4)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show(); 
				          
				          $("table tr:gt(5)").hide();
				          var $d = $("table tr:gt(5)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show(); 
				        }
				      )
				    
				    });
			
		/*
		 * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
		 * （实现左侧菜单中的标签点击后变色的效果）
		 */
		$(document).ready(function () {
			$('ul.nav > li').click(function (e) {
				//e.preventDefault();	加上这句则导航的<a>标签会失效
				$('ul.nav > li').removeClass('active');
				$(this).addClass('active');
			});
		});
		
		/*
		 * 解决ajax返回的页面中含有javascript的办法：
		 * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
		 */
		function executeScript(html)
		{
		    
			var reg = /<script[^>]*>([^\x00]+)$/i;
		    //对整段HTML片段按<\/script>拆分
		    var htmlBlock = html.split("<\/script>");
		    for (var i in htmlBlock) 
		    {
		        var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
		        if (blocks = htmlBlock[i].match(reg)) 
		        {
		            //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
		            var code = blocks[1].replace(/<!--/, '');
		            try 
		            {
		                eval(code) //执行脚本
		            } 
		            catch (e) 
		            {
		            }
		        }
		    }
		}
		
		/*
		 * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
		 * 注意：
		 *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
		 *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
		 *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
		*/
		function showAtRight(url) {
			var xmlHttp;
			
			if (window.XMLHttpRequest) {
				// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlHttp=new XMLHttpRequest();	//创建 XMLHttpRequest对象
			}
			else {
				// code for IE6, IE5
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		
			xmlHttp.onreadystatechange=function() {		
				//onreadystatechange — 当readystate变化时调用后面的方法
				
				if (xmlHttp.readyState == 4) {
					//xmlHttp.readyState == 4	——	finished downloading response
					
					if (xmlHttp.status == 200) {
						//xmlHttp.status == 200		——	服务器反馈正常			
						
						document.getElementById("content").innerHTML=xmlHttp.responseText;	//重设页面中id="content"的div里的内容
						executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
					}
					//错误状态处理
					else if (xmlHttp.status == 404){
						alert("出错了☹   （错误代码：404 Not Found），……！"); 
						/* 对404的处理 */
						return;
					}
					else if (xmlHttp.status == 403) {  
						alert("出错了☹   （错误代码：403 Forbidden），……"); 
						/* 对403的处理  */ 
						return;
			        }
					else {
						alert("出错了☹   （错误代码：" + request.status + "），……"); 
						/* 对出现了其他错误代码所示错误的处理   */
						return;
					}   
				} 
		            
			  }
			
			//把请求发送到服务器上的指定文件（url指向的文件）进行处理
			xmlHttp.open("GET", url, true);		//true表示异步处理
			xmlHttp.send();
		}		
		</script>
	<script type="text/javascript">
		var pageSize = 5; //每页显示的记录条数   
		var curPage = 0; //显示第curPage页
		var len; //总行数
		var page; //总页数
		$(function() {
			len = $("#show_tab tr").length - 1; //去掉表头     
			page = len % pageSize == 0 ? len / pageSize : Math.floor(len
				/ pageSize) + 1; //根据记录条数，计算页数
			console.log("len:" + len + "page:" + page);
			document.getElementById("page").value = page;
			curPage = 1;
			displayPage(); //显示第一页
			$("#nextpage").click(function() { //下一页
				if (curPage < page) {
					curPage += 1;
				} else {
					alert("这是最后一页了！！");
				}
				displayPage();
			});
			$("#lastpage").click(function() { //上一页
				if (curPage > 1) {
					curPage -= 1;
				} else {
					alert("yishidiyiye");
				}
				displayPage();
			});
			$("#npage").click(function() { //跳到固定某一页
				var npage = parseInt(document.getElementById("curPage").value);
				if (npage > page || npage < 1) {
					alert("没有这一页！！！");
				} else {
					curPage = npage;
				}
				displayPage();
			});
		});
	
		function displayPage() {
			var begin = (curPage - 1) * pageSize; //起始记录号
			var end = begin + pageSize;
			console.log("  begin:" + len + "   end:" + end);
			if (end > len)
				end = len;
			$("#show_tab tr").hide();
			$("#show_tab tr").each(function(i) {
				if (i - 1 >= begin && i - 1 < end) //显示第page页的记录
				{
					$("#show_tab_one").show();
					$(this).show();
					document.getElementById("curPage").value = curPage;
				}
			});
		}
		function pageSize2() {
			curPage = 0; //显示第curPage页   
			pageSize = parseInt(document.getElementById("pageSize").value);
			len = $("#show_tab tr").length - 1; //去掉表头     
			page = len % pageSize == 0 ? len / pageSize : Math.floor(len
				/ pageSize) + 1; //根据记录条数，计算页数
			console.log("len:" + len + "   page:" + page);
			document.getElementById("page").value = page;
			curPage = 1;
			displayPage(); //显示第一页 
		}
	
		function selectAll(selectStatus) { //传入参数（全选框的选中状态）
			//根据name属性获取到单选框的input，使用each方法循环设置所有单选框的选中状态
			if (selectStatus) {
				$("input[name='check']").each(function(i, n) {
					n.checked = true;
				});
			} else {
				$("input[name='check']").each(function(i, n) {
					n.checked = false;
				});
			}
		}
	</script>

 <script type="text/javascript">
    //提交
	$(function(){ 
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
    		})
    	$(".upDateUser").on("click", function(){
    		var $aId1=$("input[name=aId1]");
    		var data = {};
    		data.loginName1 = $.trim($("input[name=loginName1]").val());
    		data.trueName1  = $.trim($("input[name=trueName1]").val());
    		data.niceName1  = $.trim($("input[name=niceName1]").val());
    		data.Email1 = $.trim($("input[name=Email1]").val());
    		data.phoneNumber1 = $.trim($("input[name=phoneNumber1]").val());
    		data.Password1 = $.trim($("input[name=Password1]").val());
    		data.idNumber1 = $.trim($("input[name=idNumber1]").val());
    		data.lendNum1 = $.trim($("input[name=lendNum1]").val());
    		data.maxNum1 = $.trim($("input[name=maxNum1]").val());
    		data.aId1 = $.trim($aId1.val());
    		$.ajax({
    	        url: "http://120.26.187.198:8080/Library/upUserServlet",
    	        async : true,
    	        type: "post",
    	        dataType: "text",
    	        data: data,
    	        success: function (data) {
    	        	if(data =='1'){
    	        	window.location.href =window.location.href;
    	        		return ;
    	        	}
    	        	if(data =='-4'){
    	        		$("#form-ipt-error-cl-updatemax_num").addClass("is-visible");
    	                $("#form-ipt-error-cl-updatemax_num").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-updatemax_num").html("未知错误");
    	        		alert("未知错误");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-updatemax_num").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-updatemax_num").prev().removeClass("input-error");
    	        	}
    	        	if(data =='-2'){
    	        		$("#form-ipt-error-cl-updateusername").addClass("is-visible");
    	                $("#form-ipt-error-cl-updateusername").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-updateusername").html("账号已存在");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-updateusername").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-updateusername").prev().removeClass("input-error");
    	        	} 
    	        }
        	});
    		})
    		
    		$(".addUser").on("click", function(){
    		var data = {};
    		data.username=$.trim($("input[name=username]").val());
    		data.name = $.trim($("input[name=name]").val());
    		data.addemail  = $.trim($("input[name=addemail]").val());
    		data.phone  = $.trim($("input[name=phone]").val());
    		data.addID = $.trim($("input[name=addID]").val());
    		data.password = $.trim($("input[name=password]").val());
    		data.lend_num = $.trim($("input[name=lend_num]").val());
    		data.max_num = $.trim($("input[name=max_num]").val());
    		 
    		var reg8=/^\d{6,11}$/;
    		if(!reg8.test(data.username)){
    			$("#form-ipt-error-cl-addusername").addClass("is-visible");
                $("#form-ipt-error-cl-addusername").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addusername").html("请输入6到11位的账号");
    			alert('请输入6到11位的账号');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addusername").removeClass("is-visible");
    			$("#form-ipt-error-cl-addusername").prev().removeClass("input-error");
    		}
    		var reg2 =/^([\u4e00-\u9fa5]){2,7}$/;
    		if(!reg2.test(data.name)){
    			$("#form-ipt-error-cl-addname").addClass("is-visible");
                $("#form-ipt-error-cl-addname").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addname").html("请输入合法的姓名");
    			alert('请输入合法的姓名');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addname").removeClass("is-visible");
    			$("#form-ipt-error-cl-addname").prev().removeClass("input-error");
    		}
    		var reg5 = /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/
        		if(!reg5.test(data.addemail)){
        			$("#form-ipt-error-cl-addemail").addClass("is-visible");
                    $("#form-ipt-error-cl-addemail").prev().addClass("input-error");
        			$("#form-ipt-error-cl-addemail").html("请输入有效的邮箱账号");
        			alert('请输入有效的邮箱账号');
        			return ;
        			}else{
        				$("#form-ipt-error-cl-addemail").removeClass("is-visible");
            			$("#form-ipt-error-cl-addemail").prev().removeClass("input-error");
        		}
    		var reg = /^1\d{10}$/;
    		if(!reg.test(data.phone)){
    			$("#form-ipt-error-cl-phone").addClass("is-visible");
                $("#form-ipt-error-cl-phone").prev().addClass("input-error");
    			$("#form-ipt-error-cl-phone").html("请输入合法的手机号码");
    			alert('请输入合法的手机号码');
    			return false;
    		}else{
    			$("#form-ipt-error-cl-phone").removeClass("is-visible");
    			$("#form-ipt-error-cl-phone").prev().removeClass("input-error");
    		}
    		if(data.addID == '' || data.addID ==null  || data.addID == "undefined"){
    			$("#form-ipt-error-cl-addID").addClass("is-visible");
                $("#form-ipt-error-cl-addID").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addID").html("请输入身份证号");
    			alert("请输入身份证号");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addID").removeClass("is-visible");
    			$("#form-ipt-error-cl-addID").prev().removeClass("input-error");
    		}
    		var reg3 =/^[a-zA-Z]\w{5,17}$/;
    		if(!reg3.test(data.password)){
    			$("#form-ipt-error-cl-addpassword").addClass("is-visible");
                $("#form-ipt-error-cl-addpassword").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addpassword").html("请输入以字母开头6到18位的密码");
    			alert('请输入以字母开头6到18位的密码');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addpassword").removeClass("is-visible");
    			$("#form-ipt-error-cl-addpassword").prev().removeClass("input-error");
    		}
    		
    		if(data.lend_num == '' || data.lend_num ==null  || data.lend_num == "undefined"){
    			$("#form-ipt-error-cl-addlend_num").addClass("is-visible");
                $("#form-ipt-error-cl-addlend_num").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addlend_num").html("请输入借阅天数");
    			alert("请输入借阅天数");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addlend_num").removeClass("is-visible");
    			$("#form-ipt-error-cl-addlend_num").prev().removeClass("input-error");
    		}
    		if(data.max_num == '' || data.max_num ==null  || data.max_num == "undefined"){
    			$("#form-ipt-error-cl-add").addClass("is-visible");
                $("#form-ipt-error-cl-add").prev().addClass("input-error");
    			$("#form-ipt-error-cl-add").html("请输入最大借阅数量");
    			alert("请输入最大借阅数量");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-add").removeClass("is-visible");
    			$("#form-ipt-error-cl-add").prev().removeClass("input-error");
    		}
    		data.add=1;
    		data.admin=0;
    		$.ajax({
    	        url: "http://120.26.187.198:8080/Library/addUserServlet",
    	        async : true,
    	        type: "post",
    	        dataType: "text",
    	        data: data,
    	        success: function (data) {
    	        	if(data =='1'){
    	        	window.location.href =window.location.href;
    	        		return ;
    	        	}
    	        	if(data =='-4'){
    	        		$("#form-ipt-error-cl-add").addClass("is-visible");
    	                $("#form-ipt-error-cl-add").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-add").html("未知错误");
    	        		alert("未知错误");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-add").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-add").prev().removeClass("input-error");
    	        	}
    	        	if(data =='-2'){
    	        		$("#form-ipt-error-cl-addID").addClass("is-visible");
    	                $("#form-ipt-error-cl-addID").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addID").html("请输入合法的身份证号");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addID").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addID").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-5'){
    	        		$("#form-ipt-error-cl-addusername").addClass("is-visible");
    	                $("#form-ipt-error-cl-addusername").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addusername").html("该账号已存在");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addusername").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addusername").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-6'){
    	        		$("#form-ipt-error-cl-phone").addClass("is-visible");
    	                $("#form-ipt-error-cl-phone").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-phone").html("该手机号已注册");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-phone").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-phone").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-7'){
    	        		$("#form-ipt-error-cl-addID").addClass("is-visible");
    	                $("#form-ipt-error-cl-addID").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addID").html("该身份证号已绑定");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addID").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addID").prev().removeClass("input-error");
    	        	} 
    	        }
        	});
    		})
    		$(".addadmin").on("click", function(){
    		var data = {};
    		data.username=$.trim($("input[name=adminname]").val());
    		data.name = $.trim($("input[name=admintruename]").val());
    		data.addemail  = $.trim($("input[name=addadminemail]").val());
    		data.phone  = $.trim($("input[name=adminphone]").val());
    		data.addID = $.trim($("input[name=addadminID]").val());
    		data.password = $.trim($("input[name=adminpassword]").val());
    		data.lend_num = $.trim($("input[name=adminlend_num]").val());
    		data.max_num = $.trim($("input[name=adminmax_num]").val());
    		 
    		var reg8=/^\d{6,11}$/;
    		if(!reg8.test(data.username)){
    			$("#form-ipt-error-cl-addadminname").addClass("is-visible");
                $("#form-ipt-error-cl-addadminname").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadminname").html("请输入6到11位的账号");
    			alert('请输入6到11位的账号');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadminname").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadminname").prev().removeClass("input-error");
    		}
    		var reg2 =/^([\u4e00-\u9fa5]){2,7}$/;
    		if(!reg2.test(data.name)){
    			$("#form-ipt-error-cl-addadmintruename").addClass("is-visible");
                $("#form-ipt-error-cl-addadmintruename").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadmintruename").html("请输入合法的姓名");
    			alert('请输入合法的姓名');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadmintruename").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadmintruename").prev().removeClass("input-error");
    		}
    		var reg5 = /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/
        		if(!reg5.test(data.addemail)){
        			$("#form-ipt-error-cl-addadminemail").addClass("is-visible");
                    $("#form-ipt-error-cl-addadminemail").prev().addClass("input-error");
        			$("#form-ipt-error-cl-addadminemail").html("请输入有效的邮箱账号");
        			alert('请输入有效的邮箱账号');
        			return ;
        			}else{
        				$("#form-ipt-error-cl-addadminemail").removeClass("is-visible");
            			$("#form-ipt-error-cl-addadminemail").prev().removeClass("input-error");
        		}
    		var reg = /^1\d{10}$/;
    		if(!reg.test(data.phone)){
    			$("#form-ipt-error-cl-adminphone").addClass("is-visible");
                $("#form-ipt-error-cl-adminphone").prev().addClass("input-error");
    			$("#form-ipt-error-cl-adminphone").html("请输入合法的手机号码");
    			alert('请输入合法的手机号码');
    			return false;
    		}else{
    			$("#form-ipt-error-cl-adminphone").removeClass("is-visible");
    			$("#form-ipt-error-cl-adminphone").prev().removeClass("input-error");
    		}
    		if(data.addID == '' || data.addID ==null  || data.addID == "undefined"){
    			$("#form-ipt-error-cl-addadminID").addClass("is-visible");
                $("#form-ipt-error-cl-addadminID").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadminID").html("请输入身份证号");
    			alert("请输入身份证号");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadminID").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadminID").prev().removeClass("input-error");
    		}
    		var reg3 =/^[a-zA-Z]\w{5,17}$/;
    		if(!reg3.test(data.password)){
    			$("#form-ipt-error-cl-addadminpassword").addClass("is-visible");
                $("#form-ipt-error-cl-addadminpassword").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadminpassword").html("请输入以字母开头6到18位的密码");
    			alert('请输入以字母开头6到18位的密码');
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadminpassword").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadminpassword").prev().removeClass("input-error");
    		}
    		
    		if(data.lend_num == '' || data.lend_num ==null  || data.lend_num == "undefined"){
    			$("#form-ipt-error-cl-addadminlend_num").addClass("is-visible");
                $("#form-ipt-error-cl-addadminlend_num").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadminlend_num").html("请输入借阅天数");
    			alert("请输入借阅天数");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadminlend_num").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadminlend_num").prev().removeClass("input-error");
    		}
    		if(data.max_num == '' || data.max_num ==null  || data.max_num == "undefined"){
    			$("#form-ipt-error-cl-addadmin").addClass("is-visible");
                $("#form-ipt-error-cl-addadmin").prev().addClass("input-error");
    			$("#form-ipt-error-cl-addadmin").html("请输入最大借阅数量");
    			alert("请输入最大借阅数量");
    			return ;
    		}else{
    			$("#form-ipt-error-cl-addadmin").removeClass("is-visible");
    			$("#form-ipt-error-cl-addadmin").prev().removeClass("input-error");
    		}
    		data.add=1;
    		data.admin=1;
    		$.ajax({
    	        url: "http://120.26.187.198:8080/Library/addUserServlet",
    	        async : true,
    	        type: "post",
    	        dataType: "text",
    	        data: data,
    	        success: function (data) {
    	        	if(data =='1'){
    	        	window.location.href =window.location.href;
    	        		return ;
    	        	}
    	        	if(data =='-4'){
    	        		$("#form-ipt-error-cl-addadmin").addClass("is-visible");
    	                $("#form-ipt-error-cl-addadmin").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addadmin").html("未知错误");
    	        		alert("未知错误");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addadmin").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addadmin").prev().removeClass("input-error");
    	        	}
    	        	if(data =='-2'){
    	        		$("#form-ipt-error-cl-addadminID").addClass("is-visible");
    	                $("#form-ipt-error-cl-addadminID").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addadminID").html("请输入合法的身份证号");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addadminID").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addadminID").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-5'){
    	        		$("#form-ipt-error-cl-addadminusername").addClass("is-visible");
    	                $("#form-ipt-error-cl-addadminusername").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addadminusername").html("该账号已存在");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addadminusername").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addadminusername").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-6'){
    	        		$("#form-ipt-error-cl-adminphone").addClass("is-visible");
    	                $("#form-ipt-error-cl-adminphone").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-adminphone").html("该手机号已注册");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-adminphone").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-adminphone").prev().removeClass("input-error");
    	        	} 
    	        	if(data =='-7'){
    	        		$("#form-ipt-error-cl-addadminID").addClass("is-visible");
    	                $("#form-ipt-error-cl-addadminID").prev().addClass("input-error");
    	    			$("#form-ipt-error-cl-addadminID").html("该身份证号已绑定");
    	        		return ;
    	        	}  else{
    	        		$("#form-ipt-error-cl-addadminID").removeClass("is-visible");
    	    			$("#form-ipt-error-cl-addadminID").prev().removeClass("input-error");
    	        	} 
    	        }
        	});
    		})
	});
    </script>

</body>
</html>