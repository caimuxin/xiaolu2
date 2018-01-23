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
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	
	<style>
	*{ font-size:14px;font-family:"宋体";}
	.clearfix{ clear:both;}
	dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
	h1{ font-size:16px; font-weight:bold; padding:0; margin:0;}
	a{ text-decoration:none;}
	/*导航*/
	
	.table li{ float:left; width:120px; line-height:24px; font-size:12Px; color:#4f99c6; text-align:center; border:1px #4f99c6 solid;}
	.table li a{ color:#4f99c6;}
	.table .l_yuanjiao{ border-radius:5px 0px 0px 5px;}
	.table .r_yuanjiao{ border-radius:0px 5px 5px 0px; }
	.table .this{ background-color:#4f99c6; color:#ffffff;}
	.table .this a{color:#ffffff;}
	.table .no_border{ border-right:none;}
	.table li:hover{ background-color:#4f99c6; color:#ffffff;}
	.table li:hover a{ color:#ffffff;}
	.table .current{ background-color:#4f99c6; color:#ffffff;}
	
	/*表格*/
	.big_box{  width:1655px; margin-top:20px; }
	.center_box{  width:1655px; clear:both;}
	.sf_tital{ }
	.sf_tital h1{ float:left; background-image:url(static/images/neirong16px.png); background-repeat:no-repeat; padding-left:22px; margin-left:20px; margin-top:20px;}
	.big_box .xinzeng{ border:none; background-color:#87b87f; width:48px; height:30px; color:#ffffff; text-shadow:0px -1px 0px #6c9366; margin-top:10px; margin-bottom:10px; cursor:pointer; float:right; outline:none;
	}
	.big_box .xinzeng:hover{ background-image:url(imgs/bg_xinzeng.png); background-repeat:no-repeat; background-position:center;}
	.tital td{ width:370px; height:42px; padding-left:5px; border-left:1px solid #dedede; border-top:1px solid #dedede; border-bottom:1px solid #dedede;font-size:16px; font-weight:bold; background-color:#4f99c6; color:#ffffff;}
	.tital .caozuo{ width:114px;}
	.tital .border_r{ border-right:1px solid #dedede;}
	/*数据表格*/
	.shuju td{ width:370px; height:42px; border-left:1px solid #dedede; border-bottom:1px solid #dedede; padding-left:5px;}
	.shuju .biaoti{text-align:left; padding-left:5px;}
	.tital .caozuo{ width:140px; text-align:center;}
	.shuju .caozuo{ width:143px; text-align:center;}
	.shuju .border_r{ border-right:1px solid #dedede;}
	.shuju .bianji{ width:27px; height:24px; border:none; background-image:url(imgs/bianji.png); outline-style:none; cursor:pointer;}
	.shuju .shanchu{ width:27px; height:24px; border:none; background-image:url(imgs/shanchu.png); outline-style:none; cursor:pointer;}
	.shuju .bgcolor95{ background-color:#f2f2f2;}
	.box02{ margin-top:50px;}
	</style>
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
	 <ul class="table">
        <li class="l_yuanjiao"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border this"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
    <form action="MedFollowController/listPageMedFollow.do" method="post" name="edutypeForm" id="edutypeForm">
    <input type="hidden" id="uuid" name="uuid" value="${pd.uuid}">
    <div class="big_box">
   		<div class="box01">
    	<div class="sf_tital">
        	<h1>孕期随访记录</h1>
    		<a class="btn btn-small btn-success" onclick="add();" style="float:right">新增</a>
            <div class="clearfix"></div>
        </div>
        <div class="center_box">
    	<table class="tital" cellspacing="0">
        	<tr>
            <td>随访日期</td>
            <td>随访人员</td>
            <td>所属医院</td>
            <td>随访方式</td>
            <td class="border_r caozuo">操作</td>
            </tr>
        </table>
        
        <table class="shuju" cellspacing="0" id="shuju">
        <c:forEach items="${mflist}" var="mf">
        	<c:if test="${mf.F_TYPE=='p'}">
        	<tr>
            <td>${mf.F_DATE}</td>
            <td class="biaoti">
           <%--  <c:if test="${mf.DOCTOR_NAME !=''}">${mf.DOCTOR_NAME}</c:if> --%>
            <c:if test="${mf.DOCTOR_ID !=''}">${mf.DOCTORNAME}</c:if>
          	</td>
            <td>
<%--             <c:if test="${mf.HOSPITAL_NAME !=''}">${mf.HOSPITAL_NAME}</c:if>
 --%>            <c:if test="${mf.HOSPITAL_ID !=''}">${mf.HOSPITALNAME}</c:if>
            </td>
            <td>${mf.F_STYLE}</td>
            <td class="border_r caozuo">
            	<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>MedFollowController/getMedFollowPUpd?f_id=${mf.F_ID}&uuid=${pd.uuid}"><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-info' title="详情" href="<%=basePath%>MedFollowController/getMedFollowPUpds?f_id=${mf.F_ID}&uuid=${pd.uuid}"><i class='icon-th'></i></a>
				<a class='btn btn-mini btn-danger' title="删除" onclick="delmedp('${mf.F_ID}','${mf.P_ATTACHMENT}');"><i class='icon-trash'></i></a>
            </td>
            </tr>
            </c:if>
          </c:forEach>
        </table>
        <div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
		</div>
       </div>
       </div>
        <div class="box02">
    	<div class="sf_tital">
        	<h1>产后随访记录</h1>
    		<a class="btn btn-small btn-success" onclick="adds();" style="float:right">新增</a>
            <div class="clearfix"></div>
        </div>
        <div class="center_box">
    	<table class="tital" cellspacing="0">
    		<tr>
        	<td>随访日期</td>
            <td>随访人员</td>
            <td>所属医院</td>
            <td>随访方式</td>
            <td class="border_r caozuo">操作</td>
            </tr>
        </table>
        
        <table class="shuju" cellspacing="0" id="shuju1">
        	<c:forEach items="${mflist}" var="mf">
        	<c:if test="${mf.F_TYPE=='d' || mf.F_TYPE=='d_42'}">
        	<tr>
           	<td>${mf.F_DATE}</td>
            <td class="biaoti">
<%--             <c:if test="${mf.DOCTOR_NAME !=''}">${mf.DOCTOR_NAME}</c:if>
 --%>            <c:if test="${mf.DOCTOR_ID !=''}">${mf.DOCTORNAME}</c:if>
            </td>
            <td>
<%--             <c:if test="${mf.HOSPITAL_NAME !=''}">${mf.HOSPITAL_NAME}</c:if>
 --%>            <c:if test="${mf.HOSPITAL_ID !=''}">${mf.HOSPITALNAME}</c:if>
            </td>
            <td>${mf.F_STYLE}</td>
            <td class="border_r caozuo">
            	<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>MedFollowController/getMedFollowDUpd?f_id=${mf.F_ID}&uuid=${pd.uuid}"><i class='icon-edit'></i></a>
            	<a class='btn btn-mini btn-info' title="详情" href="<%=basePath%>MedFollowController/getMedFollowDUpds?f_id=${mf.F_ID}&uuid=${pd.uuid}"><i class='icon-th'></i></a>
				<a class='btn btn-mini btn-danger' title="删除" onclick="delmedd('${mf.F_ID}');"><i class='icon-trash'></i></a>
            </td>
            </tr>
            </c:if>
            </c:forEach>
        </table>
        <div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
		</div>
       </div>
       </div>
    </div>
    </form>
	</div>
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i class="icon-double-angle-up icon-only"></i></a>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
	
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
		<!-- 下拉框 -->
		<script type="text/javascript"
			src="static/js/bootstrap-datepicker.min.js"></script>
		<!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script>
		<!-- 确认窗口 -->
		<!-- 引入 -->
	
	
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!--提示框-->
		
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#edutypeForm").submit();
		}
		
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			//各行变色
			$("#shuju tr:odd").css("background-color","#f2f2f2");
			$("#shuju1 tr:odd").css("background-color","#f2f2f2");
			
		});
		
		
		function add(){
			<%--  window.location.href='<%=basePath%>hospitalizedController/getHospitalizedTreat.do?uuid='+'${pd.uuid}'; --%>
			 window.location.href='<%=basePath%>MedFollowController/getMedFollowPAdd.do?uuid='+'${pd.uuid}';
		}
		
		function adds(){
			<%--  window.location.href='<%=basePath%>hospitalizedController/getHospitalizedTreat.do?uuid='+'${pd.uuid}'; --%>
			 window.location.href='<%=basePath%>MedFollowController/getMedFollowDAdd.do?uuid='+'${pd.uuid}';
		}
		
		//删除 孕期随访
		function delmedp(f_id,path){
			bootbox.confirm("确定要删除此记录吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>MedFollowController/medFollowDelp.do?f_id="+f_id+"&PATH="+path;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		
		//删除  产后随访
		function delmedd(f_id){
			bootbox.confirm("确定要删除此记录吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>MedFollowController/medFollowDeld.do?f_id="+f_id;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		</script>
	</body>
</html>

