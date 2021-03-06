﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	
	<title>${pd.SYSNAME}</title>
	<meta name="description" content="overview & stats" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.5, user-scalable=yes" />
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<title></title>

		<!-- sdk -->
		<script type="text/javascript" src="http://app.cloopen.com/im50/ytx-web-im-min-new.js"></script>

		<!-- demo业务、表情包、录音 -->
		<script type="text/javascript" src="plugins/ytx/js/justdo.js"></script>
		<!-- <script type="text/javascript" src="plugins/ytx/js/HZRecorder.js"></script> -->
		<script type="text/javascript" src="plugins/ytx/js/emoji.js"></script>
		<link href="plugins/ytx/css/emoji.css" rel="stylesheet">

		<!-- boostrap文件、日期插件 -->
		<script type="text/javascript" src="plugins/ytx/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="plugins/ytx/assets/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="plugins/ytx/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>

		<!-- 地图 -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="http://api.map.baidu.com/api?v=2.0&ak=bG4GYISkIpM2j8CgjeUaRwzQ" type="text/javascript"></script>

		<link href="plugins/ytx/assets/css/bootstrap.css" rel="stylesheet">
		<link href="plugins/ytx/assets/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="plugins/ytx/assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
		<link href="plugins/ytx/assets/css/docs.css" rel="stylesheet">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="plugins/ytx/assets/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="plugins/ytx/assets/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="plugins/ytx/assets/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="plugins/ytx/assets/ico/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="plugins/ytx/assets/ico/favicon.png">
		<style type="text/css">
			@media (max-width: 767px) {
				body {
					padding-right: 0px;
					padding-left: 0px;
				}
				.navbar-fixed-top,
				.navbar-fixed-bottom,
				.navbar-static-top {
					margin-right: 0px;
					margin-left: 0px;
				}
			}
			
			.navbar .brand {
				float: left;
				color: #eeeeee;
				margin-left: 0px;
			}
			
			.navbar-inverse .brand {
				color: #eeeeee;
			}
			
			.nav-list > .active > a,
			.nav-list > .active > a:hover,
			.nav-list > .active > a:focus {
				background-color: #0044cc;
			}
			
			.nav > li > a {
				color: #000000;
			}
			
			.navbar-inverse .navbar-inner {
				border-color: #0044cc;
				background-image: linear-gradient(to bottom, #0044cc, #0044cc);
				background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0044cc), to(#0044cc));
				background-image: -webkit-linear-gradient(top, #0044cc, #0044cc);
				filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#ff0044cc', endColorstr='#ff0044cc', GradientType=0);
				BACKGROUND-COLOR: #0044cc;
			}
			
			.nav-pills > .active > a,
			.nav-pills > .active > a:hover,
			.nav-pills > .active > a:focus {
				background-color: #0044cc;
			}
			
			.hero-unit {
				background-color: #d9edf7;
				padding-top: 60px;
				padding-bottom: 30px;
				padding-left: 60px;
				padding-right: 60px;
				margin-bottom: 0px;
				margin-top: 20px;
			}
			
			.scrollspy-contact-example {
				height: 330px;
				overflow: auto;
				position: relative;
				margin-bottom: 10px;
			}
			
			.scrollspy-content-example {
				height: 360px;
				overflow: auto;
				position: relative;
				margin-top: 12px;
				margin-bottom: 10px;
			}
			
			.alert {
				word-break: break-all;
				width: 60%;
				margin-top: 6px;
				margin-bottom: 6px;
			}
			
			.alert-right {
				float: right;
				margin-right: 12px;
				padding: 8px 14px 8px 14px;
			}
			
			.alert-left {
				float: left;
				margin-left: 12px;
				padding: 8px 14px 8px 14px;
			}
			
			div code {
				font-size: 18px;
			}
			code{
				 white-space: normal;
			}
			.modal-body div {
				height: 30px;
				padding-bottom: 6px;
			}
			
			#pop .table-striped {
				margin-bottom: 0px;
			}
			
			#pop .table-striped td {
				border-left: 0px solid #dddddd;
			}
			
			#pop .label {
				margin-left: 10px;
				cursor: pointer;
				line-height: 18px;
			}
			#pop .label:last-child{
				margin-left: 0px;
			}
			.emoji-img {
				width: 18px;
				height: 18px;
			}
			
			#im_send_content_copy {
				display: none;
			}
			
			#im_send_content {
				background-color: white;
				height: 55px;
				max-width: 750px;
				font-size: 18px;
				font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
				margin: 0 0 0 0;
				overflow-y: auto;
				overflow-x: hidden;
			}
			
			#im_content_list pre {
				font-size: 18px;
				font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
				border: none;
				background: none;
				margin: 0 0 0 0;
				clear: both;
			}
			
			span[contact_style_type="name"] {
				display: inline-block;
				width: 72%;
				word-wrap: break-word;
			}
			
			.modal-header h3 {
				word-break: break-all;
			}
	
		</style>

	</head> 					
	<body id="im_body1" style="overflow-x: hidden; overflow-y: auto; height: 500px;" onkeydown="IM.EV_keyCode(event)">
		<div id="im_body" style="overflow: hidden;">
			<!--<body>-->
			<div id="navbar" class="navbar navbar-inverse navbar-fixed-top" style="z-index: 999999">
				<div class="navbar-inner">
					<div class="container">
						<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
						<span><audio id="im_ring" src="plugins/ytx/js/ring.mp3"></audio></span>
						<span style="float: left;display: block;font-size: 20px;font-weight: 200;
                    padding-top: 10px;padding-right: 20px;padding-bottom: 10px;padding-left: 20px;text-shadow: 0px 0px 0px;color:#eee">云通讯 IM</span>
						<div id="navbar_login" class="nav-collapse in collapse" style="height: auto;" align="right">
							<input class="btn" type="button" onclick="IM.Check_login()" style="margin-right: 5px" value="切换" />

							<div name="loginType" class="navbar-form pull-right" style="display: none;" id="3">
								<input id='voip_account' style="width:160px;margin-right: 5px;" type="text" placeholder="VOIP 账号">
								<input id='voip_pwd' style="width:160px;margin-right: 5px" type="text" placeholder="VOIP 密码">
								<input class="btn" type="button" onclick="IM.DO_login()" value="登录" />
							</div>

							<div name="loginType" class="navbar-form pull-right" id="1">
								<input id='navbar_user_account' style="width:160px;margin-right: 5px;" type="text" placeholder="Your Phone Number">
								<input class="btn" type="button" onclick="IM.DO_login()" value="登录" />
							</div>
						</div>
						<div id="navbar_login_show" class="nav-collapse in collapse" style="display:none; height: auto; float: right;">
							<span style="float: left;display: block;font-size: 20px;font-weight: 200;padding-top: 10px;padding-bottom: 10px;
					 text-shadow: 0px 0px 0px;color:#eee">您好:</span>
							<a onclick="IM.DO_userMenu()" style="text-decoration: none;cursor:pointer;float: left;font-size: 20px;font-weight: 200;max-width:130px;
                     padding-top: 10px;padding-right: 20px;padding-bottom: 10px;padding-left: 20px;text-shadow: 0px 0px 0px;
                     color:#eee;word-break:keep-all;text-overflow:ellipsis;overflow: hidden;"></a>
							<span onclick="IM.EV_logout()" style="cursor:pointer;float: right;font-size: 20px;font-weight: 200;
                                padding-top: 10px;padding-bottom: 10px;text-shadow: 0px 0px 0px;color:#eeeeee">退出</span>
						</div>
					</div>
				</div>
			</div>

			<div id="hero-unit" class="hero-unit">
				<div class="container">
					<div class="row">
						<div class="span12">
							<div style="z-index: 778888; position: relative; left: 0px; top: 0px; display: none;">
								<div id="alert-error" class="alert alert-error text-center" style="display: none;">
									<button type="button" class="close" data-dismiss="alert" onclick="IM.HTML_closeAlert('alert-error')">×</button>
									<strong id="alert-error_content">Oh snap!...</strong>
								</div>
								<div id="alert-info" class="alert alert-info text-center" style="display: none;">
									<button type="button" class="close" data-dismiss="alert" onclick="IM.HTML_closeAlert('alert-info')">×</button>
									<strong id="alert-info_content">Oh snap!...</strong>
								</div>
								<div id="alert-warning" class="alert alert-warning text-center" style="display: none;">
									<button type="button" class="close" data-dismiss="alert" onclick="IM.HTML_closeAlert('alert-warning')">×</button>
									<strong id="alert-warning_content">Oh snap!...</strong>
								</div>
								<div id="alert-success" class="alert alert-success text-center" style="display: none;">
									<button type="button" class="close" data-dismiss="alert" onclick="IM.HTML_closeAlert('alert-success')">×</button>
									<strong id="alert-success_content">Oh snap!...</strong>
								</div>
							</div>

							<div class="row">
								<div class="span4">
									<div>
										<ul id="im_contact_type" class="nav nav-pills">
											<li contact_type="C" onclick="IM.DO_choose_contact_type('C')" class="active"><a href="#">沟通</a></li>
											<li contact_type="G" onclick="IM.DO_choose_contact_type('G')"><a href="#">群组</a></li>
											<li contact_type="M" onclick="IM.DO_choose_contact_type('M')" style="display:none"><a href="#">客服</a></li>
										</ul>
									</div>
									<div id="im_add" class="input-prepend">
										<span class="add-on"><i class="icon-user"></i></span>
										<input class="span3" imtype="im_add_contact" type="text" placeholder="填写对方帐号，点击添加!">
										<input class="span3" imtype="im_add_group" type="text" placeholder="填写群组名称，创建群组!" style="display:none;">
										<input class="span3" imtype="im_add_mcm" type="text" placeholder="选择客服号咨询!" style="display:none;" disabled>
										<button class="btn" imtype="im_add_btn_contact" type="button" onclick="IM.DO_addContactToList()">Add</button>
										<div class="btn-group" imtype="im_add_btn_group" style="display: none;">
											<button class="btn dropdown-toggle" data-toggle="dropdown">Add<span class="caret"></span></button>
											<ul class="dropdown-menu">
												<li><a href="#" onclick="IM.DO_addGroupToList(1,2)">默认可直接加入</a></li>
												<li><a href="#" onclick="IM.DO_addGroupToList(2,2)">需要身份验证</a></li>
												<li><a href="#" onclick="IM.DO_addGroupToList(3,2)">私有群组,仅能管理员邀请</a></li>
												<li><a href="#" onclick="IM.DO_addGroupToList(1,1)">创建讨论组</a></li>
											</ul>
										</div>
									</div>
									<div id="im_contact" data-spy="scroll" data-target="#navbarExample" data-offset="0" class="scrollspy-contact-example" style="background-color: white">
										<ul id="im_contact_list" class="nav nav-list"> </ul>
									</div>
								</div>
								<div class="span8">
									<div class="row">
										<div class="span8">
											<div style="color: #0044cc;" id="notice"></div>
											<div id="im_content_list" data-spy="scroll" data-target="#navbarExample" data-offset="0" class="scrollspy-content-example" style="background-color: white">
												<div id="getHistoryMsgDiv" style="width: 100%;height:20px;text-align: center;z-index: 1;position: relative;top:25px;display:none;"></div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="span8">
											<div class="input-append span8" style="position: relative; margin:0 0 2px 0;">
												<div class="row">
													<div class="span4">
														<div id="emoji_div" class="span8 popover top" style="display:none; top: -140px; max-width: 750px; margin-left: 5px;">
															<div class="arrow"></div>
															<div class="popover-content" style="max-height: 120px; font-size:18px; overflow-y: auto">
															</div>
														</div>
														<div id="groupMemList_div" class="span8 popover top" style="display:none; top: 20px; max-width: 35%; margin-left: 0px;">
															<div class="popover-content" style="max-height: 120px; font-size:18px; overflow-y: auto">
															</div>
														</div>
														<span title="表情" class="add-on" onclick="IM.HTML_showOrHideEmojiDiv()"><label><i class="icon-heart"></i></label></span>
														<span title="拍照" class="add-on" id="camera_button" onclick="IM.DO_takePicture()" style="cursor:pointer;"><i class="icon-camera"></i></span>
														<span title="附件" class="add-on" id="file_button" onclick="IM.DO_im_attachment_file()" style="cursor:pointer;"><i class="icon-folder-open" ></i></span>
														<span title="视频" class="add-on" id="voipInvite" onclick="IM.DO_inviteCall(1)" style="cursor:pointer;"><i class="icon-facetime-video"></i></span>
														<span title="音频" class="add-on" id="voiceInvite" onclick="IM.DO_inviteCall(0)" style="cursor:pointer;"><i class="icon-volume-up"></i></span>
														<span title="落地电话" class="add-on" class="add-on" id="luodi" onclick="IM.DO_inviteCall(2)" style="cursor:pointer;"><img src="plugins/ytx/assets/img/luodi.png" style="width:15px" /></span>
														<!-- <span title="录音" class="add-on" id="startRecorder" onclick="IM.DO_startRecorder()" style="cursor:pointer;"><img style="width:15px;height:13px;padding-bottom: 3px;" src="plugins/ytx/assets/plugins/ytx/plugins/ytx/img/1801322612444452.png" /></span>-->
														<span class="add-on" id="fireMessage" onclick="IM.DO_fireMsg(this)" style="cursor:pointer;">阅后即焚</span>

													</div>
													<div id="sendMenu" class="input-append span4" style="position: relative;">
														<div class="span4 pull-right">
															<span style="float:right;"><button class="btn" type="button" onclick="IM.DO_sendMsg()">Send</button></span>
															<span class="add-on" style="float:right">Ctrl+Enter 发送</span>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>

									<div id="contentEditDiv" class="row" style="position:relative;top:-10px">
										<div class="span8">
											<pre id="im_send_content" contenteditable="true" onfocus="IM.Do_notice(1,'t')" onblur="IM.Do_notice(0,'f')"></pre>
											<pre id="im_send_content_copy"></pre>
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div id="lvjing" style="display: block; z-index: 668888; position: absolute; margin-left: 0px; padding-left: 0px; left: 0px; top: 0px; height: 0px; width: 0px;">
				<canvas id="lvjing_canvas" style="border:1px solid #aaa; display: block;"></canvas>
				<img style="display: block;position: absolute; top:0px; left:0px;" src="plugins/ytx/assets/img/logo-blue.png" />
			</div>
			<div id="pop" oncontextmenu="IM.preventDefault(event)" style="display:none; z-index: 888887; width: 100%; position: absolute; top: 0px;left: 0px; margin: 0px 0 20px 0;">
				<div class="container">
					<div class="row" style="margin: 50px 30px 20px 30px;">
					</div>
				</div>
			</div>

			<div id="pop_photo" style="display:none; z-index: 888888; width: 100%; height:auto; position: absolute; top: 0px;left: 0px; margin: 5px 0 5px 0;">
				<div class="carousel slide" imtype="pop_photo_top" style="position: relative; top: auto; left: auto; right: auto; margin: 0 auto 0px; z-index: 1; max-width: 100%;">
					<div class="carousel-inner">
						<div class="carousel slide" id="carousels" style="text-align: center;">
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel" data-slide="prev" onclick="IM.DO_pop_photo_up()">‹</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next" onclick="IM.DO_pop_photo_down()">›</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next" style="top:5%; height:auto;" onclick="IM.HTML_pop_photo_hide()">×</a>
				</div>
			</div>
			<div id="pop_takePicture" style="display:none; z-index: 888889; width: 100%; height:auto; position: absolute; top: 0px;left: 0px; margin: 5px 0 5px 0;">
				<div class="carousel slide" imtype="pop_takePicture_top" style="position: relative; top: auto; left: auto; right: auto; margin: 0 auto 0px; z-index: 1; max-width: 100%;">
					<div id="takePhoto" class="modal" style="position: relative; top: auto; left: auto; right: auto; margin: 0 auto 0px; z-index: 1; max-width: 100%;text-align:center;border:0px;background:#333">
						<video autoplay id="video" width="100%" height='100%' style="position:relative;left:0px;background-color:gray;"></video>
						<div style="position:relative;left:auto;right:auto;padding-top:3px;background:#333">
							<a onclick="IM._cancelTakePic();" style="position:relative;right:10%;text-decoration: none;color:white;cursor:pointer">取消</a>
							<img class="img-circle" src="plugins/ytx/assets/img/white.png" id="snap" style="cursor:pointer" onclick="IM._snapshot()" />
						</div>
					</div>
				</div>
			</div>
			<div id="pop_videoView" style="display: none; width: 100%; position: absolute; top: 0px;left: 0px; margin: 5px 0 5px 0;">
				<canvas id="videoViewCanvas" style="width:100%;z-index: 50;position: absolute;top:0px;left:0px;"></canvas>
				<div id="videoView" style="width:50%;position: absolute; top: 40px; z-index: 100; text-align:center;display:none;background:gray">
					<video autoplay="autoplay" id="receivedVideo" width="100%" style="z-index:200;"></video>
					<video autoplay="autoplay" id="localVideo" width="25%" style="position:absolute;top:0px;right:-1px; z-index:300;"></video>

				</div>
				<div id="voiceCallDiv_audio" style="width:50%;position: absolute; top: 40px; z-index: 100; text-align:center;display:none;background:gray;padding-top:20px;padding-bottom:10px">
					<audio id="voiceCallAudio" autoplay="autoplay" controls="controls"></audio>
				</div>

				<audio id="voipCallRing" src="plugins/ytx/js/ringback.wav" style="display:none" loop="loop"></audio>
			</div>
			<div id="pop_recorder" style="display: none; width: 100%; position: absolute; top: 0px;left: 0px; margin: 5px 0 5px 0;">
				<canvas id="recorderCanvas" style="width:100%;position: absolute;top:0px;left:0px;"></canvas>
				<div style="position:absolute;top:200px;left:200px;z-index:100;width:430px">
					<div style="position:relative;top:40px;z-index:200;height: 30px;width: 200px;"></div>
					<audio id="recorderAudio" controls="controls" autoplay="autoplay" style="float: left;margin-right: 5px;height:37px;"></audio>
					<button class="btn btn-primary" onclick="IM.DO_endRecorder()" style="margin-top: 7px;">完成</button>
					<button class="btn btn-primary" onclick="IM.EV_cancel()" style="margin-top: 7px;">取消</button>
				</div>
			</div>
			<audio style="display:none;" id="audio" controls="controls" autoplay="autoplay" loop="loop"></audio>
			<!-- <canvas style="display:none;" id="canvas" width="270px" height="200px"></canvas> -->
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				IM.init();
				IM.xl_DO_login('${pd.userId}');
			});
		</script>

	    
	    
			
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		
		<!-- 引入 -->
		
		
		<script type="text/javascript">
		
		$(top.hangge());
		
		
		
		</script>
		
	</body>
</html>

