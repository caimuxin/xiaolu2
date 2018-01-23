<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<%-- <base href="<%=basePath%>"> --%>
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	</head> 
<body>
<div class="container-fluid" id="main-container">

	
<table style="width:100%;" border="0">
	<tr>
		<td style="width:15%;" valign="top" bgcolor="#F9F9F9">
			<div style="width:15%;">
				<ul id="leftTree" class="ztree"></ul>
			</div>
		</td>
		<td style="width:85%;" valign="top" >
			<div class="center_box">
    <!--搜索医师-->
        <div class="search">
            <input value="请输入医师姓名" class="yishi">
            <input type="button" style="width:32px; height:32px; background:#e7e7e7 url(imgs/search.png) no-repeat center;" class="sousuo">
        <div class=" clearfix"></div>
        </div>
        <!--表格-->
        <div class="biaoge">
        	<table border="1" bordercolor="dedede" cellspacing="0" class="tital">
                <tr>
                    <td width="120px" height="42px"><span>医师</span></td>
                    <td width="309px" ><span>时段</span></td>
                   
                    <td width="120px"><span>周一</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周二</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周三</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周四</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周五</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周六</span><br>(2016/6/7)</td>
                    <td width="120px"><span>周日</span><br>(2016/6/7)</td>
                </tr>
            </table>
            <div class="biaoge2">
            	<table  bordercolor="dedede" cellspacing="0"  class="yishiming">
                	<tr>
                    	<td width="121" height="329"><span>王坤</span><br>主任医师</td>
                    </tr>
                </table>
                
                <table  bordercolor="dedede" cellspacing="0" class="shiduan">
                	<tr>
                    	<td width="120" height="163" >上午</td>
                    </tr>
                    <tr>
                    	<td width="120" height="163">下午</td>
                    </tr>
                </table>
                
                <table>
                	<tr>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    
                </table>
                <div class=" clearfix"></div>
            </div>
        
        </div>
        
        <div class=" clearfix"></div>
    </div>
			<%-- <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/happuser/listUsers.do" style="margin:0 auto;width:100%;height:100%;"></iframe> --%>
		</td>
	</tr>
</table>
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
				onClick: zTreeOnClick
			}
		};
		
		
	
		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};
		
		$(document).ready(function(){
			var officeList2 = '${officeList}';
			var officeJson =  jQuery.parseJSON(officeList2);
			$.fn.zTree.init($("#leftTree"), setting, officeJson);
		});
		
		function treeFrameT(){
			var hmainT = document.getElementById("treeFrame");
			var bheightT = document.documentElement.clientHeight;
			hmainT .style.width = '100%';
			hmainT .style.height = (bheightT-7) + 'px';
		};
		
		function zTreeOnClick(event, treeId, treeNode){
		    alert(treeNode.tId + ", " + treeNode.officeId);
		};
		
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		};
	</SCRIPT>
		
</body>
</html>

