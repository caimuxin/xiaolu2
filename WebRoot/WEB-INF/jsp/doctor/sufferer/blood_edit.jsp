<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//保存
	function save(){
		
		if($("#bloodmeter_id").val()==""){
			
		}else{
			$("#examForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	
</script>
	</head>
<body>
	<c:choose>
	<c:when test="${msg=='bloodEdit'}">
	
		<form action="examRecord/${msg}.do" name="examForm" id="examForm" method="post" >
			<input type="hidden" name="bloodmeterId" id="bloodmeter_id" value="${pd.bloodmeterId }"/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<th>舒张压:</th>
					<td><input type="text" name="bDiastolic" id="bDiastolic" readonly="true" value="${pd.bDiastolic}"  maxlength="32" style="width:95%;"/></td>
				</tr>
				<tr>
					<th>收缩压:</th>
					<td><input type="text" name="bSystolic" id="bSystolic" readonly="true" value="${pd.bSystolic}" maxlength="32" style="width:95%;"  /></td>
				</tr>
				<tr>
					<th>心率:</th>
					<td><input type="text" name="heartRate" id="heartRate" readonly="true" value="${pd.heartRate}" maxlength="32" style="width:95%;" /></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
			</div>
			
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form>
	</c:when>
	<c:when test="${msg=='weightEdit'}">
		
		<form action="examRecord/${msg}.do" name="examForm" id="examForm" method="post" >
			<input type="hidden" name="weighingId" id="weighing_id" value="${pd.weighingId }"/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<th>体重:</th>
					<td><input type="text" name="wWeight" id="wWeight" readonly="true" value="${pd.wWeight}" maxlength="32" style="width:95%;"/></td>
				</tr>
				<tr>
					<th>BMI:</th>
					<td><input type="text" name="wBmi" id="wBmi" readonly="true" value="${pd.wBmi}" maxlength="32" style="width:95%;"  /></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
			</div>
			
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form>
		
	</c:when>
	<c:when test="${msg=='heartEdit'}">
	
		<form action="examRecord/${msg}.do" name="examForm" id="examForm" method="post" >
			<input type="hidden" name="id" id="id" value="${pd.id }"/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<th>胎心:</th>
					<td><input type="text" name="oHeart" id="oHeart" readonly="true" value="${pd.oHeart}" maxlength="32" style="width:95%;"/></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
			</div>
			
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form>
	
	</c:when>
	
	</c:choose>
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
		});
		
		</script>
	
</body>
</html>