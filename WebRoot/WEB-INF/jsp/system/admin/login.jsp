<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
<style>
body{ margin:0;}
*{ color:#ffffff; font-family:"微软雅黑"; font-size:16px;}
a{ text-decoration:none;}
img{ display:block;/*为了解决图片下面空隙*/ border:none;/*解决IE兼容问题*/}
input{ border:none; padding:0; margin:0; outline:none; background:none;}
h1,h2{ font-weight:normal; margin:0;}
p{ margin:0;}
dl,dd{ margin:0;}
ul,li{ margin:0; padding:0; list-style:none;}
.clearfix{ clear:both;}

.font-weight{ font-weight:bold;}
.bg_img{ background-image:url(static/login/images/logingb.png); position:relative;}
.center_box{ width:480px; height:600px; position:fixed; top:40%; left:50%; margin-top:-300px; margin-left:-209px;}
.logo_box{ width:418px; margin-left:140px;}
.bg_img .name_box{width:480px;font-size:30px; margin-top:16px; padding-bottom:20px;}
.denglu_box{ line-height:32px; margin-left:auto; margin-right:auto; padding-top:40px; clear:both;}
.denglu_box li{ float:left;line-height:32px;}
.denglu_box input{ height:26px; width:346px; padding-left:8px; color:#999999; border-radius:3px;background-color:#ffffff;}
.center_box2{ width:418px; margin-left:31px;}
.jizhumima{ font-size:14px; line-height:14px; float:right; margin-top:10px;}
.jizhumima input{ margin-left:4px; cursor:pointer;}
.yanzhengma{ margin-top:40px; line-height:32px;}
.yanzhengma li{ float:left;}
.yanzhengma input{ width:140px; height:32px; padding-left:8px; color:#999999; background-color:#ffffff;}
.yanzhengma_tu{ width:70px; height:28px; margin-left:20px; cursor:pointer;}
.denglu a{ float:right; background-color:#177ee5;}

</style>
</head>
<body class="bg_img">
	<div class="center_box">
		
    	<dl>
        	<dd class="logo_box">
            	<img src="static/login/images/logo.png">
            </dd>
            <dd class="name_box">
				小鹿母婴医疗健康综合服务管理平台
            </dd>
            <div class="center_box2">
            <form action="" method="post" name="loginForm"
				id="loginForm">
                <dd class="denglu_box">
                    <ul>
                        <li class="font-weight">用户名：</li>
                        <li><input type="text" name="loginname" id="loginname" value="" style="width:330px" placeholder="请输入用户名"></li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="denglu_box">
                    <ul>
                        <li class="font-weight">密　码：</li>
                        <li><input type="password" name="password" id="password" placeholder="请输入密码" value="" style="width:330px"></li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="jizhumima">
                	<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" />
					</div>
              	      <!-- 记住密码<input type="checkbox"> -->
                </dd>
                <dd class="yanzhengma">
                    <ul>
                        <li class="font-weight">验证码：</li>
                        <li><input type="text" name="code" id="code" class="login_code"
								style="height:20px; padding-top:0px;" /> </li>
                        <li><div class="yanzhengma_tu"><img style="height:24px;" title="点击更换" id="codeImg" alt="点击更换" src=""></div> </li>
                       
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="denglu">
                	<a onclick="severCheck();" class="flip-link btn btn-info"
							 id="to-recover">登录</a>
                    
                </dd>
            </form>
            </div>
            <div class="clearfix"></div>
        </dl>
    </div>
	

	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script> 
</body>

</html>