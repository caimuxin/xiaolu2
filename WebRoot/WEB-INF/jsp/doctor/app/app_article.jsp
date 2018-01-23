<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html><html lang="en">
	<head>
		<base href="<%=basePath%>">
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/admin/top.jsp"%> 

		<title>Insert title here</title>
		<style type="text/css">
			body {
				background-color:#f5f5f5;
			}
			.head {
				font-size:22px;
				color:#1a1a1a;
				margin-top: 16px;
				margin-left: 12px;
				margin-right: 12px;
				margin-bottom: 12px;
			}
			.time{
				font-size:15px;
				color:#8f8f8f;
				margin-left: 12px;
			}
			.author {
				font-size:15px;
				color:#7abc1c;
				margin-left: 6px;
			}
			p.img-head {
				max-width: 100%; 
				min-height: 1em; 
				color: rgb(62, 62, 62); 
				line-height: 25.6000003814697px; 
				text-align: center; 
				box-sizing: border-box !important; 
				word-wrap: break-word !important; 
				background-color: rgb(255, 255, 255);
			}
			img.head-img {
				max-width:100%;
				line-height: 25.6000003814697px; 
				box-sizing: border-box !important; 
				word-wrap: break-word !important; 
				width: auto !important; 
				visibility: visible !important;
				padding-top: 28px;
				padding-left: 12px;
				padding-right: 12px;
				padding-bottom: 24px;
				text-align: center;
			}
			.content {
				font-size:15px;
				white-space: normal;
				word-wrap: break-word !important;
				padding-left: 12px;
				padding-right: 12px;
				line-height: 180%;
			}
			br {
				max-width: 100%; 
				box-sizing: border-box !important; 
				word-wrap: break-word !important;
			}
		</style>
	</head>
<body onload="window.deer.getBrowseCount(${pd.conBrowse});">

	<div>
		<div class="head">${pd.conTitle}</div>
	</div>
	
	<div>
		<font class="time">${pd.conDt} </font>  
		<font class="author">${pd.conUserName}</font>
	</div>
	
	<div>
		<p class="head-img">
			<img class="head-img" src="<%=basePath%>uploadFiles/uploadImgs/${pd.conAttach}" onerror="javascript:this.src='<%=basePath%>static/images/default_article_web.png' " />
			<br />
		</p>
		<!--<img class="head-img" src="https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png" />-->
	</div>
	
	<div class="content">
		<!-- <pre> -->
			${pd.conFullInfo}
		<!-- </pre> -->
	</div>

</body>
</html>