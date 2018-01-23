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
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<style>
		*{ font-size:14px; color:#595959;}
		body,ul,li{ margin:0; padding:0; list-style:none;}
		.clearfix{ clear:both;}
		.big_box{ border:#dedede 1px solid; padding-left:50px;}
		.yiyuan { margin-top:30px; margin-bottom:30px;}
		.yiyuan li{ float:left; }
		.yiyuan select{ height:30px; width:360px; outline:none;}
		.line_h{ line-height:32px;}
		.shuxing{ border:1px solid #dedede; width:360px; height:398px; background-color:#f2f2f2; margin-left:71px;}
		.bianji_but{ background-color:#428bca; width:44px; height:32px; border:none; color:#ffffff; text-shadow:0 -1px 0 #356fa2; cursor:pointer; margin-left:71px; margin-top:30px; margin-bottom:30px;}
		.bianji_but:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
	</style>
	</head> 
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
	
	  <div class="big_box">
    	<ul class="yiyuan">
        	<li class="line_h">所属医院：</li>
        	<li>
            	<select id="hospitalSelect" onchange ="changeHospital(this.options[this.options.selectedIndex].value);">
            	<c:forEach items="${hospitalList }" var = "hospital">
            		<option value="${hospital.hospitalId}" <c:if test="${hospital.hospitalId== pd.hospitalId}">selected</c:if>>${hospital.hospitalName}</option>
            	</c:forEach>
                </select>
            </li>
            <div class="clearfix"></div>
        </ul>
        
        <ul>
        	<li class="line_h">医院科室：</li>
        	<li class="shuxing ztree" id="leftTree"></li>
        </ul>
        
        <ul>
        	<li><input type="button" value="编辑" onclick="edit();" class="bianji_but btn btn-mini btn-primary"></li>
        </ul>
    </div>
    
</div>
</div>
</div>
</div><!--/.fluid-container#main-container-->
		
	<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<!-- 引入 -->
		<script type="text/javascript">
			$(top.hangge());
		</script>
		<SCRIPT type="text/javascript">

		var setting = {
			view: {
				showIcon: showIconForTree,
			},
			
			data: {
				key:{
					name:"officeName"
				},
				simpleData: {
					enable: true,
					idKey: "officeId",
					pIdKey: "officeParentId",
					rootPId: 0 
				}
			},
			callback:{
				/* onClick: zTreeOnClick */
			}
		};
		
		
	
		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};
		
		//初始化
		$(document).ready(function(){
			var officeList2 = '${officeList}';
			var officeJson =  jQuery.parseJSON(officeList2);
			if(officeJson[0].officeId ==null){
				$("#leftTree").text("无");
				return;
			}
			$.fn.zTree.init($("#leftTree"), setting, officeJson);
		});
		
		//回调
		function zTreeOnClick(event, treeId, treeNode){
		    alert(treeNode.tId + ", " + treeNode.officeId);
		};
		
		//编辑
		<%-- function edit(){
			var hospitalId = $.trim($("#hospitalId").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>officeManage/officeRight.do',
		    	data: {hospitalId:hospitalId},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
							var officeJson =  data.officeRight;
							$.fn.zTree.init($("#rightTree"), setting, officeJson);
							$("#rightTd").show();
					 }else{
						alert("失败！");
					 }
				}
			});
		}; --%>
		function changeHospital(hospitalId){
			var hospitalId = hospitalId;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>officeManage/officeByHospitalId.do',
		    	data: {hospitalId:hospitalId},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
							var officeJson =  data.officeRight;
							if(officeJson[0].officeId ==null){
								$("#leftTree").text("无");
								return;
							}
							$.fn.zTree.init($("#leftTree"), setting, officeJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
		}
		//编辑
		function edit(){
			var hospitalId = $("#hospitalSelect option:selected").val();
			window.location.href="officeManage/toOfficeTreeEdit.do?hospitalId="+hospitalId;
		}
	</SCRIPT>
		
</body>
</html>

