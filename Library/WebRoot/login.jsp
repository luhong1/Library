<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
		<meta name="Author" content="Dreamer-1.">
		
		<!-- 引入各种CSS样式表 -->
        <link rel="icon" href="https://v3.bootcss.com/favicon.ico">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/login.css" rel="stylesheet" type="text/css">
        <link href="./css/wall.css" rel="stylesheet" type="text/css"/>
        <link href="./css/base.css" rel="stylesheet" type="text/css"/>
        <link href="./css/forget_phone.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="./css/bootstrap.css">
		<link rel="stylesheet" href="./css/font-awesome.css">
		<link href="./css/register.css" rel="stylesheet" >
		<link rel="stylesheet" href="./css/index.css">	<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
		<link rel="stylesheet" href="./css/font-change.css">	<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->		
		<script type="text/javascript" src="./js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="./js/bootstrap.min.js"></script>
		<script src="./js/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="./js/register.js" type="text/javascript"></script>
        <script src="http://code.changer.hk/jquery/plugins/jquery.cookie.js"></script>
<title>登录</title>
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
						<li><a href="login.jsp" ><i class="fa fa-user"></i> 登录</a></li>	
						<li><a href="./user_jsp/registerUser.jsp" ><i class="fa fa-user"></i> 注册</a></li>
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
							<li><a href="./user_jsp/borrow.jsp"><i class="fa fa-users"></i> 借书</a></li>
                            <li><a href="./user_jsp/return.jsp" ><i class="fa fa-users"></i> 还书</a></li>						
 						   <li><a href="./user_jsp/chat.jsp" ><i class="fa fa-users"></i> 社交</a></li>	
 						</ul>	 
						<li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp; 个人信息 <span class="sr-only">(current)</span></a>
						</li> 
						<ul id="productMeun" class="nav nav-list collapse menu-second">
							<li><a href="./user_jsp/User.jsp" ><i class="fa fa-list-alt"></i> 基本信息</a></li>
						</ul>		
					</ul>
				</div>
			</div>
		</div>

<!-- 右侧内容展示==================================================   -->   		
 				<div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-2 main bg bg-success">
					
						
						<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
          				<div id="content" class="bg bg-success">
<div class="bg bg-success">
<div class="col-xs-0.5"></div>
<div class="col-xs-11.5 main">
<h2 class="page-header">登录</h2>
<div class="col-xs-1"></div>
  <div class="col-xs-5">
<div class="wall-warp">
<%	request.getSession().removeAttribute("aId"); %>
		<div class="wall-main" style="position: relative; height: 100%;">
			<div class="switch-nav-wrap">
				<div class="switch-nav new-switch-wall  active">
					<a href="#signin" id="qSignin" class="cur">手机号</a>
					<a href="#studentID" id="qStudentID" class="">学号</a>
				</div>
			</div>
			<!--登录-->
			<div class="switch-wrap switch-wrap-signin active">
			<form action="login" method="Get" id="f_sign_up">
			
			    <!--手机号-->
				<ul class="phoneMumber-list wall-form-ipt-list active">
					<li>
						<input type="hidden" name="execution" value="e1s1">
						<input type="hidden" name="_eventId" value="submit">
						<i></i>
						<input type="text" placeholder="请输入手机号"  autocomplete="off"  value=""  id="lUsername">
						<button type="button" class="sendVerify">获取验证码</button>
						<span class="form-ipt-error errorico-em" id="form-ipt-error-l-username">请输入手机号</span>
						<em class="Partitionline-em"></em>
					<li class="clearPassword-ico">
						<input type="text" placeholder="请输入验证码"  autocomplete="off"  value="" name="verifyCode1"  id="verifyCode1">
						<label class="form-ipt-error errorico-em" id="form-ipt-error-l-verifyCode">请输入验证码</label>
						<i class="pasword-icon"></i>
						<em class="Partitionline-em"></em>
				</ul>	
				<!--学号-->
				<ul class="studentID-list wall-form-ipt-list">
				<li>
						<input type="text" placeholder="手机号或大学学号" autocomplete="off" value="" maxlength="40" name="clCode" id="clCode">
						<label class="form-ipt-error errorico-em" id="form-ipt-error-cl-code">账号不能为空</label>
						<i class="number-icon"></i>
                        <em class="Partitionline-em"></em>
				
					<li class="clearPassword-ico">
						<input type="password" placeholder="密码" autocomplete="off" value="" name="clPassword" maxlength="40"  id="clPassword">
						<label class="form-ipt-error errorico-em" id="form-ipt-error-cl-password">密码不能为空</label>
						<i class="pasword-icon"></i>
                        <em class="Partitionline-em"></em>
                </ul>
              	<div class="signin-misc-wrap clearfix">
					<a class="forget-btn fr" href="http://120.26.187.198:8080/Library/user_jsp/rePassword.jsp">忘记密码</a>
				</div>
						<button type="button" class="login1 wall-sub-btn">登&nbsp;&nbsp;录</button>
			
				<!--学号-->
			</form>
				</div>	
			</div>
			  <div class="col-xs-4 bg-secondary text-white"></div>
		</div>
