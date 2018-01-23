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
	<link rel="stylesheet" href="static/xiaolu/css/examrecord.css" type="text/css">
	</head> 
<body>
		
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
						
			<ul class="table">
		        <li class="l_yuanjiao"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
		        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
		        <li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
		        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
		        <li class="r_yuanjiao this"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
		        <div  class="clearfix"></div>
			</ul>
		    <div class="jc_jlb_big_box">
		    	<div class="jc_jlb_xuanze">
		    		<form action="examRecord/examRecordList.do" method="post" name="examRecordForm" id="examRecordForm">
		    			<input type="hidden" id="uuid" name="uuid" value="${pd.uuid}" >
		    			<input type="hidden" id="timeType" name="timeType" value="${pd.timeType}" >
			        	<ul class="float_left">
			            	<li>
			                    <select name="recordType" onchange ="changeView(this.options[this.options.selectedIndex].value);" id="select_k1" class="xla_k">
			                    <option value="tab" style="font-size:10px">记录表</option>
			                    <option value="chart" >趋势图</option>
			                    </select>
			                 </li>
			                   	<input class="date-picker" name="startTime" id="startTime"  value="${pd.startTime}" type="text" data-date-format="yyyy-mm-dd"  style="width:88px;" placeholder="开始日期" />
								<input class="date-picker" name="endTime" id="endTime"  value="${pd.endTime}" type="text" data-date-format="yyyy-mm-dd" style="width:88px;" placeholder="结束日期" />
			                <div class="clearfix"></div>
			            </ul> 
			                
			            <ul>
			            	<li class="float_r">
			                	<input type="button" onclick="searchExam();" class="search">
			                </li>
			                <div class="clearfix"></div>
			            </ul>
			            <div class="clearfix"></div>
		            </form>
		            <div class="clearfix"></div>
		        </div>
		    	<div class="jc_jlb_time_table">
		            <ul>
		               <li <c:if test="${pd.timeType =='week' }">class="time_this"</c:if> >
		               		<a href="examRecord/examRecordList.do?timeType=week&uuid=${pd.uuid}">
		                        <img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		                       	 本周
		                    </a>
		               </li>
		               <li <c:if test="${pd.timeType =='month' }">class="time_this"</c:if>>
		               		<a href="examRecord/examRecordList.do?timeType=month&uuid=${pd.uuid}">
		                        <img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		                	        本月
		                    </a>
		               </li>
		               <li <c:choose><c:when test="${pd.timeType =='season' }">class="time_this jinyijidu"</c:when><c:otherwise> class="jinyijidu"</c:otherwise></c:choose>>
		               		<a href="examRecord/examRecordList.do?timeType=season&uuid=${pd.uuid}">
		               		<img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		              		      本季度
		                    </a>
		               </li>
		               <div class="clearfix"></div>
		            </ul>
		        </div>
		        <!--血压记录-->
		        <div class="">
		            <div class="jc_jlb_xueyajilu_tital">
		                 <h1>血压记录</h1>
		                 <div class="clearfix"></div>
		            </div>
		            <table class="jc_jlb_tital" cellspacing="0">
		                <tr>
		                <td>监测时间</td>
		                <td>舒张压<span>(正常范围60-90)</span></td>
		                <td>收缩压<span>（正常范围90-140）</span></td>
		                <!-- <td class="border_r caozuo">操作</td> -->
		                </tr>
		            </table>
		            
		            <table class="jc_jlb_shuju" cellspacing="0">
		                <c:forEach items ="${bloodList}" var = "blood" varStatus = "bindex">
		                	 <tr <c:if test="${bindex.index%2==1}">class="bgcolor95"</c:if> >
				                <td>${blood.bDate}</td>
				                <td class="biaoti"<c:if test="${blood.bDiastolic<60 or blood.bDiastolic>90}">style="color:#ff0000"</c:if>>${blood.bDiastolic}</td>
				                <td <c:if test="${blood.bSystolic<90 or blood.bSystolic>140}">style="color:#ff0000"</c:if>>${blood.bSystolic}</td>
				                <!-- <td class="border_r caozuo">
				                    <a href=""><input type="button" class="bianji"></a>
				                </td> -->
			                 </tr>
		                </c:forEach>
		            </table>
		            <div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>
		        </div>
		        <!--体重记录-->
		        <div class="">
		           <div class="jc_jlb_xueyajilu_tital">
		                 <h1>体重记录</h1>
		                 <div class="clearfix"></div>
		            </div>
		            <table class="jc_jlb_tital" cellspacing="0">
		                <tr>
		                <td>监测时间</td>
		                <td>体重<span>(正常范围45-65kg)</span></td>
		                <td>体脂率<span>（正常范围25.5-31.5）</span></td>
		                <!-- <td class="border_r caozuo">操作</td> -->
		                </tr>
		            </table>
		            
		            <table class="jc_jlb_shuju" cellspacing="0">
		                <c:forEach items ="${weighList}" var = "weigh" varStatus = "windex">
		                	 <tr <c:if test="${windex.index%2==1}">class="bgcolor95"</c:if> >
				                <td>${weigh.wDate}</td>
				                <td class="biaoti">${weigh.wWeight}</td>
				                <td>${weigh.wFat}</td>
				                <!-- <td class="border_r caozuo">
				                    <a href=""><input type="button" class="bianji"></a>
				                </td> -->
			                 </tr>
		                </c:forEach>
		            </table>
		            <div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>
		        </div>
		        <!--胎心记录-->
		        <div class="">
		           <div class="jc_jlb_xueyajilu_tital">
		                 <h1>胎心记录</h1>
		                 <div class="clearfix"></div>
		            </div>
		            <table class="jc_jlb_tital" cellspacing="0">
		                <tr>
		                <td>监测时间</td>
		                <td class="jc_jlb_taixin">胎心<span>(正常范围120-160)</span></td>
		                <!-- <td class="border_r caozuo">操作</td> -->
		                </tr>
		            </table>
		            
		            <table class="jc_jlb_shuju" cellspacing="0">
		            	<c:forEach items ="${heartList}" var = "heart" varStatus = "hindex">
		                	 <tr <c:if test="${hindex.index%2==1}">class="bgcolor95"</c:if> >
				                <td>${heart.oDate}</td>
				                <td class="jc_jlb_taixin"<c:if test="${heart.oHeart<120 or heart.oHeart>160}">style="color:#ff0000"</c:if>>${heart.oHeart}</td>
				                <!-- <td class="border_r caozuo">
				                    <a href=""><input type="button" class="bianji"></a>
				                </td> -->
			                 </tr>
		                </c:forEach>
		            </table>
		            <div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>
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
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function searchExam(){
			top.jzts();
			$("#examRecordForm").submit();
		};
		function changeView(recordType){
			var uuid = $("#uuid").val();
			if(recordType =="chart"){
				window.location.href="<%=basePath%>examRecord/listRecordChart.do?uuid="+uuid;
			}
		};
		$(function() {
			//日期框
			$('.date-picker').datepicker();
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		});
		</script>
		
	</body>
</html>

