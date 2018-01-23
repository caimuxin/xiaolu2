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
	<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
	
	
<style type="text/css">

*{ font-size:14px;font-family:"宋体";}
ul,li{ list-style:none; margin:0; padding:0;}
.clearfix{ clear:both;}
/*选择*/
.big_box{ }
.xuanze_box{  float:left;}
.xuanze_box ul{ padding-bottom:30px;}
.xuanze_box li{ float:left; line-height:32px;}
.xuanze_box select{ width:360px; height:36px; outline:none;}
.xuanze_box input{ width:356px; height:30px; line-height:12px; outline:none;}
.xuanze_box2{ float:left; margin-left:100px;}
.xuanze_box2 .search{ width:58px; height:30px; border:none; color:#6fb3e0; outline:none; cursor:pointer;}
.xuanze_box2 ul{ padding-bottom:35px;}
.xuanze_box2 li{ float:left;  line-height:32px;}
.xuanze_box2 .float_r{ float:right; }
/*表格*/
.big_box2 ul{ float:right; margin-top:20px; margin-bottom:10px;}

.big_box2{width:1663px;}
	
.biaoge{  clear:both; width:1663px;}
.tital td{color:#ffffff;height:42px;  border-left:1px solid #dedede; border-top:1px solid #dedede; border-bottom:1px solid #dedede; background-color:#4f99c6;text-align:center; font-size:16px; font-weight:bold; }
.tital .border_r{ border-right:1px #dedede solid;}
.tital .gouxuan{ width:46px;}
.tital .wzbiaoti{ width:283px; text-align:left; padding-left:5px;}
.shuju td{height:38px;  border-left:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center;}
.shuju .border_r{ border-right:1px #dedede solid;}
.shuju .gouxuan{ width:46px;}
.shuju .wzbiaoti{ width:283px; text-align:left; padding-left:5px;}
.caozuo{width: 200px;}

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

#t0 a{color: #4f99c6;}
#t1{background-color: #4f99c6;}
#t0{background-color: #ffffff;}
#t1 a{color: #ffffff;}
</style>
</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">
	<ul class="table">
        <li class="l_yuanjiao this" id="t0"><a href="<%=basePath%>doctorManage/toUpdDoctor.do?doctor_id=${pd.doctor_id}">基本信息</a></li>
        <li class="no_border" id="t1"><a href="<%=basePath%>doctorManage/toDisease.do?doctor_id=${pd.doctor_id}"<%-- href="<%=basePath%>doctorManage/toDisease.do?doctor_id=${doctor.doctorId} --%>">病患记录</a></li>
         <li class="r_yuanjiao"><a href="<%=basePath%>MedFollowLnglat/listPageMedFollow.do?doctor_id=${pd.doctor_id}">随访轨迹</a></li>
        <div  class="clearfix"></div>
	</ul>
	<div class="row-fluid">
			<!-- 检索  -->
		<form action="doctorManage/toDisease.do" method="post" name="doctorInfoForm" id="doctorInfoForm">
		<input type="hidden" id="doctor_id" name="doctor_id" value="${pd.doctor_id}">
        <table>
				<tr>
					<td>
						<span>
							<input type="date" id="conDt" name="conDt" style="width:130px;" value="${pd.conDt}">至
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input type="date" id="conDts" name="conDts" style="width:130px;" value="${pd.conDts}">
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="user_namezs" placeholder="姓名" value="${pd.user_namezs }"/>
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</table>
        <div class="big_box2">
            <div class="biaoge">
            	<table class="tital" cellspacing="0">
                	<tr>
                    	<td class="wzbiaoti">诊疗类型</td>
                    	<td class="wzbiaoti">患者姓名</td>
                    	<td class="wzbiaoti">性别</td>
                    	<td class="wzbiaoti">年龄</td>
                    	<td class="wzbiaoti">联系方式</td>
                    	<td class="wzbiaoti">所属区域</td>
                    </tr>
                </table>
                
                <table class="shuju" cellspacing="0">
                <!-- 开始循环 -->
                <c:forEach items="${diseaseList}" var="dl">
                	<tr>
                    	<td class="wzbiaoti">
                    		
                    			<c:if test="${dl.bid!=null && dl.bid==pd.doctor_id}">门诊</c:if>
                    			<c:if test="${dl.cid!=null && dl.cid==pd.doctor_id}">住院</c:if>
                    			<c:if test="${dl.did!=null && dl.did==pd.doctor_id}">随访</c:if>
                    		
                    	</td>
                    	<td class="wzbiaoti"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${dl.uuid}">${dl.user_namezs}</a></td>
                    	<td class="wzbiaoti">${dl.u_sex}</td>
                    	<td class="wzbiaoti">${dl.u_age}</td>
                    	<td class="wzbiaoti">${dl.phone}</td>
                    	<td class="wzbiaoti">${dl.u_address}</td>
                    </tr>
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
         <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
	</form>


	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->	
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
			class="icon-double-angle-up icon-only"></i>
		</a>
	
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
			$("#doctorInfoForm").submit();
		}
		
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			//各行变色
			$(".shuju tr:odd").css("background-color","#f2f2f2");
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
			
		});
		
		</script>
	</body>
</html>

