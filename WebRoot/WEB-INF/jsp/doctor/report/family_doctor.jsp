﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="static/xiaolu/css/baobiao.css" />

<script type="text/javascript" src="static/js/jquery.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<script type="text/javascript"
	src="static/js/bootstrap-datepicker.min.js"></script>
<!-- 日期框 -->
<script type="text/javascript"
	src="static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- 日期框 -->
<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css" />
<!-- 日期框 -->
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
					<form action="report/familyDoctor.do" method="post"
						name="userInfoForm" id="userInfoForm">
						<div class="big_box">
							<div class="xuanze_box">
								<ul>
									<li style="margin-left: -25px;">
										<input type="text" name="conDt" class="chose datepicker" value="${pd.conDt}" placeholder="选择月份">
									</li>
									<li>
										<select name="choosearea" id="choosearea"data-placeholder="选择地区" style="vertical-align: top; width: 120px;">
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

							<h1>家庭医生执行率</h1>


							<table class="biaoge" cellspacing="0">

								<tr>
									<td>所在医疗机构</td>
									<td>随访时间</td>
									<td>医生姓名</td>
									<td>医生职称</td>
									<td>随访事项</td>
									<td>本月应随访数量</td>
									<td>实际随访数量</td>
									<td>达标率 </td>
								</tr>

								<c:choose>
									<c:when test="${not empty pd && not empty fdList}">
										<c:forEach items="${fdList}" var="fd">
											<tr>
												<td>${fd.hospitalname}</td>
												<td>${fd.f_date }</td>
												<td>${fd.doctor_name }</td>
												<td>${fd.doctor_position }</td>
												<td>
													<c:if test="${fd.f_type == 'p'}">孕期随访</c:if>
													<c:if test="${fd.f_type == 'd'}">产后随访 </c:if>
													<c:if test="${fd.f_type == 'd_42'}">产后42天随访</c:if>
												</td>
												<td>${fd.should }</td>
												<td>${fd.actual }</td>
												<td>
													<c:if test="${fd.should == '0'}">0%</c:if> 
													<c:if test="${fd.should != '0'}"><fmt:formatNumber value="${fd.actual/fd.should*100}" type="NUMBER" maxFractionDigits="0"/>%</c:if>
												</td>
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
										</tr>
									</c:otherwise>
								</c:choose>

							</table>
							<c:if test="${not empty pd && not empty fdList}">
								<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
											<td style="vertical-align: top;">
												<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr} </div>
											</td>
										</tr>
									</table>
								</div>
							</c:if>
						</div>
					</form>
				</div>




				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->

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
			
			
			$('#Noupload').click(function() {
				var actionUrl = 'report/upload/insertChildbirthmonth';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=ChildbirthMonth';
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

