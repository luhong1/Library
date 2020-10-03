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
<title>用户界面</title>


<style type="text/css">
#tabContainer {
	margin: 30px;
}

#tabContainer li {
	float: left;
	width: 80px;
	margin: 0 3px;
	background: #efefef;
	text-align: center;
}

#tabContainer a {
	display: block;
}

#tabContainer a.on {
	background: pink;
}
</style>

<script type="text/javascript">
	function switchTab(ProTag, ProBox) {
		for (i = 1; i < 5; i++) {
			if ("tab" + i == ProTag) {
				document.getElementById(ProTag).getElementsByTagName("a")[0].className = "on";
			} else {
				document.getElementById("tab" + i).getElementsByTagName("a")[0].className = "";
			}
			if ("con" + i == ProBox) {
				document.getElementById(ProBox).style.display = "";
			} else {
				document.getElementById("con" + i).style.display = "none";
			}
		}
	}
</script>
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
					<li class="active"><a href="#userMeun"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-user"></i>&nbsp; 书籍管理 <span class="sr-only">(current)</span>
					</a></li>
					<!-- 二级菜单 -->
					<!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
					<ul id="userMeun" class="nav nav-list collapse menu-second">
						<li><a href="borrow.jsp"><i class="fa fa-users"></i> 借书</a></li>
						<li><a href="return.jsp"><i class="fa fa-users"></i> 还书</a></li>
						  <li><a href="chat.jsp" ><i class="fa fa-users"></i> 社交</a></li>	
					</ul>
					<li><a href="#productMeun"
						class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp; 个人信息 <span class="sr-only">(current)</span>
					</a></li>
					<ul id="productMeun" class="nav nav-list collapse menu-second">
						<li><a href="User.jsp"><i class="fa fa-list-alt"></i>
								基本信息</a></li>
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
			<div class="col-xs-11.5 main">
				<h1 class="page-header">图书板块</h1>

				<div class="panel panel-primary">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<div class="text-muted bootstrap-admin-box-title">图书分类</div>
					</div>
							<div class="bootstrap-admin-panel-content">
								<div id="tabContainer">
									<ul>
										<li id="tab1"><a href="#" class="on"
											onclick="switchTab('tab1','con1');this.blur();return false;">
												神话</a></li>
										<li id="tab2"><a href="#"
											onclick="switchTab('tab2','con2');this.blur();return false;">
												战争</a></li>
										<li id="tab3"><a href="#"
											onclick="switchTab('tab3','con3');this.blur();return false;">
												职场</a></li>
										<li id="tab4"><a href="#"
											onclick="switchTab('tab4','con4');this.blur();return false;">
												哲学</a></li>
										<li id="tab5"><a href="#"
											onclick="switchTab('tab5','con5');this.blur();return false;">
												心理</a></li>
										<li id="tab6"><a href="#"
											onclick="switchTab('tab6','con6');this.blur();return false;">
												儿童</a></li>
										<li id="tab7"><a href="#"
											onclick="switchTab('tab7','con7');this.blur();return false;">
												自然</a></li>
										<li id="tab8"><a href="#"
											onclick="switchTab('tab8','con8');this.blur();return false;">
												百科</a></li>
										<li id="tab9"><a href="#"
											onclick="switchTab('tab9','con9');this.blur();return false;">
												文学</a></li>
										<li id="tab10"><a href="#"
											onclick="switchTab('tab10','con10');this.blur();return false;">
												历史</a></li>
										<li id="tab11"><a href="#"
											onclick="switchTab('tab11','con11');this.blur();return false;">
												法律</a></li>
										<li id="tab12"><a href="#"
											onclick="switchTab('tab12','con12');this.blur();return false;">
												管理</a></li>
										<li id="tab13"><a href="#"
											onclick="switchTab('tab13','con13');this.blur();return false;">
												传记</a></li>

									</ul>
									<div style="clear: both"></div>
									<div id="con1">
										<table class="table table-bordered" id="show_tab">
											<thead>
								      <tr id="show_tab_one">
							    <!--  <th><input type="checkbox"
										onclick="selectAll(this.checked)" /></th>
									<th scope="col">图书号</th>
									<th scope="col">图书类型</th>
									<th scope="col">图书名称</th>
									<th scope="col">作者名称</th>
									<th scope="col">出版社</th>
									<th scope="col">总数量</th>
									<th scope="col" style="text-align: center;">操作</th>  -->
								     </tr> 
							           </thead> 
											<tbody id="tbody">
												<%
													ArrayList<Book> bookData = new ArrayList<Book>();
													bookService bookService = new bookServiceImpl();
													bookData = (ArrayList<Book>) bookService.getAllBookInfo();
													int i = 0;
													int j = 1;
													for (Book b1 : bookData) {
														i++;
												%>
												<%
													if (j == 1) {
												%>
												<tr id="show_tab_tr" class="show_book">
													<%
														j = 0;
															}	
													%>
												
													<%
														
													%>
											<td width="20%" height="200px" align="center"><a href="#"
										onClick="bkInformation(<%=b1.getbId() %>);return false;"><img
											alt="logo图片" src="../img/book.png"></a><br> <a
										href="#"
										onClick="bkInformation(<%=b1.getbId() %>);return false;">
											<font color="gray"><%=b1.getBookName()%></font>
									</a><br> <a href="#"
										onClick="bkInformation(<%=b1.getbId() %>);return false;">
											<font color="gray"><%=b1.getBookSort()%></font>
									</a></td>
													<%
														if (i == 5) {
													%>
												</tr>
												<%
													break;}
												%>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
									<div id="con2" style="display: none">霉运也是一种运气...</div>
									<div id="con3" style="display: none">缘份纯粹是蒙人的东西...</div>
									<div id="con4" style="display: none">人生就是人"生"出来之后的过程...</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
</div>
			<!-------------------------------------------------------------->


			<form>

				<!-- 模态框（Modal） -->
				<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">修改密码</h4>
							</div>
							<div class="modal-body">

								<!--正文-->
								<input type="hidden" name="flag" value="1"> <input
									type="hidden" name="url" value="index">
								<div class="row">
									<label for="firstname" class="col-sm-3 control-label"
										style="padding-top: 10px;">原密码</label>
									<div class="col-sm-7">
										<input type="password" class="form-control" name="Password"
											id="oldPwd" placeholder="请输入原密码"> <span
											class="form-ipt-error errorico-em"
											id="form-ipt-error-cl-password1">新密码不能为空</span> <label
											class="control-label" style="display: none"></label>
									</div>
								</div>

								<div class="row">
									<label for="firstname" class="col-sm-3 control-label"
										style="padding-top: 10px;">新密码</label>
									<div class="col-sm-7">
										<input type="password" class="form-control" name="Password2"
											id="Password2" placeholder="请输入新密码"> <span
											class="form-ipt-error errorico-em"
											id="form-ipt-error-cl-password2">新密码不能为空</span> <label
											class="control-label" style="display: none"></label>

									</div>
								</div>
								<div class="row">
									<label for="firstname" class="col-sm-3 control-label"
										style="padding-top: 10px;">确认密码</label>
									<div class="col-sm-7">
										<input type="password" class="form-control" name="Password3"
											id="Password3" placeholder="请输入新密码"> <span
											class="form-ipt-error errorico-em"
											id="form-ipt-error-cl-password3">确认密码不能为空</span> <label
											class="control-label" style="display: none"></label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="sub-btn6 btn btn-primary">修改</button>
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
									<label for="firstname" class="col-sm-3 control-label"
										style="padding-top: 10px;">真实姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="trueName"
											name="trueName" placeholder="请输入您的真实姓名"
											value='<%=user.getTrueName()%>'> <span
											class="form-ipt-error errorico-em"
											id="form-ipt-error-cl-trueName">姓名不能为空</span> <label
											class="control-label" style="display: none"></label>
									</div>
								</div>

								<div class="row">
									<label for="firstname" class="col-sm-3 control-label"
										style="padding-top: 10px;">邮箱</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="Email"
											name="Email" placeholder="请输入您的邮箱"
											value='<%=user.getEmail()%>'> <span
											class="form-ipt-error errorico-em"
											id="form-ipt-error-cl-Email">邮箱不能为空</span> <label
											class="control-label" style="display: none"></label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="sub-btn5 btn btn-primary">修改</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

			</form>

			<!-------------------------------------------------------------->



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








			<script type="text/javascript">
			function bkInformation(bId){
				var aId=<%=session.getAttribute("aId")%>;
				if(aId==null || aId==" "){
					alert("还未登录，请去登录！！")
					window.location.href="http://120.26.187.198:8080/Library/login.jsp";
				}else{
				window.location.href="http://120.26.187.198:8080/Library/user_jsp/bkInformation.jsp?bId="+bId;
				}
			}
		   function break1 () {
			var con = confirm("是否退出?");
			if (con) {
				location.href= "http://120.26.187.198:8080/Library/login.jsp";
			}
		}
			/*
			 * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
			 * （实现左侧菜单中的标签点击后变色的效果）
			 */
			$(document).ready(function() {
				$('ul.nav > li').click(function(e) {
					//e.preventDefault();	加上这句则导航的<a>标签会失效
					$('ul.nav > li').removeClass('active');
					$(this).addClass('active');
				});
			});

			/*
			 * 解决ajax返回的页面中含有javascript的办法：
			 * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
			 */
			function executeScript(html) {

				var reg = /<script[^>]*>([^\x00]+)$/i;
				//对整段HTML片段按<\/script>拆分
				var htmlBlock = html.split("<\/script>");
				for (var i in htmlBlock) {
					var blocks; //匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
					if (blocks = htmlBlock[i].match(reg)) {
						//清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
						var code = blocks[1].replace(/<!--/, '');
						try {
							eval(code) //执行脚本
						} catch (e) {}
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
					xmlHttp = new XMLHttpRequest(); //创建 XMLHttpRequest对象
				} else {
					// code for IE6, IE5
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}

				xmlHttp.onreadystatechange = function() {
					//onreadystatechange — 当readystate变化时调用后面的方法

					if (xmlHttp.readyState == 4) {
						//xmlHttp.readyState == 4	——	finished downloading response

						if (xmlHttp.status == 200) {
							//xmlHttp.status == 200		——	服务器反馈正常			

							document.getElementById("content").innerHTML = xmlHttp.responseText; //重设页面中id="content"的div里的内容
							executeScript(xmlHttp.responseText); //执行从服务器返回的页面内容里包含的JavaScript函数
						}
						//错误状态处理
						else if (xmlHttp.status == 404) {
							alert("出错了☹   （错误代码：404 Not Found），……！");
							/* 对404的处理 */
							return;
						} else if (xmlHttp.status == 403) {
							alert("出错了☹   （错误代码：403 Forbidden），……");
							/* 对403的处理  */
							return;
						} else {
							alert("出错了☹   （错误代码：" + request.status + "），……");
							/* 对出现了其他错误代码所示错误的处理   */
							return;
						}
					}

				}

				//把请求发送到服务器上的指定文件（url指向的文件）进行处理
				xmlHttp.open("GET", url, true); //true表示异步处理
				xmlHttp.send();
			}
		</script>
			<script type="text/javascript">
			//$(function(){
			// var data = $.cookie("data");
			//  var m = JSON.parse(data);
			// $("#name").val(m.aID);
			//console.log(m.aID);
			//});
			</script>
			<script type="text/javascript">
				//提交
				$(function() {
					$(".sub-btn6").on("click", function() {
						var $password = $("input[name=Password]");
						var data = {};
						data.password1 = $.trim($("input[name=Password2]").val());
						data.password2 = $.trim($("input[name=Password3]").val());
						data.password = $.trim($password.val());
						if (data.password == '' || data.password == null || data.password == "undefined") {
							$("#form-ipt-error-cl-password1").addClass("is-visible");
							$("#form-ipt-error-cl-password1").prev().addClass("input-error");
							$("#form-ipt-error-cl-password1").html("请输入以字母开头，长度在6-18之间的新密码");
							alert("请输入新密码");
							return;
						} else {
							$("#form-ipt-error-cl-password1").removeClass("is-visible");
							$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
						}
						var reg1 = /^[a-zA-Z]\w{5,17}$/;
						if (data.password1 == '' || data.password1 == null || data.password1 == "undefined") {
							$("#form-ipt-error-cl-password2").addClass("is-visible");
							$("#form-ipt-error-cl-password2").prev().addClass("input-error");
							$("#form-ipt-error-cl-password2").html("请输入以字母开头，长度在6-18之间的新密码");
							alert("请输入新密码");
							return;
						} else {
							$("#form-ipt-error-cl-password2").removeClass("is-visible");
							$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
						}
						if (!reg1.test(data.password1)) {
							$("#form-ipt-error-cl-password2").addClass("is-visible");
							$("#form-ipt-error-cl-password2").prev().addClass("input-error");
							$("#form-ipt-error-cl-password2").html("请输入有效的密码");
							alert('请输入有效的密码');
							return;
						} else {
							$("#form-ipt-error-cl-password2").removeClass("is-visible");
							$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
						}
						if (data.password2 == '' || data.password2 == null || data.password2 == "undefined") {
							$("#form-ipt-error-cl-password3").addClass("is-visible");
							$("#form-ipt-error-cl-password3").prev().addClass("input-error");
							$("#form-ipt-error-cl-password3").html("确认密码不能为空");
							alert('请输入确认密码');
							return;
						} else {
							$("#form-ipt-error-cl-password3").removeClass("is-visible");
							$("#form-ipt-error-cl-password3").prev().removeClass("input-error");
						}
						if (data.password1 != data.password2) {
							$("#form-ipt-error-cl-password3").addClass("is-visible");
							$("#form-ipt-error-cl-password3").prev().addClass("input-error");
							$("#form-ipt-error-cl-password3").html("两次输入的密码不相同");
							alert('两次输入的密码不相同');
							return;
						} else {
							$("#form-ipt-error-cl-password3").removeClass("is-visible");
							$("#form-ipt-error-cl-password3").prev().removeClass("input-error");
						}
						data.repassword = 0;
						$.ajax({
							url : "http://120.26.187.198:8080/Library/chUserPassword",
							async : true,
							type : "post",
							dataType : "text",
							data : data,
							success : function(data) {
								if (data == '1') {
									alert("修改成功");
									window.location.href = "http://120.26.187.198:8080/Library/login.jsp";
									return;
								}
								if (data == '-4') {
									$("#form-ipt-error-cl-password1").addClass("is-visible");
									$("#form-ipt-error-cl-password1").prev().addClass("input-error");
									$("#form-ipt-error-cl-password1").html("未知错误");
									alert("未知错误");
									return;
								} else {
									$("#form-ipt-error-cl-password1").removeClass("is-visible");
									$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
								}
								if (data == '-8') {
									$("#form-ipt-error-cl-password2").addClass("is-visible");
									$("#form-ipt-error-cl-password2").prev().addClass("input-error");
									$("#form-ipt-error-cl-password2").html("旧密码和新密码相同");
									alert("旧密码和新密码相同");
									return;
								} else {
									$("#form-ipt-error-cl-password2").removeClass("is-visible");
									$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
								}
								if (data == '-5') {
									$("#form-ipt-error-cl-password1").addClass("is-visible");
									$("#form-ipt-error-cl-password1").prev().addClass("input-error");
									$("#form-ipt-error-cl-password1").html("原始密码错误");
									alert("原始密码错误");
									return;
								} else {
									$("#form-ipt-error-cl-password1").removeClass("is-visible");
									$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
								}
							}
						});
					})
					$(".sub-btn5").on("click", function() {
						var $Email = $("input[name=Email]");
						var data = {};
						data.trueName = $.trim($("input[name=trueName]").val());
						data.Email = $.trim($Email.val());
						if (data.Email == '' || data.Email == null || data.Email == "undefined") {
							$("#form-ipt-error-cl-Email").addClass("is-visible");
							$("#form-ipt-error-cl-Email").prev().addClass("input-error");
							$("#form-ipt-error-cl-Email").html("邮箱不能为空");
							alert("请输入邮箱");
							return;
						} else {
							$("#form-ipt-error-cl-Email").removeClass("is-visible");
							$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
						}
						var reg5 = /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/
						if (!reg5.test(data.Email)) {
							$("#form-ipt-error-cl-Email").addClass("is-visible");
							$("#form-ipt-error-cl-Email").prev().addClass("input-error");
							$("#form-ipt-error-cl-Email").html("请输入有效的邮箱账号");
							alert('请输入有效的邮箱账号');
							return;
						} else {
							$("#form-ipt-error-cl-Email").removeClass("is-visible");
							$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
						}
						if (data.trueName == '' || data.trueName == null || data.trueName == "undefined") {
							$("#form-ipt-error-cl-trueName").addClass("is-visible");
							$("#form-ipt-error-cl-trueName").prev().addClass("input-error");
							$("#form-ipt-error-cl-trueName").html("请输入姓名");
							alert("请输入姓名");
							return;
						} else {
							$("#form-ipt-error-cl-trueName").removeClass("is-visible");
							$("#form-ipt-error-cl-trueName").prev().removeClass("input-error");
						}
						var reg3 = /^([\u4e00-\u9fa5]){2,7}$/;
						if (!reg3.test(data.trueName)) {
							$("#form-ipt-error-cl-trueName").addClass("is-visible");
							$("#form-ipt-error-cl-trueName").prev().addClass("input-error");
							$("#form-ipt-error-cl-trueName").html("请输入合法的姓名");
							alert('请输入合法的姓名');
							return;
						} else {
							$("#form-ipt-error-cl-trueName").removeClass("is-visible");
							$("#form-ipt-error-cl-trueName").prev().removeClass("input-error");
						}
						data.flag = 0;
						$.ajax({
							url : "http://120.26.187.198:8080/Library/adminServlet",
							async : true,
							type : "post",
							dataType : "text",
							data : data,
							success : function(data) {
								if (data == '1') {
									alert("修改成功");
									window.location.href = window.location.href;
									return;
								}
								if (data == '-4') {
									$("#form-ipt-error-cl-Email").addClass("is-visible");
									$("#form-ipt-error-cl-Email").prev().addClass("input-error");
									$("#form-ipt-error-cl-Email").html("未知错误");
									alert("未知错误");
									return;
								} else {
									$("#form-ipt-error-cl-Email").removeClass("is-visible");
									$("#form-ipt-error-cl-Email").prev().removeClass("input-error");
								}
							}
						});
					})
				});
			</script>
</body>
</html>
