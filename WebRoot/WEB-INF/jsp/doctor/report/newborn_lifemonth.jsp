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
		<form action="report/lifemonthlist.do" method="post" name="userInfoForm" id="userInfoForm">
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
					</li>	            	<li>
                		<input type="button" id="print" class="but" style="width: 60px;">
	                </li>
	                <li>
	                	<input type="button" id="upload" class="but2" style="width: 60px;">
	                </li>
	                <div class="clearfix"></div>
	                <div class="clearfix"></div>
	            </ul>
	        </div>
	        <h1>5岁以下儿童生命指标（${pd.conDt}）月报表</h1>
	        <table class="biaoge04" cellspacing="0" >
	        	<tr>
	            	<td rowspan="3" class="name">县（市、区）名称</td>
	                <td colspan="12" style="letter-spacing:8px">5岁以下儿童死亡情况</td>
	                <td colspan="8">围产儿情况</td>
	                <td rowspan="3">新生儿破伤风发病数<br></td>
	                <td rowspan="3">新生儿破伤风死亡数<br></td>
	            </tr>
	            
	            <tr>
	                <td colspan="4">5岁以下儿童死亡数</td>
	                <td colspan="4">婴儿死亡数</td>
	                <td colspan="4">新生儿死亡数</td>
	                <td rowspan="2">＜37周活产数</td>
	                <td rowspan="2">出生体重＜2500克人数</td>
	                <td rowspan="2">出生体重≥4000克人数</td>
	                <td rowspan="2">死胎死产数<br></td>
	                <td colspan="4">七天内死亡人数</td>
	            </tr>
	            
	            <tr>
	                <td>合计<br></td>
	                <td>男<br></td>
	                <td>女<br></td>
	                <td>性别不明<br></td>
	                <td>合计<br></td>
	                <td>男<br></td>
	                <td>女<br></td>
	                <td>性别不明<br></td>
	                <td>合计<br></td>
	                <td>男<br></td>
	                <td>女<br></td>
	                <td>性别不明<br></td>
	                <td>合计<br></td>
	                <td>男<br></td>
	                <td>女<br></td>
	                <td>性别不明<br></td>
	            </tr>
	            <c:choose>
	            <c:when test="${not empty lmList && not empty pd}">
	            <c:forEach items="${lmList}" var="lm">
	            <tr>
	            	<td>${lm.counties }</td>
	            	<td>${lm.fivenextsum }</td>
	            	<td>${lm.fivenextboy }</td>
	            	<td>${lm.fivenextgirl }</td>
	            	<td>${lm.fivenextno }</td>
	            	<td>${lm.babysum }</td>
	            	<td>${lm.babyboy }</td>
	            	<td>${lm.babygirl }</td>
	            	<td>${lm.babyno }</td>
	            	<td>${lm.newbornsum }</td>
	            	<td>${lm.newbornboy }</td>
	            	<td>${lm.newborngirl }</td>
	            	<td>${lm.newbornno }</td>
	            	<td>${lm.ltlivebirth }</td>
	            	<td>${lm.ltweight }</td>
	            	<td>${lm.gtweight }</td>
	            	<td>${lm.stillbirthnum }</td>
	            	<td>${lm.indaynum }</td>
	            	<td>${lm.indayboy }</td>
	            	<td>${lm.indaygirl }</td>
	            	<td>${lm.indayno }</td>
	            	<td>${lm.tetanus }</td>
	            	<td>${lm.tetanusdie }</td>
	            </tr>
	            </c:forEach>
	            </c:when>
	            
	            <c:otherwise>
		             <tr>
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
		            	<td>-</td>
		            </tr>
	            </c:otherwise>
	            </c:choose>       
	        </table>
	        <c:if test="${not empty lmList && not empty pd}">
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
				var actionUrl = 'report/upload/insertLifeMonth';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=LifeMonth';
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

