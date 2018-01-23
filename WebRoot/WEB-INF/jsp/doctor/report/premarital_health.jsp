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
	<script type="text/javascript" src="static/layer/layer.js"></script>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
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
		.big_box h1{ width:3324px;font-size:24px; font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
		/*表格*/
		.biaoge{ width:3324px; border: 1px solid #000000; text-align:center;}
		.biaoge tr{ height:42px;}
		.biaoge td{ border: 1px solid #000000; width:67px;}
		.biaoge .width100{ width:100px;}
		.biaoge .name{ width:100px;}
		.zijianju{ letter-spacing:8px;}
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
				<form action="report/premaritalHealth" method="post">
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
					<h1>婚前保健情况（${time}）年报表</h1>
					<table class="biaoge" cellspacing="0">
						<tr>
							<td rowspan="4" class="width100">县（市、区）名称</td>
							<td rowspan="3" colspan="2">结婚登记人数</td>
							<td rowspan="3" colspan="2">婚前卫生咨询人数</td>
							<td rowspan="3" colspan="2">婚前医学检查人数</td>
							<td colspan="14" class="zijianju">婚检检出疾病分类情况</td>
							<td rowspan="3" colspan="2">对影响婚育疾病的医学指导意见人数</td>
							<td rowspan="4">已妊娠人数</td>
							<td colspan="5">地中海贫血筛查</td>
							<td colspan="4">HIV检查</td>
							<td colspan="4">梅毒检查</td>
							<td colspan="4">乙肝表面抗原检查</td>
							<td colspan="4">淋病检查</td>
							<td colspan="4">女性滴虫、霉菌检查</td>
						</tr>

						<tr>
							<td colspan="2" rowspan="2">总人数</td>
							<td colspan="4">指定传染病</td>
							<td rowspan="2" colspan="2">严重遗传性疾病人数</td>
							<td rowspan="2" colspan="2">有关精神病人数</td>
							<td rowspan="2" colspan="2">生殖系统疾病人数</td>
							<td rowspan="2" colspan="2">内科系统疾病人数</td>
							<td rowspan="2" colspan="2">筛查人数</td>
							<td rowspan="2" colspan="2">阳性人数</td>
							<td rowspan="3">双方阳性人数</td>
							<td rowspan="2" colspan="2">筛查人数</td>
							<td rowspan="2" colspan="2">感染人数</td>
							<td rowspan="2" colspan="2">检查人数</td>
							<td rowspan="2" colspan="2">感染人数</td>
							<td rowspan="2" colspan="2">检查人数</td>
							<td rowspan="2" colspan="2">阳性人数</td>
							<td rowspan="2" colspan="2">检查人数</td>
							<td rowspan="2" colspan="2">阳性人数</td>
							<td rowspan="2" colspan="2">滴虫</td>
							<td rowspan="2" colspan="2">霉菌</td>
						</tr>

						<tr>
							<td colspan="2">人数</td>
							<td colspan="2">其中性传播疾病人数</td>
						</tr>

						<tr>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>男</td>
							<td>女</td>
							<td>检查人数</td>
							<td>阳性人数</td>
							<td>检查人数</td>
							<td>阳性人数</td>
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
							<td>${r.registerman}</td>
							<td>${r.registerwoman}</td>
							<td>${r.consultationman}</td>
							<td>${r.consultationwoman}</td>
							
							<td>${r.examinationman}</td>
							<td>${r.examinationwoman}</td>
							<td>${r.patientman}</td>
							<td>${r.patientwoman}</td>
							<td>${r.infectiousman}</td>
							
							<td>${r.infectiouswoman}</td>
							<td>${r.stdman}</td>
							<td>${r.stdwoman}</td>
							<td>${r.geneticman}</td>
							<td>${r.geneticwoman}</td>
							
							<td>${r.psychosisman}</td>
							<td>${r.psychosiswoman}</td>
							<td>${r.reproductiveman}</td>
							<td>${r.reproductivewoman}</td>
							<td>${r.internalman}</td>
							
							<td>${r.internawoman}</td>
							<td>${r.instructionman}</td>
							<td>${r.instructionwoman}</td>
							<td>${r.pregnancetotal}</td>
							<td>${r.thalassemiaexaminationman}</td>
							
							<td>${r.thalassemiaexaminationwoman}</td>
							<td>${r.thalassemiapositiveman}</td>
							<td>${r.thalassemiapositivewoman}</td>
							<td>${r.thalassemiapositivecouple}</td>
							<td>${r.hivexaminationman}</td>
							
							<td>${r.hivexaminationwoman}</td>
							<td>${r.hivinfectionman}</td>
							<td>${r.hivinfectionwoman}</td>
							<td>${r.syphilisexaminationman}</td>
							<td>${r.syphilisexaminationwoman}</td>
							
							<td>${r.syphilisinfectionman}</td>
							<td>${r.syphilisinfectionwoman}</td>
							<td>${r.hbsagexaminationman}</td>
							<td>${r.hbsagexaminationwomen}</td>
							<td>${r.hbsagpositiveman}</td>
							
							<td>${r.hbsagpositivewoman}</td>
							<td>${r.gonorrhoeaexaminationman}</td>
							<td>${r.gonorrhoeaexaminationwoman}</td>
							<td>${r.gonorrhoeapositiveman}</td>
							<td>${r.gonorrhoeapositivewoman}</td>
							
							<td>${r.trichomonadexamination}</td>
							<td>${r.trichomonadpositive}</td>
							<td>${r.mildewexamination}</td>
							<td>${r.mildewpositive}</td>
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
				var actionUrl = 'report/upload/premaritalHealth';
				var downloadUrl = 'uploadFiles/file/premarital_health.xlsx';
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