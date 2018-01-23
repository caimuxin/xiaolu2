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
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
<style>
*{ font-size:12px; color:#595959;}
input{ outline:none;}
#zhongxin{
	border:1px #EDEDED solid;width:428px;height:274;border-top-left-radius:10px;border-top-right-radius:10px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;
	}

li{
	color:#595959;text-align:center;list-style:none;padding-top:30px;
	}
	
.titles{width:216px;height:24px;
	}
#select_k1{width:216px;
	}
	
#btu{
	color:#ffffff;
	background-color:#428BCA;
	}
.but1{
	border:none;
	color:#ffffff;
	width:42px;
	height:30px;
	background-color:#D15B47;
	text-shadow:0px -1px 0px #a74939;
	cursor:pointer;
	}
.but2{
	border:none;
	width:42px;
	height:30px;
	text-shadow:0px -1px 0px #356fa2;
	cursor:pointer;
	}
#zhongxin select{ margin:0; padding:0; width:218px; height:30px;}
</style>
</head>
<body>

<form action="eduTypeController/${msg}.do" name="EduTypeForm" id="EduTypeForm" method="post">
<input type="hidden" id="eduId" name="eduId" value="${pd.EDU_ID}">
	<div id="zhongxin">
		<ul>
			<li id="ti" style="font-size: 16px;">类别编辑</li>
			<li>标题：&nbsp&nbsp&nbsp <input id="edu_title" name="edu_title" class="titles"  type="text" value="${pd.EDU_TITLE}">
			</li>
			<li>父类：&nbsp&nbsp&nbsp 
			<select name="edu_pid" id="edu_pid" class="xla_k">
			<!-- <select class="chzn-select" name="edu_pid" id="role_id" data-placeholder="请选择等级" style="vertical-align:top;"  title="级别"> -->
					<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty eduTypeList}">
					<option value="" style="font-size: 10px">请选择</option>
						<c:forEach items="${eduTypeList}" var="edu" varStatus="vs">
							<option value="${edu.EDU_ID}">${edu.EDU_TITLE}</option>
						</c:forEach>
					</c:when>
						
					<c:when test="${not empty typeList}">
					<option value="" style="font-size: 10px">请选择</option>
						<c:forEach items="${typeList}" var="ed" varStatus="vss">
							<option value="${ed.EDU_ID}">${ed.EDU_TITLE}</option>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<option value="0">已是最大级别</option>
					</c:otherwise>
					
				</c:choose>
			</select>
			</li>
			<li>顺序：&nbsp&nbsp&nbsp <input id="edu_sequence" name="edu_sequence" type="text" class="titles" value="${pd.EDU_SEQUENCE}">
			</li>
			<li>
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
			</li>
		</ul>
	</div>
	
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>

</form>

	<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		
		
	<script type="text/javascript">
		$(top.hangge());
	</script>
	
	<script type="text/javascript">
	//保存
	function save(){
		
		if($("#edu_pid").val()==""){
			$("#edu_pid").tips({
				side:3,
	            msg:'请选择父类',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#role_id").focus();
			return false;
		}
		
		
		if($("#edu_title").val()==""){
			$("#edu_title").tips({
				side:3,
	            msg:'输入标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#edu_title").focus();
			return false;
		}else{
			$("#edu_title").val($.trim($("#edu_title").val()));
		}
		
		var myreg =/^\d{0,9}$/;
		if($("#edu_sequence").val()==""){
			$("#edu_sequence").tips({
				side:3,
	            msg:'输入序号',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#edu_sequence").focus();
			return false;
		}else if(!myreg.test($("#edu_sequence").val())){
			$("#edu_sequence").tips({
				side:3,
	            msg:'请输入0-9位的数字',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#edu_sequence").focus();
			return false;
		}else{
			$("#edu_sequence").val($.trim($("#edu_sequence").val()));
		}
		if($("#edu_title").val()!=""){
		hasName();
		}else{
		$("#EduTypeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		}
	}
	
	/* 判断标题是否存在 */
	function hasName(){
		var eduTitle=$.trim($("#edu_title").val());
		
		$.ajax({
			type: "POST",
			url: '<%=basePath%>eduTypeController/getEduTypeName.do?eduId='+'${pd.EDU_ID}',
	    	data: {eduTitle:eduTitle},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#EduTypeForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					 $("#edu_title").tips({
							side:3,
				            msg:'标题已存在！',
				            bg:'#AE81FF',
				            time:2
						 });
						$("#edu_title").focus();
						$("#edu_title").val('');
				 }
			}
		});
	}
		
	</script>
</body>
</html>