</div>
</div>
</div>
</div>
</div>
<script>
$(function() {
	//手机号/学号切换效果
	var uhref=null;
	$(".switch-nav a").on("click",function(){
		$("#bottomDiv").show();
        $("#bottomTchDiv").hide();
		if(!$(this).hasClass("cur")){
			var index = $(this).index();
			$(this).siblings("a").removeClass("cur");
			$(this).addClass("cur");
			if($(this).index() == 1){
				$(".cur-border-bottom").addClass("cur-index-1");
			}else{
				$(".cur-border-bottom").removeClass("cur-index-1");
			}
			//$(".switch-wrap").removeClass("active");
			//$(".switch-wrap").eq(index).addClass("active");
			$(".wall-form-ipt-list").removeClass("active");
			$(".wall-form-ipt-list").eq(index).addClass("active");
		}
		if($("#qStudentID").hasClass("cur")){
		    $(".cur-border-bottom").css('margin-left',0)
//			$(".registerNum-btn").fadeOut();
			//tTimeout(userindex.selectAllSchoolByName(),200);
		}else{
            $(".cur-border-bottom").css('margin-left','15px')
//			$(".registerNum-btn").fadeIn();
		}
	});
$(".login1").on("click",function(){
	 uhref = window.location.href;
	if(uhref.indexOf("#studentID") > 0){
			//学号登录
			var data={};
		    data.loginName =$.trim($("#clCode").val());
			if(data.loginName == null || data.loginName == ""){
				$("#form-ipt-error-cl-code").addClass("is-visible");
	            $("#form-ipt-error-cl-code").prev().addClass("input-error");
				$("#form-ipt-error-cl-code").html("请输入账号");
			}else{
				$("#form-ipt-error-cl-code").removeClass("is-visible");
				$("#form-ipt-error-cl-code").prev().removeClass("input-error");
			}
			 data.password = $.trim($("#clPassword").val());
			if(data.password == null || data.password == ""){
				$("#form-ipt-error-cl-password").addClass("is-visible");
	            $("#form-ipt-error-cl-password").prev().addClass("input-error");
				$("#form-ipt-error-cl-password").html("请输入密码");
			}else{
				$("#form-ipt-error-cl-password").removeClass("is-visible");
				$("#form-ipt-error-cl-password").prev().removeClass("input-error");
			}
			$.ajax({  
		        url : getBasePath()+"/loginServlet",
		        async : false,
		        type : "get",   
		        dataType: "json",
		        data: data,
		        success : function(data) {        
		          var newdata = JSON.stringify(data);    //将json对象转换为字符串
		           data = eval("("+newdata+")");
		        	if(data == null || data == ""){
		        		//程序异常
		    			$("#form-ipt-error-cl-code").addClass("is-visible");
	                    $("#form-ipt-error-cl-code").prev().addClass("input-error");
		    			$("#form-ipt-error-cl-code").html("未知异常");
		    			return;
		        	}else{
						$("#form-ipt-error-cl-code").removeClass("is-visible");
						$("#form-ipt-error-cl-code").prev().removeClass("input-error");
					}
		        	if(data.statu =="1") {
		        		//$.cookie('data' , JSON.stringify(data));
		        		window.location.href= "http://120.26.187.198:8080/Library/user_jsp/userInterface.jsp";
		        		return;
		    		}
		        	if(data.statu =="2"){
		        		window.location.href= "http://120.26.187.198:8080/Library/admin_jsp/admin_book.jsp";
		        		return;
		        	}
		        	if(data.statu == '-1') {
		        		alert(data);
		    			//参数异常
		    			$("#form-ipt-error-cl-password").addClass("is-visible");
	                    $("#form-ipt-error-cl-password").prev().addClass("input-error");
		    			$("#form-ipt-error-cl-password").html("密码错误");
		    			return;
		    		}else{
						$("#form-ipt-error-cl-password").removeClass("is-visible");
						$("#form-ipt-error-cl-password").prev().removeClass("input-error");
					}
		        	if(data.statu == '-2'){
		    			alert(data);
		    			//程序异常
		    			$("#form-ipt-error-cl-code").addClass("is-visible");
	                    $("#form-ipt-error-cl-code").prev().addClass("input-error");
		    			$("#form-ipt-error-cl-code").html("学号错误");
		    			return;
		    		}else{
						$("#form-ipt-error-cl-code").removeClass("is-visible");
						$("#form-ipt-error-cl-code").prev().removeClass("input-error");
					}
		        	if(data.statu == '-3'){
		    			alert(data);
		    			//用户不存在
		    			$("#form-ipt-error-cl-code").addClass("is-visible");
	                    $("#form-ipt-error-cl-code").prev().addClass("input-error");
		    			$("#form-ipt-error-cl-code").html("用户不存在");
		    			return;
		    		}else{
						$("#form-ipt-error-cl-code").removeClass("is-visible");
						$("#form-ipt-error-cl-code").prev().removeClass("input-error");
					}
		        }
			})	
	}else{
		var data={};
		 data.mobile =$.trim($("#lUsername").val());
	     data.verifyCode=$.trim($("#verifyCode1").val());
		if(data.mobile == ''|| data.mobile ==null  || data.mobile == "undefined"){
			$("#form-ipt-error-l-username").addClass("is-visible");
			$("#form-ipt-error-l-username").html("请输入手机号码");
			alert('请输入手机号码');
			return;
		}else{
			$("#form-ipt-error-l-username").removeClass("is-visible");
			$("#form-ipt-error-l-username").prev().removeClass("input-error");
		}
		var reg = /^1\d{10}$/;
		if(!reg.test(data.mobile)){
			$("#form-ipt-error-l-username").addClass("is-visible");
			$("#form-ipt-error-l-username").html("请输入合法的手机号码");
			alert('请输入合法的手机号码');
			return ;
			}else{
				$("#form-ipt-error-l-username").removeClass("is-visible");
				$("#form-ipt-error-l-username").prev().removeClass("input-error");
			}
		$.ajax({
	        url: getBasePath()+"/loginServlet",
	        async : true,
	        type: "post",
	        dataType: "json",
	        data: data,
	        success: function(data) {
	        	 var newdata = JSON.stringify(data);    //将json对象转换为字符串
		           data = eval("("+newdata+")");
	        	if(data.statu =="1") {
	        		//$.cookie('data' , JSON.stringify(data));
	        		window.location.href= "http://120.26.187.198:8080/Library/user_jsp/userInterface.jsp";
	        		return;
	    		}
	        	if(data.statu =="2"){
	        		window.location.href= "http://120.26.187.198:8080/Library/admin_jsp/admin_book.jsp";
	        		return;
	        	}
	        	if(data.statu =='-3'){
	        		$("#form-ipt-error-l-username").addClass("is-visible");
	                $("#form-ipt-error-l-username").prev().addClass("input-error");
	    			$("#form-ipt-error-l-username").html("手机号不存在");
	        		alert("手机号不存在");
	        		return ;
	        	}else{
	    			$("#form-ipt-error-l-username").removeClass("is-visible");
	    			$("#form-ipt-error-l-username").prev().removeClass("input-error");
	    		}
	        	if(data.statu =='-6'){
	        		$("#form-ipt-error-l-verifyCode").addClass("is-visible");
	                $("#form-ipt-error-l-verifyCode").prev().addClass("input-error");
	    			$("#form-ipt-error-l-verifyCode").html("请输入正确的验证码");
	        		alert("验证码错误");
	        		return ;
	        	}else{
	    			$("#form-ipt-error-l-verifyCode").removeClass("is-visible");
	    			$("#form-ipt-error-l-verifyCode").prev().removeClass("input-error");
	    		}
	        	if(data.statu =='-5'){
	        		$("#form-ipt-error-l-username").addClass("is-visible");
	                $("#form-ipt-error-l-username").prev().addClass("input-error");
	    			$("#form-ipt-error-l-username").html("手机号不同");
	        		alert("手机号不同");
	        		return ;
	        	}else{
	    			$("#form-ipt-error-l-username").removeClass("is-visible");
	    			$("#form-ipt-error-l-username").prev().removeClass("input-error");
	    		}
	        	if(data.statu =='-4'){
	        		$("#form-ipt-error-l-username").addClass("is-visible");
	                $("#form-ipt-error-l-username").prev().addClass("input-error");
	    			$("#form-ipt-error-l-username").html("未知错误");
	        		alert("未知错误");
	        		return ;
	        	}else{
	    			$("#form-ipt-error-l-username").removeClass("is-visible");
	    			$("#form-ipt-error-l-username").prev().removeClass("input-error");
	    		}
	        	if(data.statu =='-7'){
	        		$("#form-ipt-error-l-verifyCode").addClass("is-visible");
	                $("#form-ipt-error-l-verifyCode").prev().addClass("input-error");
	    			$("#form-ipt-error-l-verifyCode").html("时间太长，请重新获取验证码");
	        		alert("时间太长，请重新获取验证码");
	        		return ;
	        	}else{
	    			$("#form-ipt-error-l-verifyCode").removeClass("is-visible");
	    			$("#form-ipt-error-l-verifyCode").prev().removeClass("input-error");
	    		}

	        }
		});
	}
	});
		//短信验证码倒计时
		var countdownHandler = function(){ 
			var $button = $(".sendVerify");
			var number = 60;
			var countdown = function(){
				if (number == 0) {
					$button.attr("disabled",false);
					$button.html("发送验证码");
		            number = 60;
		            return;
		        } else {
		        	$button.attr("disabled",true);
		        	$button.html(number + "秒");
		        	number--;
		        }
				setTimeout(countdown,1000);
			}
			setTimeout(countdown,1000);
		}
		//发送短信验证码
		$(".sendVerify").on("click", function(){
			var data={};
			 data.mobile =$.trim($("#lUsername").val());
		
			if(data.mobile == ''|| data.mobile ==null  || data.mobile == "undefined"){
				$("#form-ipt-error-l-username").addClass("is-visible");
				$("#form-ipt-error-l-username").html("请输入手机号码");
				alert('请输入手机号码');
				return;
			}
			var reg = /^1\d{10}$/;
			if(!reg.test(data.mobile)){
				$("#form-ipt-error-l-username").addClass("is-visible");
				$("#form-ipt-error-l-username").html("请输入合法的手机号码");
				alert('请输入合法的手机号码');
				return ;
				}
			var uhref = window.location.href;
			$.ajax({
		        url: getBasePath()+"/sendSms",
		        async : true,
		        type: "get",
		        dataType: "text",
		        data: data,
		        success: function (data) {
		        	if(data == 'success'){
		        		$("#form-ipt-error-l-username").removeClass("is-visible");
		        		alert("成功");
		        		countdownHandler();
		        		return ;
		        	}
		        	if(data == 'fail'){
		        		$("#form-ipt-error-l-username").removeClass("is-visible");
		        		alert("出错");
		        		countdownHandler();
		        		return ;
		        	}
		        }
	    	});
		});
		
		//发送短信验证码
		
			
	
});

</script>
<script type="text/javascript">
function getBasePath(){
    return '<%=basePath%>';
}
</script>
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