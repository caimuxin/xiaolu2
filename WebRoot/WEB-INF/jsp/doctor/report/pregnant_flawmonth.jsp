﻿﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="static/xiaolu/css/baobiao.css" /> 
	
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.zh-CN.min.js"></script><!-- 日期框 -->
	<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css" /><!-- 日期框 -->
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="static/layer/layer.js"></script>
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<form action="report/flawmonthlist.do" method="post" name="userInfoForm" id="userInfoForm">
			<div class="big_box">
			   	  <div class="xuanze_box">
			            <ul>
							<li style="margin-left: -25px;">
								<input type="text" name="conDt" class="chose datepicker" placeholder="选择月份" value="${pd.conDt}">
							</li>
							
							<li>
							<select  name="choosearea" id="choosearea" data-placeholder="选择地区" style="vertical-align:top;width: 120px;">
								<option value="">市级</option>
								<option value="">县/区/镇级</option>
								<option value="">基层</option>
							 </select>
							</li>
							<li>
		                	<input type="button" id="print" class="but" style="width: 60px;">
			                </li>
			                <li>
			                <input type="button" id="upload" class="but2" style="width: 60px;">
			                </li>
				            <div class="clearfix"></div>
			            </ul>
			            <div class="clearfix"></div>
			        </div>
			    	<h1>出生缺陷发生情况(${pd.conDt})月报表</h1>
			    	<table class="biaoge" cellspacing="0" >
			        	<tr>
			            	<td class="td_left" rowspan="2">县（市、区）名称</td>
			              	
			                <td rowspan="2">住院分娩围产儿数 </td>
			                <td colspan="2">出生缺陷儿数</td>
			               	<td colspan="11">≥28周出生缺陷儿主要的出生缺陷诊断</td>
			                <td colspan="2">诊断为缺陷后治疗性引产数</td>
			                <td colspan="2">≥28周出生缺陷儿畸形确诊时间</td>
			                <td colspan="4">≥28周出生缺陷儿转归</td>
			          </tr>
			
			            
			            <tr>
			                <td>≥28周</td>
			                <td>＜28周</td>
			                <td>无脑畸形</td>
			                <td>脊柱裂</td>
			                <td>脑膨出</td>
			                <td>先天性脑积水</td>
			                <td>腭裂</td>
			                <td>唇裂</td>
			                <td>唇裂合并腭裂</td>
			                <td>唐氏综合征</td>
			                <td>先天性心脏病</td>
			                <td>胎儿水肿综合征</td>
			                <td>其他</td>
			                <td>≥28周</td>
			                <td>＜28周</td>
			                <td>产前</td>
			                <td>产后7天</td>
			                <td>活产</td>
			              <td>死胎</td>
			                <td>死产</td>
			                <td>七天内死亡</td>
			            </tr>
			       <c:if test="${not empty pd && not empty fmList}">
			       <c:forEach items="${fmList}" var="fm">
			        	<tr>
			            	<td class="td_left" >${fm.fmcounties}</td>
			                <td>${fm.fmdelivery}</td>
			                <td>${fm.fmflawgtday}</td>
			                <td>${fm.fmflawltday}</td>
			                <td>${fm.fmmalformation}</td>
			                <td>${fm.fmrachischisis}</td>
			                <td>${fm.fmharns}</td>
			                <td>${fm.fmponding}</td>
			                <td>${fm.fmcleftpalate}</td>
			                <td>${fm.fmharelip}</td>
			                
			            	<td>${fm.fmcleftpalateharelip}</td>
			                <td>${fm.fmsyndrome}</td>
			                <td>${fm.fmcardiopathy}</td>
			                <td>${fm.fmedema}</td>
			                <td>${fm.fmother}</td>
			                <td>${fm.fmgtcure}</td>
			                <td>${fm.fmltcure}</td>
			                <td>${fm.fmantenatal}</td>
			                <td>${fm.fmpostpartum}</td>
			                <td>${fm.fmlivebirth}</td>
			                
			            	<td>${fm.fmdeadfetus}</td>
			                <td>${fm.fmstillbirth}</td>
			                <td>${fm.fmpostpartumday}</td>
			          	</tr>
			      </c:forEach>
			      </c:if>
			      
			      
			      
				    <c:if test="${empty pd || empty fmList}">
				    <tr>
				            	<td class="td_left" >-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				                
				                <td>-</td>
				                <td>-</td>
				                <td>-</td>
				     </tr>
				    </c:if>
			      </table>
			        <c:if test="${not empty pd && not empty fmList}">
				    <div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
					</div>
					</c:if>
			    </div>

		</form>


	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		
		<script type="text/javascript">
		
		$(function() {
			//日期框
			$('.datepicker').datepicker({
				format: 'yyyy-mm',
				startView: 1,
				minViewMode: 1,//月
				language: 'zh-CN'
			});
			
			
			$('[name=conDt]').datepicker().on('changeDate', function(e) {
				$('form').submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			
			
			$('#upload').click(function() {
				var actionUrl = 'report/upload/insertFlawmonth';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=FlawMonth';
				var url = '<%=basePath%>report/upload?action=' + actionUrl + '&url=' + downloadUrl;
				layer.open({
					  type: 2,
					  title: 'EXCEL 导入到数据库',
					  shadeClose: true,
					  skin: 'layui-layer-lan',
					  shade: 0.2,
					  area: ['480px', '320px'],
					  content: url,
					  end: function() {
						  //窗口销毁后的回调
						  self.frameElement.contentWindow.location.reload(); 
					  }
				}); 
			});
		});
		
		
		$(function(){
			$(top.hangge());
		});
		</script>
	</body>
</html>

