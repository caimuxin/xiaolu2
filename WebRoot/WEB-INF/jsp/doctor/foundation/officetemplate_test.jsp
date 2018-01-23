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
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core.js"></script>
	
	<!-- <script type="text/javascript" src="plugins/zTree/3.5/jquery-1.4.4.min.js"></script> -->
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.js"></script>
	<style>
		*{ font-size:14px; color:#595959; font-family:"宋体";}
		.clearfix{ clear:both;}
		
		.big_box{ border:1px #dedede solid; padding-top:20px; padding-left:50px;}
		.left { float:left;}
		.left p{ color:#4f99c6;}
		.right{ float:left; border:#dedede 1px solid; padding:20px;}
		.mukuai_name{ width:358px; height:30px; text-align:center; background-color:#f2f2f2; border:1px solid #dedede; margin-bottom:10px; outline:none;}
		.shuxing{ width:358px; height:398px; border:1px solid #dedede;}
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
		        <div class="shuxing zTreeDemoBackground" >
		        	<ul class="ztree" id="templetTree"></ul>
		        </div>
		        <div class="baocun_qingchu">
		            <input type="button" value="保存" class="baocun">
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
					addHoverDom: addHoverDom,
					removeHoverDom: removeHoverDom, 
					showIcon: showIconForTree
				},
				edit: {
					enable: true,
					editNameSelectAll:true,
					showRemoveBtn: showRemoveBtn,
					showRenameBtn: showRenameBtn 
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
					/* beforeDrag: beforeDrag,
					beforeEditName: beforeEditName,
					beforeRemove: beforeRemove,
					beforeRename: beforeRename,
					onRemove: onRemove,
					onRename: onRename */
				}
			};
		
		/* $(document).ready(function(){
			var templetObject = '${templetJson}';
			var templetJson = jQuery.parseJSON(templetObject);
			$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
		}); */
		//用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
		function beforeEditName(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("templetTree");
			zTree.selectNode(treeNode);
			return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
		}
		//用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("templetTree");
			zTree.selectNode(treeNode);
			return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
		}
		//用于捕获删除节点之后的事件回调函数。
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		//用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
		function beforeRename(treeId, treeNode, newName, isCancel) {
			className = (className === "dark" ? "":"dark");
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("templetTree");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		//用于捕获节点编辑名称结束之后的事件回调函数。
		function onRename(e, treeId, treeNode, isCancel) {
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
		}
		//显示添加自定义控件节点
		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("templetTree");
				zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
				return false;
			});
		};
		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		//删除节点
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
		};
		function zTreeOnClick(event, treeId, treeNode){
		    alert(treeNode.tId + ", " + treeNode.officeId);
		};
		
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		
		//修改
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
							var templetJson =  data.templetTree;
							if(templetJson.length>0 && templetJson[0]!=null){
								$("#templetTreeName").val(templetJson[0].templetName);
							}
							$.fn.zTree.init($("#templetTree"), templetSetting, templetJson);
					 }else{
						 alert("失败！");
					 }
				}
			});
		}
		
		
		
		
		
		
		
		</script>
		
	</body>
</html>

