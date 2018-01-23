<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta charset="utf-8" />
<style>
*{ font-size:14px; color:#595959; font-family:"宋体";}
.clearfix{ clear:both;}
dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
h1,h2,h3,p{font-weight:bold; margin:0; padding:0;}
a{ text-decoration:none;}

.center_box{ padding:40px; width:800px; border:1px solid #cccccc;}
.wenzhangbiaoti{ font-size:24px; text-align:center;}
.center_box .xiaobiaoti{ text-align:center; font-size:14px; color:#595959; font-weight:normal; margin-top:18px; margin-bottom:40px;}
.imgs{ width:300px; height:300px;float:right; margin-left:20px; margin-bottom:20px;}
.imgs img{ display:block;}
.zhengwen{ }
.center_box p{ line-height:24px; font-weight:normal;}
.center_box h2{ padding-top:20px; padding-bottom:12px;}
.but2{
	background-color:#428bca;
	color:#ffffff;
	border:none;
	width:42px;
	height:30px;
	text-shadow:0px -1px 0px #356fa2;
	cursor:pointer;
	font-size:12px;
	margin-top:40px;
	margin-left:40px;
	}
.but2:hover{ background-image:url(static/img/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
</style>
</head>
<body>
	

<div class="center_box">
        <h1 class="wenzhangbiaoti">
        	${pd.CON_TITLE}
        </h1>
 
       <h3 class="xiaobiaoti">发布时间：${pd.CON_DT}　　作者：${pd.USERNAME}　　阅读：${pd.CON_BROWSE}次</h3>

		<div class="zhengwen">
        	<div class="imgs"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.CON_ATTACH}" width="300px;" height="300px;"></div>
            <p>
          	  　${pd.CON_FULLINFO}</p>
            </div>
            <div class="clearfix"></div>
    </div>
    <input class="but2"  type="button" value="返回" onclick="history.go(-1)">
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<!-- ace scripts -->
	<script src="static/assets/js/ace/elements.fileinput.js"></script>
	<script src="static/assets/js/ace/ace.js"></script>
	<!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript">
	$(top.hangge());
	
	
	function fan1(){
		window.location.href="<%=basePath%>eduContentController/listPdPageContent.do";
	}
	</script>
</body>
</html>