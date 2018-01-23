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
	
	//保存
	function save(){
		if($("#officeName").val()=="" || $("#officeName").val()=="此科室名称已存在!"){
			
			$("#officeName").tips({
				side:3,
	            msg:'输入科室名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#officeName").focus();
			$("#officeName").val('');
			$("#officeName").css("background-color","white");
			return false;
		}else{
			$("#officeName").val(jQuery.trim($('#officeName').val()));
		}
		
		
		
		if($("#officeId").val()==""){
			hasH();
		}else{
			$("#officeInitForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	

	
	//判断科室名是否存在
	function hasH(){
		var officeName = $.trim($("#officeName").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>officeInit/hasOfficeInit.do',
	    	data: {officeName:officeName},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#officeInitForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#officeName").css("background-color","#D16E6C");
					setTimeout("$('#officeName').val('此科室名称已存在!')",500);
				 }
			}
		});
	}
	
	function selectChange(oGradeN){
		$("#oGradeN").val(oGradeN)
	}

	
</script>
	</head>
<body>
	<form action="officeInit/${msg}.do" name="officeInitForm" id="officeInitForm" method="post">
		<input type="hidden" name="officeId" id="officeId" value="${pd.officeId }"/>
		<input type="hidden" name="oGradeN" id="oGradeN" value="${pd.oGradeN }"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<th>科室名称:</th>
				<td><input type="text" name="officeName" id="officeName" value="${pd.officeName }" maxlength="32" style="width:73%;" placeholder="这里输入科室名称" title="科室名称"/></td>
			</tr>
			<tr>
				<th>级别:</th>
				<td>
					<select id="oGradeN" name = "oGradeV" onchange ="selectChange(this.options[this.options.selectedIndex].text);">
						<option value="1" <c:if test="${pd.oGradeV== 1}">selected</c:if>>一级</option>
						<option value="2" <c:if test="${pd.oGradeV== 2}">selected</c:if>>二级</option>
						<option value="3" <c:if test="${pd.oGradeV== 3}">selected</c:if>>三级</option>
						<option value="4" <c:if test="${pd.oGradeV== 4}">selected</c:if>>四级</option>
	                </select>
                </td>
                
			</tr>
			<tr>
				<th>类别:</th>
				<td>
					<select id="oType" name = "oType" onchange ="typeChange(this.options[this.options.selectedIndex].text);">
						<option value="b" <c:if test="${pd.type== 'b'}">selected</c:if>>b超科室</option>
						<option value="c" <c:if test="${pd.type== 'c'}">selected</c:if>>产检科室</option>
						<option value="n" <c:if test="${pd.type== 'n'||empty pd.type}">selected</c:if>>无</option>
	                </select>
                </td>
                
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
		
		
		</script>
	
</body>
</html>