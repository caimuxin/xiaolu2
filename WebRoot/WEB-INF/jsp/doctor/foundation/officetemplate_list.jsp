<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path2 = request.getContextPath();
	String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path2+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath2%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	<link rel="stylesheet" href="static/css/bultrasound.css" type="text/css">
	<link rel="stylesheet" href="plugins/zTree/3.5/demo.css" type="text/css">
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.js"></script>
	<style>
		*{ font-size:14px; color:#595959; font-family:"宋体";}
		.clearfix{ clear:both;}
		
		.big_box{ border:1px #dedede solid; padding-top:20px; padding-left:50px;}
		.left { float:left;}
		.left p{ color:#4f99c6;}
		.right{ float:left; border:#dedede 1px solid; padding:20px;}
		.right .shuxing{ float:left;}
		.right .shuxing2{ float:left;}
		
		.mukuai_name{ width:358px; height:30px; text-align:center; background-color:#f2f2f2; border:1px solid #dedede; margin-bottom:10px; outline:none;}
		.shuxing{ width:358px; height:398px; border:1px solid #dedede;}
		.shuxing2{ width:358px; height:398px; border:1px solid #dedede; margin-left:20px;}
		.baocun_qingchu input{ float:left;}
		.baocun{ background-color:#428bca; width:44px; height:32px; border:none; color:#ffffff; text-shadow:0 -1px 0 #356fa2; cursor:pointer; margin-top:10px;  outline:none;}
		.baocun:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
		.qingchu{ background-color:#D15B47; width:44px; height:32px; border:none; color:#ffffff; text-shadow:0 -1px 0 #a74939; cursor:pointer; margin-top:10px;  margin-left:3px; outline:none;}
		.qingchu:hover{ background-image:url(imgs/bg_shanchu.png); background-repeat:no-repeat; background-position:center;}
	</style>
	</head> 
<body>
		
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
	
		
		<div class="big_box">
	    	<div class="left">
		     	 <form action="officeInit/listOfficeTemplate.do" method="post" name="officeInitForm" id="officeInitForm">
				<!-- 检索  -->
				<table id="table_report" class="table table-striped table-bordered table-hover" style="width:100%;">
					<thead>
						<tr>
							<th style = "width:50px;">序号</th>
							<th style = "width:150px;">模板名称</th>
							<th class="center" style = "width:70px;">操作</th>
						</tr>
					</thead>
					<tbody>
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty templetList}">
							<%-- <c:if test="${QX.cha == 1 }"> --%>
							<c:forEach items="${templetList}" var="templet" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">${vs.index+1}</td>
									<td>${templet.templetName }</td>
									<td style="width: 60px;">
										<div class='hidden-phone visible-desktop btn-group'>
											<a class='btn btn-mini btn-info' title="编辑" onclick="editTemple('${templet.templetName}');"><i class='icon-edit'></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="10" class="center">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				
				<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
				</div>
			</form>
				<p>
	    	   	     提示:<br>
				1：右侧编辑区可编辑模板，保存成功后左侧列表新增一项模板。<br>
				2：点击左侧列表中科室模板的编辑按钮，模板信息显示在右侧编辑区，可进行修改。
	            </p>
		    </div>
		    
		    <div class="right">
		    	<input type="text" placeholder="请输入模块名称" id="templetTreeName" class="mukuai_name">
		    	<div class="content_wrap">
			        <div class="shuxing zTreeDemoBackground" >
			        	<ul class="ztree" id="templetTree"></ul>
			        </div>
			        
			         <div class="shuxing2 zTreeDemoBackground" >
			        	<ul class="ztree" id="baseTree"></ul>
			        </div>
		        <div class="clearfix"></div>
		        </div>

		        
		        <div class="baocun_qingchu">
		            <input type="button" value="保存" onclick="saveTree();" class="baocun">
		            <input type="button" value="清除" class="qingchu">
		            <div class="clearfix"></div>
		           
		        </div>
		    </div>

		    <div class="clearfix"></div>
		</div>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<!-- 	<script src="static/js/ace-elements.min.js"></script> -->
		
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};
		
		var templetSetting = {
				view: {
					showIcon: showIconForTree,
					selectedMulti:false
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
		
		/* $(document).ready(function(){
			var templetObject = '${templetJson}';
			var templetJson = jQuery.parseJSON(templetObject);
			$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
		}); */
		var newCount = 1;
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
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
		
		
		
		/* end */
		//修改
		var beforeChangeTree = null;
		function editTemple(templetName){
			var templetName = templetName;
			$.ajax({
				type: "POST",
				url: '<%=basePath2%>officeInit/findTempletTree.do',
		    	data: {templetName:templetName},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						 	beforeChangeTree =data.templetTree;
							var templetJson =  data.templetTree;
							var baseJson =  data.baseTree;
							if(templetJson.length>0 && templetJson[0]!=null){
								$("#templetTreeName").val(templetJson[0].templetName);
							}
							
							$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
							$.fn.zTree.init($("#baseTree"), templetSetting,baseJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
		};
		
		function saveTree(){
			var objecttree =  $.fn.zTree.getZTreeObj("templetTree");
			var newArray = objecttree.transformToArray(objecttree.getNodes());
			var newflag = false;
			var addArray = new Array();
			var delflag = false;
			var delArray = new Array();
			var templetName = $("#templetTreeName").val();
			for(var newO in newArray){
				newflag = false;
				for(var oldO in beforeChangeTree){
					if(newArray[newO].officeId == beforeChangeTree[oldO].officeId){
						newflag = true;
					}
				}
				if(newflag == false){
					var toAddArray = new Object();
					toAddArray.officeId = newArray[newO].officeId;
					toAddArray.officeName = newArray[newO].officeName;
					toAddArray.pOfficeId = newArray[newO].pOfficeId;
					toAddArray.oGradeV = newArray[newO].oGradeV;
					toAddArray.oGradeN = newArray[newO].oGradeN;
					toAddArray.templetName = templetName;
					addArray.push(toAddArray);
					
				}
			}
			for(var oldO in beforeChangeTree){
				delflag = false;
				for(var newO in newArray){
					if(beforeChangeTree[oldO].officeId == newArray[newO].officeId){
						delflag = true;
					}
				}
				if(delflag == false){
					delArray.push(beforeChangeTree[oldO]);
				}
			}
			var addJson = JSON.stringify(addArray);
			var delJson = JSON.stringify(delArray);
			$.ajax({
				type: "POST",
				url: '<%=basePath2%>officeInit/updateTempletTree.do',
		    	data: {addO:addJson,delO:delJson},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						 window.location.href="officeInit/listOfficeTemplate.do";
						 alert("保存成功！");
					 }else{
						 alert("失败！");
					 }
				}
			});
		};
		
		
		
		
		
		</script>
		
	</body>
</html>

