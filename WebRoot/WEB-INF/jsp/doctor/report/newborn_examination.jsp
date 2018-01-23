<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<script type="text/javascript" src="static/layer/layer.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.zh-CN.min.js"></script><!-- 日期框 -->
	<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css" /><!-- 日期框 -->
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<style>
		*{ font-size:14px; color:#595959; font-family:"宋体";}
		ul,li{ list-style:none; margin:0; padding:0;}
		h1{padding:0; margin:0;}
		.clearfix{ clear:both;}
		.text_left{ text-align:left;}
		/*选择*/
		.xuanze_box li{ float:left;}
		.big_box h1{ width:1600px;font-size:24px; font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
		/*表格*/
		.biaoge{ width:1600px; border: 1px solid #000000; text-align:center;}
		.biaoge tr{ height:42px;}
		.biaoge td{ border: 1px solid #000000; width:56px;}
		.biaoge1 .name{ width:100px;}
		.chose{ padding-left:10px; margin-right:10px; width:100px;}
		
		.but2{width:60px;line-height:32px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/daoru.png);background-repeat:no-repeat;background-position:center; margin-left:10px;}
		.but2:hover{background-image:url(static/img/daoru-hover.png); background-repeat:no-repeat; background-position:center;}

		.but{width:60px; line-height:32px; margin-left:10px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/dayin.png);background-repeat:no-repeat;background-position:center;}
		.but:hover{background-image:url(static/img/dayin-hover.png); background-repeat:no-repeat; background-position:center;}
	</style>
</head>
<body style="background:white;">
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<c:if test="${type == 'y'}">
				<form action="report/newbornExamination_y" method="post">
				</c:if>
				<c:if test="${type == 'm'}">
				<form action="report/newbornExamination_m" method="post">
				</c:if>
				<!-- 表格开始 -->
				<div class="big_box">
					<div class="xuanze_box no-print">
						<ul>
							<li><input type="text" name="time" class="chose input-small datepicker" placeholder="请选<c:if test="${type == 'y'}">年份</c:if><c:if test="${type == 'm'}">月份</c:if>" value="${time}"></li>
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
					</div>
					<c:if test="${type == 'y'}">
					<h1>新生儿疾病筛查情况（${time}）年报表</h1>
					</c:if>
					<c:if test="${type == 'm'}">
					<h1>新生儿疾病筛查情况（${time}）月报表</h1>
					</c:if>
					<table class="biaoge" cellspacing="0">
						<tr>
							<td rowspan="4" class="name">县（市、区）名称</td>
							<td colspan="16" style="letter-spacing: 8px">新生儿疾病实验室筛查</td>
							<td colspan="7">新生儿听力筛查（四）</td>
						</tr>

						<tr>
							<td colspan="7">苯丙酮尿症</td>
							<td colspan="7">先天性甲低</td>
							<td colspan="2">G-6PD缺乏</td>
							<td rowspan="3">初筛人数</td>
							<td rowspan="3">初筛阳性人数</td>
							<td rowspan="3">复筛人数</td>
							<td rowspan="3">复筛阳性人数</td>
							<td rowspan="3">诊断人数</td>
							<td rowspan="3">确诊阳性人数</td>
							<td rowspan="3">治疗人数</td>
						</tr>

						<tr class="box">
							<td rowspan="2">筛查人数</td>
							<td rowspan="2">筛查阳性人数</td>
							<td rowspan="2">诊断人数</td>
							<td colspan="2">经典型PKU</td>
							<td colspan="2">除经典型外的高苯丙氨酸血</td>
							<td rowspan="2">筛查人数</td>
							<td rowspan="2">筛查阳性人数</td>
							<td rowspan="2">诊断人数</td>
							<td colspan="2">甲低</td>
							<td colspan="2">高TSH</td>
							<td rowspan="2">筛查人数</td>
							<td rowspan="2">筛查阳性人数</td>
						</tr>

						<tr>
							<td>确诊人数</td>
							<td>治疗人数</td>
							<td>确诊人数</td>
							<td>治疗人数</td>
							<td>确诊人数</td>
							<td>治疗人数</td>
							<td>确诊人数</td>
							<td>治疗人数</td>
						</tr>
						<c:if test="${empty list}">
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
							<td>-</td>
						</tr>
						</c:if>
						<c:forEach items="${list}" var="r">
						<tr>
							<td>${r.city}</td>
							<td>${r.pkuexamination}</td>
							<td>${r.pkupositive}</td>
							<td>${r.pkudiagnosis}</td>
							<td>${r.classicalpkudiagnose}</td>
							
							<td>${r.classicalpkucure}</td>
							<td>${r.phenylalaninediagnose}</td>
							<td>${r.phenylalaninecure}</td>
							<td>${r.hypothyroidismexamination}</td>
							<td>${r.hypothyroidismpositive}</td>
							
							<td>${r.hypothyroidismdiagnosis}</td>
							<td>${r.hypothyroidismdiagnose}</td>
							<td>${r.hypothyroidismcure}</td>
							<td>${r.tshdiagnose}</td>
							<td>${r.tshcure}</td>
							
							<td>${r.g6pdexamination}</td>
							<td>${r.g6pdpositive}</td>
							<td>${r.hearpreliminary}</td>
							<td>${r.hearpreliminarypositive}</td>
							<td>${r.hearreview}</td>
							
							<td>${r.hearreviewpositive}</td>
							<td>${r.heardiagnosis}</td>
							<td>${r.hearpositive}</td>
							<td>${r.hearcure}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 表格结束 -->
				<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".datepicker").datepicker({
				<c:if test="${type == 'y'}">
				format: 'yyyy',
				startView: 2,
				minViewMode: 2,//年
				</c:if>
				<c:if test="${type == 'm'}">
				format: 'yyyy-mm',
				startView: 1,
				minViewMode: 1,//月
				</c:if>
				todayHighlight: true,
				autoclose: true,
				language: 'zh-CN'
			});
			$('[name=time]').datepicker().on('changeDate', function(e) {
				$('form').submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			//打开上传excel页面
			$('#upload').click(function() {
				var actionUrl = 'report/upload/newbornExamination_${type}';
				var downloadUrl = 'uploadFiles/file/newborn_examination_${type}.xlsx';
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
		$(function() {
			top.hangge();
		});
	</script>
</body>
</html>