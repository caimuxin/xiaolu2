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
	<link rel="stylesheet" href="plugins/zTree/3.5/demo.css" type="text/css">
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.js"></script>
	<style>
		*{ font-size:14px; color:#595959; font-family:"宋体";}
		body,ul,li{ margin:0; padding:0; list-style:none;}
		.clearfix{ clear:both;}
		.big_box{ border:#dedede 1px solid; padding-left:50px;}
		.yiyuan { margin-top:30px; margin-bottom:30px;}
		.yiyuan li{ float:left; }
		.yiyuan select{ height:30px; width:360px; outline:none;}
		.line_h{ line-height:32px;}
		.shuxing{ border:1px solid #dedede; width:360px; height:472px; background-color:#f2f2f2; margin-left:71px;}
		.fabu_fanhui li{ float:left; }
		.bianji_but{ background-color:#428bca; width:44px; height:32px; border:none; color:#ffffff; text-shadow:0 -1px 0 #356fa2; cursor:pointer; margin-left:71px; margin-top:30px; margin-bottom:30px;}
		.bianji_but:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
		.fanhui_but{ background-color:#d15b47; width:44px; height:32px; border:none; color:#ffffff; text-shadow:0 -1px 0 #a74939; cursor:pointer; margin-left:3px; margin-top:30px; margin-bottom:30px; }
		.fanhui_but:hover{ background-image:url(imgs/bg_shanchu.png); background-repeat:no-repeat; background-position:center;}
		.shiyong_but{ width:60px; height:28px; outline:none; font-size:12px; margin-top:216px; margin-left:50px;}
	
		.yiyuankeshi{ float:left; }
		.yiyuankeshi .shuxing{float:left;}
		.shiyong{ float:left; }
		.shuxing2{ border:1px solid #dedede; width:360px; height:398px; background-color:#f2f2f2;margin-top:32px;}
		.xuanzemuban{ width:287px; height:30px;}
		.muban{ float:left;  border:1px #dedede solid; padding:20px; margin-left:50px;}
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
        
        <div class="center_box">
        <ul class="yiyuankeshi">
        	<li class="line_h">医院科室：</li>
        	<ul class="shuxing ztree" id="leftTree"></ul>
        	<ul class="shuxing ztree" id="baseTree"></ul>
        	<div class="clearfix"></div>
        </ul>

        
        <ul class="shiyong">
        	<li><input type="submit" onclick="useTemplet();" value="<< 使用 " class="shiyong_but"></li>
        </ul>
        
        <ul class="muban">
        	<li>选择模板：
                <select id="templetSelect" onchange ="changeTemplet(this.options[this.options.selectedIndex].value);">
            	<c:forEach items="${officeTempletList }" var = "templet">
            		<option value="${templet.templetName}" <c:if test="${templet.templetName== pd.templetName}">selected</c:if>>${templet.templetName}</option>
            	</c:forEach>
                </select>
            </li>
        	<li class="shuxing2 ztree" id="templetTree"></li>
        </ul>
        <div class="clearfix"></div>
        </div>
        
        <ul class="fabu_fanhui">
        	<li><input type="button" onclick="publishTree();" value="发布" class="bianji_but"></li>
            <li><input type="button" onclick="cancel();" value="返回" class="fanhui_but"></li>
            <div class="clearfix"></div>
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
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false 
			},
			data: {
				key:{
					name:"officeName"
				},
				simpleData: {
					enable: true,
					idKey: "officeId",
					pIdKey: "pOfficeId",
					rootPId: 0 
				}
			},
			callback:{
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop 
			}
		};
		
		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};
		
		var templetSetting = {
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
						pIdKey: "pOfficeId",
						rootPId: 0 
					}
				},
				callback:{
				}
			};
		
		var templetTree;//存储模板树以供复制到医院树
		var hospitalTree;//保存医院修改前的树数据
		$(document).ready(function(){
			var officeList2 = '${officeList}';
			var officeJson =  jQuery.parseJSON(officeList2);
			var templetObject = '${templetJson}';
			var templetJson = jQuery.parseJSON(templetObject);
			var initJsonStr = '${initList}';
			var initJson = jQuery.parseJSON(initJsonStr);
			
			templetTree = templetJson;
			hospitalTree = officeJson;
			$.fn.zTree.init($("#leftTree"), setting, officeJson);
			$.fn.zTree.init($("#baseTree"), setting, initJson);
			$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
		});
		
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			var tNodeP = treeNodes[0].pOfficeId;//1:一级节点
			if(tNodeP == 1 && targetNode !=null){
				alert("只能作为一级节点！");
				return false;
			}
			return targetNode ? targetNode.drop !== false : true;
		}
		
		function beforeDrag(treeId, treeNodes) {
			
			for (var i=0,l=treeNodes.length; i<l; i++) {
				if (treeNodes[i].drag === false) {
					return false;
				}
				if(treeId == 'baseTree' && treeNodes[i].pOfficeId ==0){
					return false;
				}
			}
			return true;
		}
		
		
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
							hospitalTree = officeJson;
							$.fn.zTree.init($("#leftTree"), setting, officeJson);
							//改变init基础树
							var baseJson =  data.initList;
							$.fn.zTree.init($("#baseTree"), setting,baseJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
		};
		
		function changeTemplet(templetName){
			var templetName = templetName;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>officeManage/findTempletBytempletName.do',
		    	data: {templetName:templetName},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
							var templetJson =  data.templetTree;
							templetTree = templetJson;
							$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
		};
		
		function useTemplet(){
			var templetName = $("#templetSelect option:selected").text();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>officeManage/findInitTree.do',
		    	data: {templetName:templetName},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
							var baseJson =  data.baseTree;
							$.fn.zTree.init($("#baseTree"), setting,baseJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
			$.fn.zTree.init($("#leftTree"), setting, templetTree);
		};
		function publishTree(){
				var objecttree =  $.fn.zTree.getZTreeObj("leftTree");
				var newArray = objecttree.transformToArray(objecttree.getNodes());
				var newflag = false;
				var addArray = new Array();
				var delflag = false;
				var delArray = new Array();
				var hospitalId = $("#hospitalSelect option:selected").val();
				for(var newO in newArray){
					newflag = false;
					for(var oldO in hospitalTree){
						if(newArray[newO].officeId == hospitalTree[oldO].officeId){
							newflag = true;
						}
					}
					if(newflag == false){
						var toAddArray = new Object();
						toAddArray.officeId = newArray[newO].officeId;
						toAddArray.officeName = newArray[newO].officeName;
						toAddArray.pOfficeId = newArray[newO].pOfficeId;
						toAddArray.oGradeV = newArray[newO].oGradeV;
						toAddArray.type = newArray[newO].type;
						toAddArray.hospitalId = hospitalId;
						if(typeof(newArray[newO].type) == "undefined" || newArray[newO].type==''){
							toAddArray.type = 'n';
						}
						
						addArray.push(toAddArray);
						
					}
				}
				for(var oldO in hospitalTree){
					delflag = false;
					for(var newO in newArray){
						if(hospitalTree[oldO].officeId == newArray[newO].officeId){
							delflag = true;
						}
					}
					if(delflag == false){
						delArray.push(hospitalTree[oldO]);
					}
				}
				var addJson = JSON.stringify(addArray);
				var delJson = JSON.stringify(delArray);
				$.ajax({
					type: "POST",
					url: '<%=basePath%>officeManage/updateOfficeTree.do',
			    	data: {addO:addJson,delO:delJson},
					dataType:'json',
					cache: false,
					success: function(data){
						 if("success" == data.result){
							 window.location.href="officeManage/toOfficeTreeEdit.do?hospitalId="+hospitalId;
							 alert("保存成功！");
						 }else{
							 alert("失败！");
						 }
					}
				});
		};
		function cancel(){
			window.location.href ="officeManage/officeList.do";
		};
	</SCRIPT>
		
</body>
</html>

