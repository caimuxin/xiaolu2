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
		<form action="report/childbirthyearlist.do" method="post" name="userInfoForm" id="userInfoForm">
			<div class="big_box">
		  	  <div class="xuanze_box">
		          <ul>
		           	 <li style="margin-left: -25px;">
						 <input type="text" name="conDt" class="chose datepicker" value="${pd.conDt}" placeholder="选择年份">
					 </li>
					<li>
					<select  name="choosearea" id="choosearea" data-placeholder="选择地区" style="vertical-align:top;width: 120px;">
						<option value="">市级</option>
						<option value="">县/区/镇级</option>
						<option value="">基层</option>
					 </select>
					</li>
           	 		<li>
                	<input type="button" id="print" class="but" style="width: 60px;" >
                </li>
                <li>
                <input type="button" id="upload" class="but2" style="width: 60px;">
                </li>
		               <div class="clearfix"></div>
		           </ul>
		           <div class="clearfix"></div>
		       </div>
		   	<h1>接产机构分娩情况(${pd.conDt})年报表</h1>
		   	<table class="biaoge" cellspacing="0" >
		       	<tr>
		           	<td class="td_left" rowspan="2">县（市、区）名称</td>
		               <td rowspan="2">住院分产妇数 </td>
		               <td rowspan="2">高危产妇数 </td>
		               <td rowspan="2">阴道自然分娩数 </td>
		               <td colspan="6">阴道助产数</td>
		              	<td colspan="3">剖宫产产妇数</td>
		               <td colspan="4">活产数</td>
		               <td rowspan="2">刨宫产活产数 </td>
		               <td rowspan="2">死胎数 </td>
		               <td rowspan="2">死产数 </td>
		             
		         </tr>
		
		           
		           <tr>
		               <td>总数</td>
		               <td>胎头吸引术</td>
		               <td>臀位助产</td>
		               <td>臀牵引术</td>
		               <td>产钳术</td>
		               <td>其它</td>
		               <td>总数</td>
		               <td>医学指征刨宫产产妇数</td>
		               <td>医学指征刨宫产产妇数</td>
		               <td>合计</td>
		               <td>男</td>
		               <td>女</td>
		               <td>性别不明</td>
		               
		           </tr>
		      
		      
		      <c:choose>
		      <c:when test="${not empty pd && not empty cyList}">
		      <c:forEach items="${cyList}" var="cy">
		       	<tr>
		           	<td class="td_left" >${cy.cycounties}</td>
		               <td>${cy.cychildbirthsum}</td>
		               <td>${cy.cyhighrisk}</td>
		               <td>${cy.cynature}</td>
		               <td>${cy.cyvaginasum}</td>
		               <td>${cy.cyfetalhead}</td>
		               <td>${cy.cyhaunch}</td>
		               <td>${cy.cyhiptraction}</td>
		               <td>${cy.cyforceps}</td>
		               <td>${cy.cyother}</td>
		               
		           	<td>${cy.cycesareansum}</td>
		               <td>${cy.cymedicine}</td>
		               <td>${cy.cynomedicine}</td>
		               <td>${cy.cylivebirthsum}</td>
		               <td>${cy.cyboy}</td>
		               <td>${cy.cygirl}</td>
		               <td>${cy.cyunknown}</td>
		               <td>${cy.cylivebirth}</td>
		               <td>${cy.cystillbirths}</td>
		               <td>${cy.cystillbirth}</td>
		         </tr>
		       </c:forEach>
		       </c:when>
		       
		       <c:otherwise>
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
		         </tr>
		       </c:otherwise>
		      </c:choose>
		     </table>
		     <c:if test="${not empty pd && not empty cyList}">
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
			$('.chose').datepicker({
				format:'yyyy',
				autoclose:true,
				startView: 2,
				maxViewMode:2,
				minViewMode:2
			});
			
			$('[name=conDt]').datepicker().on('changeDate', function(e) {
				$('form').submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			
			$('#upload').click(function() {
				var actionUrl = 'report/upload/insertChildbirthyear';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=ChildbirthYear';
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
			top.hangge();
		});
		</script>
		
		
	</body>
</html>

