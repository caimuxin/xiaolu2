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
		.big_box h1{ width:1662px;font-size:24px; font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
		/*表格*/
		.biaoge{ width:1662px; border: 1px solid #000000; text-align:center;}
		.biaoge tr{ height:42px;}
		.biaoge td{ border: 1px solid #000000; width:45px;}
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
				<form action="report/preschoolsManagement" method="post">
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
					<h1>托幼机构卫生保健管理情况（${time}）年报表</h1>
					<table class="biaoge" cellspacing="0">
						<tr>
							<td rowspan="4" class="name">县（市、区）名称</td>
							<td colspan="4" rowspan="2">托幼机构数</td>
							<td rowspan="4">全托机构数</td>
							<td rowspan="4">日托机构数</td>
							<td rowspan="4">公立托幼机构数</td>
							<td colspan="4" rowspan="2">托幼机构规模</td>
							<td colspan="2">在园儿童数</td>
							<td colspan="2">入园体检</td>
							<td colspan="11">在园儿童体验</td>
							<td rowspan="4">托幼机构卫生管理数</td>
							<td colspan="2" rowspan="2">有卫生室(保健室)</td>
							<td rowspan="4">获得卫生保健合格证的托幼机构数</td>
							<td colspan="5">保健人员数</td>
						</tr>
						<tr>
							<td rowspan="3">总数</td>
							<td rowspan="3">其中＜3岁儿童数</td>
							<td rowspan="3">新入院儿童数</td>
							<td rowspan="3">体检儿童数</td>
							<td rowspan="3">应体检人数</td>
							<td rowspan="3">实际体检人数</td>
							<td colspan="9">在园儿童体检中：</td>
							<td rowspan="3">保健医师</td>
							<td rowspan="3">护士</td>
							<td rowspan="3">短期培训上岗人数</td>
							<td rowspan="3">专职</td>
							<td rowspan="3">兼职</td>
						</tr>
						<tr>
							<td rowspan="2">总数</td>
							<td colspan="3">其中</td>
							<td rowspan="2">大型</td>
							<td rowspan="2">中型</td>
							<td rowspan="2">小型</td>
							<td rowspan="2">小小型</td>
							<td rowspan="2">血红蛋白检测人数</td>
							<td rowspan="2">血红蛋白＜110克/升</td>
							<td rowspan="2">血红蛋白＜90克/升</td>
							<td rowspan="2">龋齿</td>
							<td rowspan="2">视力正常</td>
							<td rowspan="2">体重＜中位数-2SD人数</td>
							<td rowspan="2">身高（长）＜中位数-2SD人数</td>
							<td rowspan="2">身高（长）别体重＞中位数+1SD人数</td>
							<td rowspan="2">身高（长）别体重＞中位数+2SD人数</td>
							<td rowspan="2">总数</td>
							<td rowspan="2">有医疗机构执业许可的机构数</td>
						</tr>
						<tr>
							<td>县（市）级</td>
							<td>城区</td>
							<td>乡、村级</td>
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
							<td>${r.preschoolstotal}</td>
							<td>${r.citylevel}</td>
							<td>${r.arealevel}</td>
							<td>${r.countrylevel}</td>
							
							<td>${r.complete}</td>
							<td>${r.daytime}</td>
							<td>${r.get("public")}</td>
							<td>${r.large}</td>
							<td>${r.middle}</td>
							
							<td>${r.small}</td>
							<td>${r.extrasmall}</td>
							<td>${r.atschool}</td>
							<td>${r.atschoollt3}</td>
							<td>${r.newexamination}</td>
							
							<td>${r.schoolexamination}</td>
							<td>${r.predictedexamination}</td>
							<td>${r.actualexamination}</td>
							<td>${r.hemoglobin}</td>
							<td>${r.hemoglobinlt110}</td>
							
							<td>${r.hemoglobinlt90}</td>
							<td>${r.dentalcaries}</td>
							<td>${r.normaleyesight}</td>
							<td>${r.weightlt2sd}</td>
							<td>${r.heightlt2sd}</td>
							
							<td>${r.heightweightgt1sd}</td>
							<td>${r.heightweightgt2sd}</td>
							<td>${r.healthmanagement}</td>
							<td>${r.healthroom}</td>
							<td>${r.healthlicence}</td>
							
							<td>${r.healthcertificate}</td>
							<td>${r.doctor}</td>
							<td>${r.nurse}</td>
							<td>${r.train}</td>
							<td>${r.fulltime}</td>
							
							<td>${r.parttime}</td>
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
				var actionUrl = 'report/upload/preschoolsManagement';
				var downloadUrl = 'uploadFiles/file/preschools_management.xlsx';
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