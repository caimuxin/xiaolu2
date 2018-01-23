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
		.biaoge .name{ width:100px;}
		
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
				<form action="report/prenatalDisgnosis" method="post">
				<!-- 表格开始 -->
				<div class="big_box">
					<div class="xuanze_box no-print">
						<ul>
							<li><input type="text" name="time" class="input-small datepicker chose" placeholder="选择年份" value="${time}"></li>
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
					<h1>产前诊断情况（${time}）年报表</h1>
					<table class="biaoge" cellspacing="0">
						<tr>
							<td rowspan="4" class="name">县（市、区）名称</td>
							<td colspan="9">实验室诊断</td>
							<td colspan="5">B超诊断</td>
							<td colspan="12">产前诊断确诊后随访干预情况</td>
						</tr>

						<tr>
							<td rowspan="3">诊断孕妇数</td>
							<td rowspan="3">确诊阳性总人数</td>
							<td colspan="5">染色体</td>
							<td colspan="2">地中海贫血</td>
							<td rowspan="3">诊断孕妇数</td>
							<td rowspan="3">确诊畸形总人数</td>
							<td rowspan="3">确诊神经管缺陷人数</td>
							<td rowspan="3">确诊心血管畸形人数</td>
							<td rowspan="3">确诊其他畸形人数</td>
							<td rowspan="3">干预总人数</td>
							<td rowspan="3">21三体</td>
							<td rowspan="3">18三体</td>
							<td rowspan="3">13三体</td>
							<td rowspan="3">其他染色体异常</td>
							<td rowspan="3">中度地中海贫血</td>
							<td rowspan="3">重度地中海贫血</td>
							<td rowspan="3">神经管缺陷</td>
							<td rowspan="3">心脏畸形</td>
							<td rowspan="3">其他畸形</td>
						</tr>

						<tr class="box">
							<td rowspan="2">实查人数</td>
							<td colspan="4">确诊阳性人数</td>
							<td rowspan="2">实查人数</td>
							<td rowspan="2">确诊阳性人数</td>
						</tr>
						<tr>
							<td>21三体</td>
							<td>18三体</td>
							<td>13三体</td>
							<td>其他异常</td>
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
							<td>-</td>
						</tr>
						</c:if>
						<c:forEach items="${list}" var="r">
						<tr>
							<td>${r.city}</td>
							<td>${r.labpregnancy}</td>
							<td>${r.labpositive}</td>
							<td>${r.chromosomeexamination}</td>
							<td>${r.trisomy21}</td>
							
							<td>${r.trisomy18}</td>
							<td>${r.trisomy13}</td>
							<td>${r.otherchromosomeabnormality}</td>
							<td>${r.thalassemiaexamination}</td>
							<td>${r.thalassemiapositive}</td>
							
							<td>${r.bultrasoundexamination}</td>
							<td>${r.malformation}</td>
							<td>${r.ntd}</td>
							<td>${r.cardiovascularmalformation}</td>
							<td>${r.othermalformation}</td>
							
							<td>${r.interventiontotal}</td>
							<td>${r.trisomy21intervention}</td>
							<td>${r.trisomy18intervention}</td>
							<td>${r.trisomy13intervention}</td>
							<td>${r.otherchromosomeintervention}</td>
						
							<td>${r.moderatethalassemiaintervention}</td>
							<td>${r.severethalassemiaintervention}</td>
							<td>${r.ntdintervention}</td>
							<td>${r.heartmalformationintervention}</td>
							<td>${r.othermalformationintervention}</td>
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
				format: 'yyyy',
				startView: 2,
				minViewMode: 2,//年
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
				var actionUrl = 'report/upload/prenatalDisgnosis';
				var downloadUrl = 'uploadFiles/file/prenatal_disgnosis.xlsx';
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