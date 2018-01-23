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
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="static/layer/layer.js"></script>
	<style>
	
	*{ font-size:14px; color:#595959; font-family:"宋体";}
	.clearfix{ clear:both;}
	h1{ margin:0; padding:0;}
	ul,li{ list-style:none; margin:0; padding:0;}
	
	.xuanze li{ float:left;}
	.biaos{ width:1662px; border: 1px solid #000000; text-align:center;}
	.biaos td{ width:110px; height:42px; border: 1px solid #000000; text-align:center;}
	.biaoti{ width:1662px;font-size:24px;  font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
	.width100{ width:100px;}
	.xuanze .chose{  padding-left:10px; margin-right:10px; width:100px;}
	
	.but2{width:60px;line-height:32px; margin-left:10px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/daoru.png);background-repeat:no-repeat;background-position:center; margin-left:10px;}
	.but2:hover{background-image:url(static/img/daoru-hover.png); background-repeat:no-repeat; background-position:center;}

	.but{width:60px; line-height:32px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/dayin.png);background-repeat:no-repeat;background-position:center;}
	.but:hover{background-image:url(static/img/dayin-hover.png); background-repeat:no-repeat; background-position:center;}
	</style>
	</head> 
	
<body>
		
<div class="container-fluid" id="main-container">

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
		<form action="report/gynecologicalDisease.do" method="post" name="phForm" id="phForm">	
		<div class="xuanze no-print">
			<ul>
				<li><input class="chose" name="searchDate" id="searchDate"  value="${pd.searchDate}" type="text" placeholder="选择年份" title="某年"/></li>
				<li >
					<select  name="choosearea" id="choosearea" data-placeholder="选择地区" style="vertical-align:top;width: 120px;">
						<option value="">市级</option>
						<option value="">县/区/镇级</option>
						<option value="">基层</option>
					 </select>
				</li>
				<li><button type="button" id="print" class="but" style="height:30px;"></button></li>
				<li><button type="button" id="upload" class="but2" style="height:30px;"></button></li>
		       	<div class="clearfix"></div>
		    </ul>
		    <div class="clearfix"></div>	
		</div>
		
		<h1 class="biaoti">妇女常见病筛查情况(${pd.titleYear })年报表</h1>
		
		<table cellspacing="0" class="biaos">
			<tr>
				<td class="width100">县(市、区)名称</td>
				<td>20~64岁妇女人数</td>
				<td>应查人数</td>
				<td>实查人数</td>
				<td>宫颈癌筛查人数</td>
				<td>乳腺癌筛查人数</td>
				<td>查出妇女常见病患病总人数</td>
				<td>阴道炎患病人数</td>
				<td>宫颈炎患病人数</td>
				<td>尖锐湿疣患病人数</td>
				<td>子宫肌瘤患病人数</td>
				<td>宫颈癌患病人数</td>
				<td>宫颈癌死亡人数</td>
				<td>乳腺癌患病人数</td>
				<td>乳腺癌死亡人数</td>
			    <td>卵巢癌患病人数</td>
			</tr>
		<c:if test="${empty list  }">
			<tr>
			<td> - </td>
			<td> - </td>
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
		<c:forEach items="${list }" var="gd">
		
		<tr>
			<td> ${gd.area } </td>
			<td>${gd.number }</td>
		    <td>${gd.shouldcheck }</td>
		    <td>${gd.actualcheck }</td>
		    <td>${gd.cervicalcancerscreening }</td>
		    <td>${gd.breastcancerscreening }</td>
		    <td>${gd.commondisease }</td>
		    <td>${gd.coleitis }</td>
		    <td>${gd.cervicitis }</td>
		    <td>${gd.condyloma }</td>
		    <td>${gd.fibroid }</td>
		    <td>${gd.cervicalcancer }</td>
		    <td>${gd.cervicalcancerdead }</td>
		    <td>${gd.breastcancer }</td>
		    <td>${gd.breastcancerdead }</td>
		    <td>${gd.oophoroma }</td>
		   
		</tr>
		</c:forEach>
		</table>
		</form>	
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
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
		function search(){
			top.jzts();
			$("#phForm").submit();
		}
		
		</script>
		
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
			$('#searchDate').datepicker().on('changeDate', function(e) {
				$("#phForm").submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			//打开上传excel页面
			$('#upload').click(function() {
				var actionUrl = 'reportImportOne/gynecologicalDisease';
				var downloadUrl = 'reportImportOne/gynecologicalDiseaseExcel';
				var url = '<%=basePath%>report/upload?action=' + actionUrl + '&url=' + downloadUrl;
				layer.open({
					  type: 2,
					  title: 'EXCEL 导入到数据库',
					  shadeClose: true,
					  skin: 'layui-layer-lan',
					  shade: 0.2,
					  area: ['480px', '320px'],
					  content: url
				}); 
			});
		});
		
		
		
		
		
		</script>
		
	</body>
</html>

