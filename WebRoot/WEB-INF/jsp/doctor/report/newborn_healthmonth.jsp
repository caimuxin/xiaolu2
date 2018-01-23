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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.zh-CN.min.js"></script><!-- 日期框 -->
	<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css" /><!-- 日期框 -->
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="static/layer/layer.js"></script>
	
	<style>
	*{ font-size:14px; color:#595959; font-family:"宋体";}
	ul,li{ list-style:none; margin:0; padding:0;}
	h1{padding:0; margin:0;font-weight: bold;}
	.clearfix{ clear:both;}
	input{ margin:0; padding:0; border:none;}
	/*选择*/
	.xuanze_box li{ float:left;}
	.big_box h1{ width:1662px;font-size:24px; text-align:center; padding-top:20px; padding-bottom:20px;}
	.xuanze_box .chose{width:97px;padding-left:10px;margin-right:10px;}
	/*表格*/
	.biaoge04{ width:1662px; border: 1px solid #000000; text-align:center;}
	.biaoge04 td{ border: 1px solid #000000; width:56px; height:42px;}
	.biaoge04 .name{ width:100px;}
		
	/* 导入： */
	.but2{width:60px;line-height:30px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/daoru.png);background-repeat:no-repeat;background-position:center; margin-left:10px;}
	.but2:hover{background-image:url(static/img/daoru-hover.png); background-repeat:no-repeat; background-position:center;}
	
	
	/* 打印 */
	.but{width:60px; line-height:30px; margin-left:10px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/dayin.png);background-repeat:no-repeat;background-position:center;}
	.but:hover{background-image:url(static/img/dayin-hover.png); background-repeat:no-repeat; background-position:center;}
	</style>
	</head>
<body>
		
<div class="container-fluid" id="main-container">

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<form action="report/healthmonthlist.do" method="post" name="userInfoForm" id="userInfoForm">
			<div class="big_box">
	    	<div class="xuanze_box">
	            <ul>
	            	<li>
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
	                <div class="clearfix"></div>
	            </ul>
	        </div>
	        <h1>5岁以下儿童保健情况（${pd.conDt}）月报表</h1>
	        <table class="biaoge04" cellspacing="0" >
	        	<tr>
	            	<td rowspan="3" class="name">县（市、区）名称</td>
	                <td rowspan="3">3岁以下儿童数<br></td>
	                <td colspan="8">5岁以下儿童</td>
	                <td colspan="8">3岁以下儿童</td>
	            </tr>
	            
	            <tr>
	                <td colspan="5">身高（长）体重检查</td>
	                <td colspan="3">血红蛋白检查</td>
	                <td colspan="5">身高（长）体重检查</td>
	                <td colspan="3">血红蛋白检查</td>
	            </tr>
	            
	            <tr>
	                <td>实查人数<br></td>
	                <td>体重＜中位数—2SD人数<br></td>
	                <td>身高（长）＜中位数—2SD人数<br></td>
	                <td>身高（长）别体重＞中位数+1SD人数<br></td>
	                <td>身高（长）别体重＞中位数+2SD人数<br></td>
	                <td>实查人数<br></td>
	                <td>血红蛋白＜110克/升<br></td>
	                <td>血红蛋白＜90克/升<br></td>
	                <td>实查人数<br></td>
	                <td>体重＜中位数—2SD人数<br></td>
	                <td>身高（长）＜中位数—2SD人数<br></td>
	                <td>身高（长）别体重＞中位数+1SD人数<br></td>
	                <td>身高（长）别体重＞中位数+2SD人数<br></td>
	                <td>实查人数<br></td>
	                <td>血红蛋白＜110克/升<br></td>
	                <td>血红蛋白＜90克/升<br></td>
	            </tr>
	            <c:choose>
	            <c:when test="${not empty hmList && not empty pd}">
	            <c:forEach items="${hmList}" var="hm">
	            <tr>
	            	<td>${hm.counties }</td>
	            	<td>${hm.underage }</td>
	            	<td>${hm.fstaturenum }</td>
	            	<td>${hm.fweightlt }</td>
	            	<td>${hm.fheightlt }</td>
	            	<td>${hm.fheightgt }</td>
	            	<td>${hm.fheightgts}</td>
	            	<td>${hm.fhemoglobinnum }</td>
	            	<td>${hm.fhemoglobinlt }</td>
	            	<td>${hm.fhemoglobinlts }</td>
	            	<td>${hm.staturenum }</td>
	            	<td>${hm.weightlt }</td>
	            	<td>${hm.heightlt }</td>
	            	<td>${hm.heightgt }</td>
	            	<td>${hm.heightgts }</td>
	            	<td>${hm.hemoglobinnum }</td>
	            	<td>${hm.hemoglobinlt }</td>
	            	<td>${hm.hemoglobinlts }</td>
	            </tr> 
				</c:forEach>
				</c:when>
				
	            <c:otherwise>
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
	            </c:otherwise>
	            </c:choose> 
	        </table>
			<c:if test="${not empty hmList && not empty pd}">
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
 
 
 
 
  </div>
</div>
</div>
		
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
				var actionUrl = 'report/upload/insertHealthMonth';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=HealthMonth';
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

