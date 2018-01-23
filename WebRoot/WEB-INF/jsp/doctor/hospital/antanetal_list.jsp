<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
	String pathA = request.getContextPath();
	String basePathA = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathA+"/";
%> --%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<%-- <base href="<%=basePathA%>"> --%>
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="static/css/antanetal.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	</head> 
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
<table style="width:100%;" border="0">
	<tr>
		<td style="width:15%;" valign="top" bgcolor="#F9F9F9">
			<div style="width:15%;">
				<ul id="leftTree" class="ztree"></ul>
			</div>
		</td>
		<td style="width:85%;" valign="top" >
		<!-- 表格start -->
		<div class="center_box">
        <!--表格-->
        <div class="biaoge">
         <!--搜索医师-->
         	<form action="antanetalExam/listAntanetalExam.do" method="post">
                <div class="search">
                    <input placeholder="请输入医师姓名" <c:if test="${!empty serDoctorName}">value="${serDoctorName}"</c:if> id="inputDoctorName" class="yishi">
                    <input type="button" onclick="searchDoctor();"  style="width:32px; height:32px; background:#e7e7e7 url(static/images/antanetalSearch.png) no-repeat center;" class="sousuo">
                <div class=" clearfix"></div>
                </div>
        	<div class="biaoge_r">

        	<table  cellspacing="0" class="tital">
                <tr>
                    <td ><span>医师</span></td>
                    <td class="shiduan_tital"><span>时段</span></td>
                   	<c:forEach items="${weekInfo}" var="wi">
                    	<td ><span>${wi.weekDay }</span><br>(${wi.bDate })</td>
                    </c:forEach>
                   
                </tr>
            </table>
            <!-- 表格数据(biaoge2)start -->
            <c:forEach items="${doctorList }" var="doctor">
	            <div class="biaoge2">
	            	<table  bordercolor="dedede" cellspacing="0"  class="yishiming">
	                	<tr>
	                    	<td width="119" height="333"><span>${doctor.doctorName }</span><br>${doctor.doctorPosition  }</td>
	                    </tr>
	                </table>
	                
	                <table  bordercolor="dedede" cellspacing="0" class="shiduan">
	                	<tr>
	                    	<td width="119" height="165" >上午</td>
	                    </tr>
	                    <tr>
	                    	<td width="119" height="165">下午</td>
	                    </tr>
	                </table>
	                
	                <table class="shijian" cellspacing="0">
	                	<tr>
	                    	<td>08:00-09:00</td>
	                    </tr>
	                    <tr>
	                    	<td class="bgcolor95">09:00-10:00</td>
	                    </tr>
	                    <tr>
	                    	<td>10:00-11:00</td>
	                    </tr>
	                    <tr>
	                    	<td class="bgcolor95">11:00-12:00</td>
	                    </tr>
	                    <tr>
	                    	<td>14:00-15:00</td>
	                    </tr>
	                    <tr>
	                    	<td class="bgcolor95">15:00-16:00</td>
	                    </tr>
	                    <tr>
	                    	<td>16:00-17:00</td>
	                    </tr>
	                    <tr>
	                    	<td class="bgcolor95">17:00-18:00</td>
	                    </tr>
	                    
	                </table>
	                
	                <table class="shuju" cellspacing="0">
	                	<c:forEach items="${doctor.totalTimeSource }" var="d_ds" varStatus = "d_ds_var"><!-- 时间段数据集 -->
	                	<tr <c:if test = "${d_ds_var.index%2==1}">class="bgcolor95"</c:if>>
	                		<c:set var="d_forOrder"  value="0"/>
	                		<c:forEach begin="0" end = "6"  varStatus = "d_vs">
	            				<c:choose>
			            			<c:when test="${d_ds.timeArea[d_forOrder].dayOrder ==d_vs.index}">
			            				<td <c:if test = "${d_vs.index==6}">class="border_r"</c:if>>
			            				${d_ds.timeArea[d_forOrder].zSourceusing}/${d_ds.timeArea[d_forOrder].zSource }</td>
			            				 <c:set value="${d_forOrder+1}"  var="d_forOrder" />
			            			</c:when>
			            			<c:otherwise>
			            				<td <c:if test = "${d_vs.index==6}">class="border_r"</c:if>><div class="wu"></div></td>
			            			</c:otherwise>
			            		</c:choose>
		            		</c:forEach>
	                    </tr>
	                    </c:forEach>
	                </table>
	                <div class=" clearfix"></div>
	            </div>
            </c:forEach>
           	<!-- 表格数据end -->
            <div class=" clearfix"></div>
            
            </div>
            
            <div class="page-header position-relative">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
					</tr>
				</table>
			</div>
			
            </form>
            
        <div class=" clearfix"></div>
        </div>
        
        <div class=" clearfix"></div>
    </div>
	<!-- 表格end -->
		</td>
	</tr>
</table>
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
			treeNode:{
				open:true
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
			var officeId = treeNode.officeId;
			window.location.href="antanetalExam/listAntanetalExam.do?officeId="+officeId;
		};
		
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		};
		
		function searchDoctor(){
			var doctorName = $("#inputDoctorName").val();
			window.location.href="antanetalExam/listAntanetalExam.do?search=y&doctorName="+doctorName;
		}
	</SCRIPT>
		
</body>
</html>

