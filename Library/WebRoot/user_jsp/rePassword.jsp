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
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
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
        <title>找回密码 </title>
<script>
	function getBasePath(){
	    return '<%=basePath%>';
    }
</script>
<script type="text/javascript">
$(function(){ 
	//短信验证码倒计时
	var countdownHandler = function(){ 
		var $button = $(".reVerifyCode");
		var number = 60;
		var countdown = function(){
			if (number == 0) {
				$button.attr("disabled",false);
				$button.html("发送验证码");
	            number = 60;
	            return;
	        } else {
	        	$button.attr("disabled",true);
	        	$button.html(number + "秒 重新发送");
	        	number--;
	        }
			setTimeout(countdown,1000);
		}
		setTimeout(countdown,1000);
	}
	//发送短信验证码
	$(".reVerifyCode").on("click", function(){
		var $mobile = $("input[name=mobile]");
		var data = {};
		data.loginname = $.trim($("input[name=number]").val());
		data.password1 = $.trim($("input[name=newpassword]").val());
		data.password2 = $.trim($("input[name=newpassword1]").val());
		data.mobile = $.trim($mobile.val());
		var reg1 =/^[a-zA-Z]\w{5,17}$/;
		if(data.loginname == '' || data.loginname ==null  || data.loginname == "undefined"){
			$("#form-ipt-error-cl-number").addClass("is-visible");
            $("#form-ipt-error-cl-number").prev().addClass("input-error");
			$("#form-ipt-error-cl-number").html("请输入账号");
			alert("请输入账号");
			return ;
		}else{
			$("#form-ipt-error-cl-number").removeClass("is-visible");
			$("#form-ipt-error-cl-number").prev().removeClass("input-error");
		}
		if(data.password1 == '' || data.password1 ==null  || data.password1 == "undefined"){
			$("#form-ipt-error-cl-password1").addClass("is-visible");
            $("#form-ipt-error-cl-password1").prev().addClass("input-error");
			$("#form-ipt-error-cl-password1").html("请输入以字母开头，长度在6-18之间的新密码");
			alert("请输入新密码");
			return ;
		}else{
			$("#form-ipt-error-cl-password1").removeClass("is-visible");
			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
		}
		if(!reg1.test(data.password1)){
			$("#form-ipt-error-cl-password1").addClass("is-visible");
            $("#form-ipt-error-cl-password1").prev().addClass("input-error");
			$("#form-ipt-error-cl-password1").html("请输入有效的密码");
			
			alert('请输入有效的密码');
			return ;
		}else{
			$("#form-ipt-error-cl-password1").removeClass("is-visible");
			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
		}
		if(data.password2 == ''||data.password2 ==null  || data.password2 == "undefined"){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("确认密码不能为空");
			alert('请输入确认密码');
			return;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(data.password1 != data.password2){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("两次输入的密码不相同");
			alert('两次输入的密码不相同');
			return;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(data.mobile == '' || data.mobile ==null  || data.mobile == "undefined"){
			$("#form-ipt-error-cl-mobile").addClass("is-visible");
            $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
			$("#form-ipt-error-cl-mobile").html("请输入手机号码");
			alert('请输入手机号码');
			return;
		}else{
			$("#form-ipt-error-cl-mobile").removeClass("is-visible");
			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
		}
		var reg = /^1\d{10}$/;
		if(!reg.test(data.mobile)){
			$("#form-ipt-error-cl-mobile").addClass("is-visible");
            $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
			$("#form-ipt-error-cl-mobile").html("请输入合法的手机号码");
			alert('请输入合法的手机号码');
			return ;
		}else{
			$("#form-ipt-error-cl-mobile").removeClass("is-visible");
			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
		}
		
		$.ajax({
	        url: getBasePath()+"/sendSms",
	        async : false,
	        type: "get",
	        dataType: "text",
	        data: data,
	        success: function (data) {
	        	if(data == 'success'){
	        		alert("发送成功");
	        		countdownHandler();
	        		return ;
	        	}
	        	
	        }
    	});
	})
	$(".login").on("click", function(){
		window.location.href="http://120.26.187.198:8080/Library/login.jsp";
	});
	//提交
	$(".sub-btnre").on("click", function(){
		var $mobile = $("input[name=mobile]");
		var data = {};
		data.verifyCode = $.trim($("input[name=verifyCode]").val());
		data.loginname = $.trim($("input[name=number]").val());
		data.password1 = $.trim($("input[name=newpassword]").val());
		data.password2 = $.trim($("input[name=newpassword1]").val());
		data.mobile = $.trim($mobile.val());
		if(data.loginname == '' || data.loginname ==null  || data.loginname == "undefined"){
			$("#form-ipt-error-cl-number").addClass("is-visible");
            $("#form-ipt-error-cl-number").prev().addClass("input-error");
			$("#form-ipt-error-cl-number").html("请输入账号");
			alert("请输入账号");
			return ;
		}else{
			$("#form-ipt-error-cl-number").removeClass("is-visible");
			$("#form-ipt-error-cl-number").prev().removeClass("input-error");
		}
		var reg1 =/^[a-zA-Z]\w{5,17}$/;
		if(data.password1 == '' || data.password1 ==null  || data.password1 == "undefined"){
			$("#form-ipt-error-cl-password1").addClass("is-visible");
            $("#form-ipt-error-cl-password1").prev().addClass("input-error");
			$("#form-ipt-error-cl-password1").html("请输入以字母开头，长度在6-18之间的新密码");
			alert("请输入新密码");
			return ;
		}else{
			$("#form-ipt-error-cl-password1").removeClass("is-visible");
			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
		}
		if(!reg1.test(data.password1)){
			$("#form-ipt-error-cl-password1").addClass("is-visible");
            $("#form-ipt-error-cl-password1").prev().addClass("input-error");
			$("#form-ipt-error-cl-password1").html("请输入有效的密码");
			alert('请输入有效的密码');
			return ;
		}else{
			$("#form-ipt-error-cl-password1").removeClass("is-visible");
			$("#form-ipt-error-cl-password1").prev().removeClass("input-error");
		}
		if(data.password2 == ''||data.password2 ==null  || data.password2 == "undefined"){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("确认密码不能为空");
			alert('请输入确认密码');
			return;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(data.password1 != data.password2){
			$("#form-ipt-error-cl-password2").addClass("is-visible");
            $("#form-ipt-error-cl-password2").prev().addClass("input-error");
			$("#form-ipt-error-cl-password2").html("两次输入的密码不相同");
			alert('两次输入的密码不相同');
			return;
		}else{
			$("#form-ipt-error-cl-password2").removeClass("is-visible");
			$("#form-ipt-error-cl-password2").prev().removeClass("input-error");
		}
		if(data.mobile == '' || data.mobile ==null  || data.mobile == "undefined"){
			$("#form-ipt-error-cl-mobile").addClass("is-visible");
            $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
			$("#form-ipt-error-cl-mobile").html("请输入手机号码");
			alert('请输入手机号码');
			return;
		}else{
			$("#form-ipt-error-cl-mobile").removeClass("is-visible");
			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
		}
		var reg = /^1\d{10}$/;
		if(!reg.test(data.mobile)){
			$("#form-ipt-error-cl-mobile").addClass("is-visible");
            $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
			$("#form-ipt-error-cl-mobile").html("请输入合法的手机号码");
			alert('请输入合法的手机号码');
			return ;
		}else{
			$("#form-ipt-error-cl-mobile").removeClass("is-visible");
			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
		}
		data.repassword=1;
		$.ajax({
	        url: getBasePath()+"/chUserPassword",
	        async : false,
	        type: "post",
	        dataType: "text",
	        data: data,
	        success: function (data) {
	        	if(data =='1'){
	        		alert("修改成功");
	        	window.location.href ="http://120.26.187.198:8080/Library/login.jsp";
	        		return ;
	        	}
	        	if(data =='-1'){
	        		$("#form-ipt-error-cl-verifyCode").addClass("is-visible");
	                $("#form-ipt-error-cl-verifyCode").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-verifyCode").html("请输入正确的验证码");
	        		alert("验证码错误");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-verifyCode").removeClass("is-visible");
	    			$("#form-ipt-error-cl-verifyCode").prev().removeClass("input-error");
	        	}
	        	if(data =='-2'){
	        		$("#form-ipt-error-cl-mobile").addClass("is-visible");
	                $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-mobile").html("跟原来手机号不相同");
	        		alert("手机号不同");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-mobile").removeClass("is-visible");
	    			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
	        	}
	        	if(data =='-3'){
	        		$("#form-ipt-error-cl-verifyCode").addClass("is-visible");
	                $("#form-ipt-error-cl-verifyCode").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-verifyCode").html("时间太长，请重新获取验证码");
	        		alert("时间太长，请重新获取验证码");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-verifyCode").removeClass("is-visible");
	    			$("#form-ipt-error-cl-verifyCode").prev().removeClass("input-error");
	        	}
	        	if(data =='-4'){
	        		$("#form-ipt-error-cl-verifyCode").addClass("is-visible");
	                $("#form-ipt-error-cl-verifyCode").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-verifyCode").html("未知错误");
	        		alert("未知错误");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-verifyCode").removeClass("is-visible");
	    			$("#form-ipt-error-cl-verifyCode").prev().removeClass("input-error");
	        	}
	        	if(data =='-6'){
	        		$("#form-ipt-error-cl-mobile").addClass("is-visible");
	                $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-mobile").html("不是注册时的手机号");
	        		alert("不是注册时的手机号");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-mobile").removeClass("is-visible");
	    			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
	        	}
	        	if(data =='-7'){
	        		$("#form-ipt-error-cl-number").addClass("is-visible");
	                $("#form-ipt-error-cl-number").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-number").html("该账号不存在");
	        		alert("该账号不存在");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-number").removeClass("is-visible");
	    			$("#form-ipt-error-cl-number").prev().removeClass("input-error");
	        	}
	        	if(data =='-8'){
	        		$("#form-ipt-error-cl-mobile").addClass("is-visible");
	                $("#form-ipt-error-cl-mobile").prev().addClass("input-error");
	    			$("#form-ipt-error-cl-mobile").html("账号没有绑定手机号，请去绑定");
	        		alert("账号没有绑定手机号，请去绑定");
	        		return ;
	        	}else{
	        		$("#form-ipt-error-cl-mobile").removeClass("is-visible");
	    			$("#form-ipt-error-cl-mobile").prev().removeClass("input-error");
	        	}
	        }
    	});
	})
});

</script>
</head>
<body>	
<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
      		<div class="container">
        		<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
		            	<span class="sr-only">Toggle navigation</span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
					</button>
	          		<a class="navbar-brand" href="userInterface.jsp">在线图书管理系统</a>
        		</div>
        		
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">			            
						<li><a href="http://120.26.187.198:8080/Library/login.jsp" ><i class="fa fa-user"></i> 登录</a></li>	
						<li><a href="http://120.26.187.198:8080/Library/user_jsp/registerUser.jsp" ><i class="fa fa-user"></i> 注册</a></li>
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
<div class="col-xs-11.5 main">
<h2 class="page-header">找回密码</h2>
 
<div class="row bg bg-success">
   <form>
    <div class="col-sm-1"></div>	
   <div class="col-sm-11">	
    <div class="row">
        <label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">账号:</label>
          	<div class="col-sm-5">
          <input  autocomplete="off"  name="number" placeholder="请输入账号" class="form-control">
            <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-number">账号不能为空</span>
          <label class="control-label"  style="display: none"></label>
           </div>
       </div>
     <div class="row">
     <label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">新密码:</label> 
          	<div class="col-sm-5">
          	<input type="password"  autocomplete="off"  name="newpassword" placeholder="请输入新密码" class="form-control">
            <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-password1">新密码不能为空</span>
              <label class="control-label"  style="display: none"></label>
           </div>
       </div>
       <div class="row">
       <label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">确认密码:</label>
          	<div class="col-sm-5">
          	<input type="password"  autocomplete="off"  name="newpassword1" placeholder="请输入确认密码" class="form-control">
           <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-password2">确认密码不能为空</span>
              <label class="control-label"  style="display: none"></label>
           </div>
       </div>
       <div class="row">
       <label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">手机号:</label>
           	<div class="col-sm-5">
           	<input name="mobile"  autocomplete="off"  placeholder="请输入手机号码" class="form-control">
           <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-mobile">手机号不能为空</span>
              <label class="control-label"  style="display: none"></label>
           </div>
             	<div class="col-sm-3">
                <button type="button" class="reVerifyCode">获取验证码</button>
                   </div>
       </div>
       <div class="row">
       <label for="firstname" class="col-sm-3 control-label" style="padding-top: 10px;">验证码:</label>
        	<div class="col-sm-5">
        	<input name="verifyCode"  autocomplete="off"  placeholder="请输入验证码" class="form-control"> 
            <span class="form-ipt-error errorico-em" id="form-ipt-error-cl-verifyCode">验证码不能为空</span>
              <label class="control-label"  style="display: none"></label>
           </div>
       </div>
       <div class="row">
       <button type="button" class="sub-btnre btn btn-primary" style="width: 150px;margin-left: 15%">确定</button>
       <button type="button" class="login btn btn-primary" style="width: 150px;margin-left: 10%">登录</button>   
       </div>
    </div>
   </form>
   </div>
   <div class="col-xs-4 bg-secondary text-white"></div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
		
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
	
</body>
</html>