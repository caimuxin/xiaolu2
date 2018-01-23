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
	
	<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
	
	
	
<style type="text/css">

*{ font-size:14px;font-family:"宋体";}
ul,li{ list-style:none; margin:0; padding:0;}
.clearfix{ clear:both;}
/*导航*/
		.table li{ float:left; width:120px; line-height:24px; font-size:12Px; color:#4f99c6; text-align:center; border:1px #4f99c6 solid;}
		.table li a{ color:#4f99c6;}
		/* .table .l_yuanjiao{ border-radius:5px 0px 0px 5px;} */
		.table .r_yuanjiao{ border-radius:0px 5px 5px 0px; }
		.table .this{ background-color:#4f99c6; color:#ffffff;}
		.table .this a{color:#ffffff;}
		.table .no_border{ border-right:none;}
		.table li:hover{ background-color:#4f99c6; color:#ffffff;}
		.table li:hover a{ color:#ffffff;}
		.table .current{ background-color:#4f99c6; color:#ffffff;}
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
.tital .wzbiaoti{ width:288px; text-align:left; padding-left:5px;}

.shuju td{height:38px;  border-left:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center;}
.shuju .border_r{ border-right:1px #dedede solid;}
.shuju .gouxuan{ width:46px;}
.shuju .wzbiaoti{ width:288px; text-align:left; padding-left:5px;}

.caozuo{width: 200px;}
</style>
	
	
	
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<ul class="table">
	        <li class="no_border" style="border-radius:5px 0px 0px 5px;"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
	        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
	        <li class="l_yuanjiao this"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
	        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
	        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
	        <div  class="clearfix"></div>
		</ul>
		<form action="hospitalizedController/listPdPageHospitalized.do" method="post" name="userInfoForm" id="userInfoForm">
		<input type="hidden" id="uuid" name="uuid" value="${pd.uuid}">
        <table>
				<tr>
				
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="h_type" id="h_type" data-placeholder="请选择类别" style="vertical-align:top;width: 120px;">
						<option value="">全部</option>
						<option value="t">住院治疗</option>
						<option value="b">住院分娩</option>
					  	</select>
					</td>
					
					<td style="padding-left:20px;">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="doctor_name" value="${pd.useName }" placeholder="经管理医生" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					
					<td style="padding-left:20px;"><input class="span10 date-picker" name="conDt" id="lastLoginStart" value="${pd.conDt}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="住院日期"/></td>
					<td style="padding-bottom: 10px;">至</td>
					<td><input class="span10 date-picker" name="conDts" id="lastLoginEnd" value="${pd.conDts}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="出院日期"/></td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</table>
        <div class="big_box2">
        	<ul>
                <li>
                	<a class="btn btn-small btn-success" onclick="add();">新增</a>
                </li>
            </ul>
            
            
            
            
            
            
            <div class="biaoge">
            	<table class="tital" cellspacing="0">
                	<tr>
                    	<td class="wzbiaoti">住院日期</td>
                    	<td class="wzbiaoti">出院日期</td>
                    	<td class="wzbiaoti">住院类型</td>
                    	<td class="wzbiaoti">所在医院</td>
                    	<td class="wzbiaoti">经管医生</td>
                    	<td class="caozuo">操作</td>
                    </tr>
                </table>
                
                <table class="shuju" cellspacing="0">
                <!-- 开始循环 -->
                <c:forEach items="${hzList}" var="hz">
                	<tr>
                    	<td class="wzbiaoti">${hz.H_IN_DATE}</td>
                    	<td class="wzbiaoti">${hz.H_OUT_DATE}</td>
                    	<td class="wzbiaoti">
                    	<c:if test="${hz.H_TYPE =='b'}">住院分娩</c:if>
                    	<c:if test="${hz.H_TYPE =='t'}">住院治疗</c:if>
                    	</td>
                    	<td class="wzbiaoti">
                    	<c:if test="${hz.HOSPITAL_NAME !=''}">${hz.HOSPITAL_NAME}</c:if>
                    	<c:if test="${hz.HOSPITAL_ID !=''}">${hz.HOSPITALNAME}</c:if>
                    	</td>
                    	<td class="wzbiaoti">
                    	<c:if test="${hz.DOCTOR_NAME !=''}">${hz.DOCTOR_NAME}</c:if>
                    	<c:if test="${hz.DOCTOR_ID !=''}">${hz.DOCTORNAME}</c:if>
                    	</td>
                    	<td class="caozuo">
                			<c:if test="${hz.H_TYPE =='t'}">
							<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>hospitalizedController/getHtUpd?h_id=${hz.H_ID}&uuid=${pd.uuid}"><i class='icon-edit'></i></a>
							<a class='btn btn-mini btn-info' title="详情" href="<%=basePath%>hospitalizedController/getHtUpds?h_id=${hz.H_ID}&uuid=${pd.uuid}"><i class='icon-th'></i></a>
							
							</c:if>
								
							<c:if test="${hz.H_TYPE =='b'}">
							<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>hospitalizedController/getHdUpd?h_id=${hz.H_ID}&uuid=${pd.uuid}"><i class='icon-edit'></i></a>
							<a class='btn btn-mini btn-info' title="详情" href="<%=basePath%>hospitalizedController/getHdUpds?h_id=${hz.H_ID}&uuid=${pd.uuid}"><i class='icon-th'></i></a>
							</c:if>
							<a class='btn btn-mini btn-danger' title="删除" onclick="delEduType('${hz.H_ID}','${hz.H_TYPE}','${hz.PHOTOT}','${hz.PHOTOD}');"><i class='icon-trash'></i></a>
						</td>
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
			$("#userInfoForm").submit();
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
		//全选 （是/否）
		function selectAll(){
			 var checklist = document.getElementsByName ("ids");
			   if(document.getElementById("zcheckbox").checked){
			   for(var i=0;i<checklist.length;i++){
			      checklist[i].checked = 1;
			   } 
			 }else{
			  for(var j=0;j<checklist.length;j++){
			     checklist[j].checked = 0;
			  }
			 }
		}
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>userInfoController/deleteAllE.do?tm='+new Date().getTime(),
						    	data: {uuid:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			var hospitalName = $("#nav-search-input").val();
			var hospitalCity = $("#searchHospitalCity").val();
			window.location.href='<%=basePath%>hospital/excel.do?hospitalName='+hospitalName+'&hospitalCity='+hospitalCity;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '<%=basePath%>user/goUploadExcel.do';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		
		<script type="text/javascript">

		//删除住院记录
		function delEduType(h_id,htype,photot,photod){
			bootbox.confirm("确定要删除此记录吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>hospitalizedController/hospitalizedDel.do?h_id="+h_id+"&htype="+htype+"&photot="+photot+"&photod="+photod;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		function add(){
			  window.location.href='<%=basePath%>hospitalizedController/getHospitalizedTreat.do?uuid='+'${pd.uuid}';
<%-- 			 window.location.href='<%=basePath%>hospitalizedController/getHdAdd.do?uuid='+'${pd.uuid}';
 --%>		}
		
		</script>
	</body>
</html>

