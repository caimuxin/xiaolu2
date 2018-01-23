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
		    		<form action="examRecord/listRecordChart.do" method="post" name="examRecordChartForm" id="examRecordChartForm">
		    			<input type="hidden" id="uuid" name="uuid" value="${pd.uuid}" >
			        	<ul class="float_left">
			            	<li>
			                    <select name="recordType" onchange ="changeView(this.options[this.options.selectedIndex].value);" id="select_k1" class="xla_k">
			                    <option value="tab" style="font-size:10px">记录表</option>
			                    <option value="chart" selected="selected">趋势图</option>
			                    </select>
			                 </li>
			                   	<input class="date-picker" name="startTime" id="startTime"  value="${pd.startTime}" type="text" data-date-format="yyyy-mm-dd" style="width:88px;" placeholder="开始日期" />
								<input class="date-picker" name="endTime" id="endTime"  value="${pd.endTime}" type="text" data-date-format="yyyy-mm-dd" style="width:88px;" placeholder="结束日期" />
			                <div class="clearfix"></div>
			            </ul> 
			                
			            <ul>
			            	<li class="float_r">
			                	<input type="button" onclick="searchExamChart();" class="search">
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
		               		<a href="examRecord/listRecordChart.do?timeType=week&uuid=${pd.uuid}">
		                        <img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		                       	 近一周
		                    </a>
		               </li>
		               <li <c:if test="${pd.timeType =='month' }">class="time_this"</c:if>>
		               		<a href="examRecord/listRecordChart.do?timeType=month&uuid=${pd.uuid}">
		                        <img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		                	        近一月
		                    </a>
		               </li>
		               <li <c:choose><c:when test="${pd.timeType =='season' }">class="time_this jinyijidu"</c:when><c:otherwise> class="jinyijidu"</c:otherwise></c:choose>>
		               		<a href="examRecord/listRecordChart.do?timeType=season&uuid=${pd.uuid}">
		               		<img src="static/xiaolu/imgs/huanzheguanli_jc_jlb_time_table.png">
		              		      近一季度
		                    </a>
		               </li>
		               <div class="clearfix"></div>
		            </ul>
		        </div>
		    
		    
			    <div class="jc_qushitu_xueyaqushitu">
					<table border="0" width="80%">
						<tr>
							<td>
							
							<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/n-MSLine.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${mulXML }" />
									<jsp:param name="chartId" value="myNext" />
									<jsp:param name="chartWidth" value="800" />
									
									<jsp:param name="chartHeight" value="500" />
									<jsp:param name="debugMode" value="false" />
								</jsp:include></td>
						</tr>
					</table>
				</div>    
	        
	        <div class="jc_qushitu_tizhongqushitu">
	        	<table border="0" width="80%">
						<tr>
							<td>
							
							<jsp:include
									page="../../FusionChartsHTMLRenderer.jsp" flush="true">
									<jsp:param name="chartSWF" value="static/FusionCharts/Line.swf" />
									<jsp:param name="strURL" value="" />
									<jsp:param name="strXML" value="${strXML }" />
									<jsp:param name="chartId" value="weighChart" />
									<jsp:param name="chartWidth" value="800" />
									
									<jsp:param name="chartHeight" value="500" />
									<jsp:param name="debugMode" value="false" />
								</jsp:include></td>
						</tr>
					</table>
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
		
		function changeView(recordType){
			var uuid = $("#uuid").val();
			if(recordType =="tab"){
				window.location.href="<%=basePath%>examRecord/examRecordList.do?uuid="+uuid;
			}
		};
		//检索
		function searchExamChart(){
			top.jzts();
			$("#examRecordChartForm").submit();
		};
		//检索
		function search(){
			top.jzts();
			$("#officeInitForm").submit();
		}
		$(function(){
			//日期框
			$('.date-picker').datepicker();
		});
		</script>
		
	</body>
</html>

