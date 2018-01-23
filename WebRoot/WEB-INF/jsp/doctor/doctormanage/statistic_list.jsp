﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	</head> 
	<style>
		*{ font-size:14px; color:#595959; font-family:"宋体";}
		.clearfix{ clear:both;}
		dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
		h1{ font-size:16px; font-weight:bold; margin-left:20px; margin-top:0px; margin-bottom:0px;}
		a{ text-decoration:none;}
		
		.yunfu{ background-color:#f2f2f2; width:1650px; padding-bottom:5px; border:1px solid #dedede;}
		.huaiyunzhouqitongji{ width:570px; height:305px; background-color:#ffffff; float:left; margin-left:20px;}
		.jibingshi{ width:500px; height:305px; background-color:#ffffff;float:left; margin-left:20px;}
		.yichuanshi{ width:500px; height:305px; background-color:#ffffff;float:left; margin-left:20px;}
		
		.yisheng{ background-color:#f2f2f2; width:1650px; padding-bottom:15px; border:1px solid #dedede; margin-top:5px;}
		.yishengtongji{ width:570px; height:430px; background-color:#ffffff; float:left; margin-left:20px;}
		.paiming{ width:1020px; height:430px; background-color:#ffffff; float:left; margin-left:20px; }
		.pmtb{text-align:center;vertical-align:middle;}
	</style>
<body>
		
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
						
		<div class="yunfu">
	    	<h1>孕妇数据</h1>
	    	<div class="center_box">
	        	<div class="huaiyunzhouqitongji">
	        		<table border="0" width="80%">
						<tr>
							<td>
							<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/Column2D.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${strXML }" />
									<jsp:param name="chartId" value="weighChart" />
									<jsp:param name="chartWidth" value="570" />
									
									<jsp:param name="chartHeight" value="305" />
									<jsp:param name="debugMode" value="false" />
							</jsp:include>
							</td>
						</tr>
					</table>
	        	</div>
	            <div class="jibingshi">
	            	<table border="0" width="80%">
						<tr>
							<td>
								<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/Pie2D.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${pastXML }" />
									<jsp:param name="chartId" value="weighChart" />
									<jsp:param name="chartWidth" value="500" />
									
									<jsp:param name="chartHeight" value="305" />
									<jsp:param name="debugMode" value="false" />
								</jsp:include>
							</td>
						</tr>
					</table>
	            </div>
	            <div class="yichuanshi">
	            	<table border="0" width="80%">
						<tr>
							<td>
								<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/Pie2D.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${familyXML }" />
									<jsp:param name="chartId" value="weighChart" />
									<jsp:param name="chartWidth" value="500" />
									
									<jsp:param name="chartHeight" value="305" />
									<jsp:param name="debugMode" value="false" />
								</jsp:include>
							</td>
						</tr>
					</table>
	            </div>
	            <div class="clearfix"></div>
	        </div>
	    </div>
	    <div class="yisheng">
	    	<h1>医生数据</h1>
	    	<div class="center_box">
	        	<div class="yishengtongji">
	        		<table border="0" width="80%">
						<tr>
							<td>
							<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/Pie2D.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${doctorXML }" />
									<jsp:param name="chartId" value="weighChart" />
									<jsp:param name="chartWidth" value="570" />
									
									<jsp:param name="chartHeight" value="430" />
									<jsp:param name="debugMode" value="false" />
								</jsp:include></td>
						</tr>
					</table>
	        	</div>
	            <div class="paiming">
	            	 <table id="table_report" class="table table-striped table-bordered table-hover" >
		        		<thead>
							<tr>
								<th style="text-align:center;vertical-align:middle;">排名</th>
								<th style="text-align:center;vertical-align:middle;">头像</th>
								<th style="text-align:center;vertical-align:middle;">姓名</th>
								<th style="text-align:center;vertical-align:middle;">职称</th>
								<th style="text-align:center;vertical-align:middle;">接诊量</th>
							</tr>
						</thead>
		        		
		        		<c:forEach items="${doctorToplist}" var="doctor" varStatus="status">
							<tr style="height:15px">
								<td style="text-align:center;vertical-align:middle;"><img src="<%=basePath%>static/xiaolu/imgs/di${status.index+1 }.png" width="30" height="15"></td> 
								<td  style="text-align:center;vertical-align:middle;">
									<a href="<%=basePath%>uploadFiles/uploadImgs/${doctor.doctorPhoto}" title="${doctor.doctorPhoto}" class="bwGal"><img src="<%=basePath%>uploadFiles/uploadImgs/${doctor.doctorPhoto}" height="15" width="50"></a>
								</td>
								<td style="text-align:center;vertical-align:middle;"><a href="<%=basePath%>doctorManage/doctorInfoList.do?doctorId=${doctor.doctorId}">${doctor.doctorName }</a></td>
								<td style="text-align:center;vertical-align:middle;">${doctor.doctorPosition }</td>
								<td style="text-align:center;vertical-align:middle;">${doctor.amount }</td>
							</tr>
						</c:forEach>
					</table> 
	            </div>
	            <div class="clearfix"></div>
	        </div>
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
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<!-- 引入 -->
		
		
		<script type="text/javascript">
		
		$(top.hangge());
		
		function to_show(startMonth,endMonth){
			window.location.href="userInfoController/listPdPageUserInfo.do?startMonth="+startMonth+"&endMonth="+endMonth;
		};
		function to_showDoctor(position){
			var name = null ;
		};
		</script>
		
	</body>
</html>

