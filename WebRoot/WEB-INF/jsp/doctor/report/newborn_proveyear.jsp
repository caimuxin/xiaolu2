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
	<!-- jsp文件头和头部 -->
	
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
	h1{padding:0; margin:0; font-weight: bolder;}
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
		<form action="report/proveyearlist.do" method="post" name="userInfoForm" id="userInfoForm">
			<div class="big_box">
	    	<div class="xuanze_box">
	            <ul>
	            	<li>
						<input type="text" name="conDt" value="${pd.conDt}" placeholder="选择年份" class="chose datepicker">
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
	        <h1>《出生医学证明》管理使用情况（${pd.conDt}）年度统计</h1>
	        <table class="biaoge04" cellspacing="0" >
	        	<tr>
	            	<td rowspan="4" class="name">县（市、区）名称</td>
	                <td rowspan="4">上一年底库存数</td>
	                <td rowspan="4">当年申领数</td>
	                <td colspan="13">当年使用情况</td>
	                <td rowspan="4">当年年底库存数</td>
	                <td rowspan="4">当年医疗保健机构内活产数</td>
	            </tr>
	            
	            <tr>
	                <td colspan="5">医疗保健机构内出生的签发数</td>
	                <td colspan="3" rowspan="2">医疗保健机构外出生的签发数</td>
	                <td colspan="4" rowspan="2">废证数</td>
	                
	                <td rowspan="3">合计</td>
	            </tr>
	            
	            <tr>
	                <td colspan="2">首次签发数</td>
	                <td rowspan="2">换发数</td>
	                <td rowspan="2">补发数</td>
	                <td rowspan="2">小计</td>
	            </tr>
	                     
	            <tr>
	            	<td>当年出生签发数</td>
	            	<td>历史出生签发数</td>
	            	<td>家庭接生员接生的签发数</td>
	            	<td>其他情况的签发数</td>
	            	<td>小计</td>
	            	<td>因打印或填写错误数</td>
	            	<td>遗失数</td>
	            	<td>其他原因数</td>
	            	<td>小计</td>
	            </tr>
	            <c:choose>
	            <c:when test="${not empty pyList && not empty pd}">
	            <c:forEach items="${pyList}" var="py">
	            <tr>
	            	<td>${py.counties}</td>
	            	<td>${py.lastyearnum}</td>
	            	<td>${py.thisyearnum}</td>
	            	<td>${py.lastsign}</td>
	            	<td>${py.thissign}</td>
	            	<td>${py.change}</td>
	            	<td>${py.reissue}</td>
	            	<td>${py.signsubtotal}</td>
	            	<td>${py.deliversign}</td>
	            	<td>${py.elsesign}</td>
	            	<td>${py.onsubtotal}</td>
	            	<td>${py.wrong}</td>
	            	<td>${py.losenum}</td>
	            	<td>${py.uncommon}</td>
	            	<td>${py.abandonnum}</td>
	            	<td>${py.provesum}</td>
	            	<td>${py.thisyearstock}</td>
	            	<td>${py.ivebirth}</td>
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
	           	</tr> 
	          </c:otherwise>
	          </c:choose>
	        </table>
	        <c:if test="${not empty pyList && not empty pd}">
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
				var actionUrl = 'report/upload/insertProveYear';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=ProveYear';
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

