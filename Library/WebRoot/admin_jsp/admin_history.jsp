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
<title>在线图书管理系统</title>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
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
						class="glyphicon glyphicon-user"></i> 欢迎您，<%=user.getTrueName()%>
				</a>

					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownMenu1">
						<li role="presentation"><a href="#updateinfo"
							data-toggle="modal">个人资料</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a href="#updatepwd"
							data-toggle="modal">修改密码</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a href="#" onClick="break1();return false;">退出</a></li>
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
						<li><a href="admin_history.jsp"><i class="fa fa-users"></i>
								订单管理</a></li>
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
	<div
		class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main bg bg-success">


		<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
		<div id="content" class="bg bg-success">

			<div class="col-xs-0.5"></div>
			<div class="col-xs-11.5 main">
				<h1 class="page-header">图书借阅信息</h1>

				<div class="panel panel-primary">
					<!-- Default panel contents -->
					<div class="panel-heading">
						书籍列表 <i class="fa fa-thumb-tack pull-right"></i>
					</div>
					<div class="panel-body">
					<div class="row" style="margin-bottom: 15px">
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" id="txtName" name="txtName" class="form-control" placeholder="根据图书名称/读者账号/读者姓名/还书状态  进行搜索">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick="ss()">搜索</button>
									</span>
								</div>
								<!-- /input-group -->

							</div>
							<!-- /.col-md-4 -->
						</div>
						<table class="table table-bordered" id="show_tab">
							<thead>
								<tr id="show_tab_one">
									<th><input type="checkbox"
										onclick="selectAll(this.checked)" /></th>
									<th scope="col">图书号</th>
									<th scope="col">图书名称</th>
									<th scope="col">读者账号</th>
									<th scope="col">读者姓名</th>
									<th scope="col">借阅时间</th>
									<th scope="col">还书时间</th>
									<th scope="col">还书状态</th>
								</tr>
							</thead>
							<%
								ArrayList<History> bookdata = new ArrayList<History>();
								bookdata = (ArrayList<History>)request.getAttribute("data");
								if(bookdata == null){
									bookService bookService = new bookServiceImpl();
									bookdata = (ArrayList<History>)bookService.getAllHistory2();
								}
								for(History his : bookdata){
							%>


							<tbody>
								<tr id="show_tab_tr">
									<td><input type="checkbox" name="check" /></td>
									<td><%=his.getBookNo() %></td>
									<td><%=his.getBookName() %></td>
									<td><%=his.getLoginName() %></td>
									<td><%=his.getTrueName() %></td>
									<td><%=his.getBeginTime() %></td>
									<td><%=his.getEndTime() %></td>
									<%if(his.getStatus()==1) {%>
										<td style="text-align:center;"><span class="btn btn-info btn-xs" >未还</span></td>
									<%}else{%>
									<td style="text-align:center;"><span class="btn btn-info btn-xs" >已还</span></td>
									<%} %>
								</tr>
							</tbody>
							<%
								}
							%>
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
	function break1 () {
		var con = confirm("是否退出?");
		if (con) {
			location.href= "http://120.26.187.198:8080/Library/login.jsp";
		}
	}
			//修改和删除书籍函数
			function showInfo2(bid, card, type, name, autho, press, num) {
				document.getElementById("updateISBN").value = card;
				document.getElementById("updateBookName").value = name;
				document.getElementById("updateAutho").value = autho;
				document.getElementById("updatePress").value = press;
				document.getElementById("updateBookType").value = type;
				document.getElementById("updateNum").value = num;
				document.getElementById("updateBookId").value = bid;
			}
			function deletebook(bid) {
				con = confirm("是否删除?");
				if (con == true) {
					location.href = "http://120.26.187.198:8080/Library/deleteServlet?bid=" + bid;
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
		  		          
		  		          $("table tr:gt(6)").hide();
		  		          var $d = $("table tr:gt(6)").filter(":contains('"+$.trim($("#txtName").val())+"')");
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
				          
				          $("table tr:gt(6)").hide();
				          var $d = $("table tr:gt(6)").filter(":contains('"+$.trim($("#txtName").val())+"')");
				          $d.show(); 
				          
				        }
				      )
				    
				    });
			
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
		var pageSize = 5; //每页显示的记录条数   
		var curPage = 0; //显示第curPage页
		var len; //总行数
		var page; //总页数
		$(function() {
			len = $("#show_tab tr").length - 1; //去掉表头     
			page = len % pageSize == 0 ? len / pageSize : Math.floor(len /
				pageSize) + 1; //根据记录条数，计算页数
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
			page = len % pageSize == 0 ? len / pageSize : Math.floor(len /
				pageSize) + 1; //根据记录条数，计算页数
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
	});
    </script>


</body>
</html>
