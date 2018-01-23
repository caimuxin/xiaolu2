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
		if($("#hospitalname").val()=="" || $("#hospitalname").val()=="此用户名已存在!"){
			
			$("#hospitalname").tips({
				side:3,
	            msg:'输入医院名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#hospitalname").focus();
			$("#hospitalname").val('');
			$("#hospitalname").css("background-color","white");
			return false;
		}else{
			$("#hospitalname").val(jQuery.trim($('#hospitalname').val()));
		}
		
		if($("#hospitalcity").val()==""){
			
			$("#hospitalcity").tips({
				side:3,
	            msg:'输入省市',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#hospitalcity").focus();
			return false;
		}else{
			$("#hospitalcity").val($.trim($("#hospitalcity").val()));
		}
		
		if($("#hospitaladdress").val()==""){
			
			$("#hospitaladdress").tips({
				side:3,
	            msg:'输入地址',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#hospitaladdress").focus();
			return false;
		}
		
		
		
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		var phone = /^0\d{2,3}-?\d{7,8}$/;
		if($("#hospitalphone").val()==""){
			
			$("#hospitalphone").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#hospitalphone").focus();
			return false;
		}else if(!phone.test($("#hospitalphone").val())  && !myreg.test($("#hospitalphone").val())){
			$("#hospitalphone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#hospitalphone").focus();
			return false;
		}
		
		if($("#hospital_id").val()==""){
			hasH();
		}else{
			$("#hospitalForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasH(){
		var hospitalName = $.trim($("#hospitalname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>hospital/hasHospital.do',
	    	data: {hospitalname:hospitalName},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#hospitalForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#hospitalname").css("background-color","#D16E6C");
					setTimeout("$('#hospitalname').val('此医院名称已存在!')",500);
				 }
			}
		});
	}
	
	//过滤类型
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#tp").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    	document.getElementById("tp").files[0] = '请选择图片';
	    }
	}
	
	//删除图片
	function delP(PATH,hospitalId){
		 if(confirm("确定要删除图片？")){
			var url = "hospital/delHospitalPi.do?PATH="+PATH+"&hospitalId="+hospitalId+"&pictureType=appearpicture";
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#EMAIL').val('')",2000);
				 }
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#NUMBER').val('')",2000);
				 }
			}
		});
	}
	
</script>
	</head>
<body>
	<form action="hospital/${msg}.do" name="hospitalForm" id="hospitalForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hospitalid" id="hospital_id" value="${pd.id }"/>
		<input type="hidden" name="hospitalpcid" id="hospitalpcid" value="${pd.hospitalPcId}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<th>图片:</th>
				<td>
					<c:if test="${pd == null || pd.appearpicture == '' || pd.appearpicture == null }">
					<input type="file" id="tp" name="tp" onchange="fileType(this)"/>
					</c:if>
					<c:if test="${pd != null && pd.appearpicture != '' && pd.appearpicture != null }">
						<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" width="210"/></a>
						<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.appearpicture}','${pd.id}');" />
						<input type="hidden" name="tpz" id="tpz" value="${pd.appearpicture }"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>医院名称:</th>
				<td><input type="text" name="hospitalname" id="hospitalname" value="${pd.hospitalname }" maxlength="32" style="width:95%;" placeholder="这里输入医院名称" title="医院名称"/></td>
			</tr>
			<tr>
				<th>省市:</th>
				<td><input type="text" name="hospitalcity" id="hospitalcity" value="${pd.hospitalcity }" maxlength="32" style="width:95%;" placeholder="这里输入省市" title="省市" onblur="hasN('${pd.hospitalcity }')"/></td>
			</tr>
			<tr>
				<th>等级:</th>
				<td><input type="text" name="hospitalrank" id="hospitalrank" value="${pd.hospitalrank }" maxlength="32" style="width:95%;" placeholder="输入等级" title="等级"/></td>
			</tr>
			<tr>
				<th>网址:</th>
				<td><input type="text" name="hospitalurl" id="hospitalurl" value="${pd.hospitalurl }" maxlength="32" style="width:95%;" placeholder="输入网址" title="网址" /></td>
			</tr>
			<tr>
				<th>联系电话:</th>
				<td><input type="text" name="hospitalphone" id="hospitalphone"  value="${pd.hospitalphone }"  maxlength="32" style="width:95%;" placeholder="这里输入联系电话" title="联系电话"/></td>
			</tr>
			<tr>
				<th>地址:</th>
				<td><input type="text" name="hospitaladdress" id="hospitaladdress"  value="${pd.hospitaladdress }"  maxlength="32" style="width:95%;" placeholder="这里输入地址" title="地址"/></td>
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
		$(function() {
			//上传
			$('#tp').ace_file_input({
				no_file:'请选择图片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
		});
		
		</script>
	
</body>
</html>