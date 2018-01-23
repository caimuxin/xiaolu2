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
*{ font-size:14px; font-family:"宋体";}
.big_box{  width:1669px; }
.center_box{  width:1669px; clear:both;}
/*标题*/
.big_box #xinzeng{ border:none; background-color:#87b87f; width:48px; height:30px; color:#ffffff; text-shadow:0px -1px 0px #6c9366; margin-top:10px; margin-bottom:10px; cursor:pointer; float:right;outline:none;}
.big_box .xinzeng:hover{ background-image:url(imgs/bg_xinzeng.png); background-repeat:no-repeat; background-position:center;}
.tital td{ width:218px; height:42px; border-left:1px solid #dedede; border-top:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center; font-size:16px; font-weight:bold; background-color:#4f99c6; color:#ffffff;}
.tital .biaoti{ width:1114px; text-align:left; padding-left:5px;}
.tital .caozuo{ width:114px;}
.tital .border_r{ border-right:1px solid #dedede;}
/*数据表格*/
.shuju td{ width:218px; height:42px; border-left:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center;}
.shuju .biaoti{ width:1114px; text-align:left; padding-left:5px;}
.shuju .caozuo{ width:114px;}
.shuju .border_r{ border-right:1px solid #dedede;}
.shuju .bianji{ width:27px; height:24px; border:none; background-image:url(imgs/bianji.png); outline-style:none; cursor:pointer;}
.shuju .shanchu{ width:27px; height:24px; border:none; background-image:url(imgs/shanchu.png); outline-style:none; cursor:pointer;}
.shuju .bgcolor95{ background-color:#f2f2f2;}
</style>
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
			<!-- 检索  -->
		<form action="eduTypeController/findEduType.do" method="post" name="edutypeForm" id="edutypeForm">
		<div class="big_box">
		<input type="button" value="新增" class="btn btn-mini btn-primary" id="xinzeng" onclick="add()">
		<div class="center_box">
			<table class="tital" cellspacing="0">
				<tr>
					<td>类别</td>
					<td class="biaoti">标题</td>
					<td>顺序</td>
					<td class="border_r caozuo">操作</td>
				</tr>
			</table>

			<table class="shuju" cellspacing="0">
			<c:forEach items="${eduTypeList}" var="edu" varStatus="vs">
				<tr>
					<td>${edu.EDU_GRADE}</td>
					<td class="biaoti">${edu.EDU_TITLE}</td>
					<td>${edu.EDU_SEQUENCE}</td>
					<td class="border_r caozuo">
										<a class='btn btn-mini btn-info' title="编辑" onclick="updEduType('${edu.EDU_ID}','${edu.EDU_GRADE}');"><i class='icon-edit'></i></a>
										<a class='btn btn-mini btn-danger' title="删除" onclick="delEduType('${edu.EDU_ID}','${edu.EDU_TITLE}');"><i class='icon-trash'></i></a>
					<!-- <a href=""><input
							type="button" class="bianji"></a> <input type="button"
						class="shanchu"> -->
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
			$(".shuju tr:odd").css("background-color","#f2f2f2");
			
		});
		
		</script>
		
		<script type="text/javascript">
		//新增类别
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>eduTypeController/goEduTypeAdd.do?eduGrade='+'No3';
			 diag.Width = 500;
			 diag.Height = 365;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改类别
		function updEduType(eduId,eduGrade){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = '<%=basePath%>eduTypeController/goEduTypeUpd.do?eduId='+eduId+'&eduGrade='+eduGrade;
			 diag.Width = 450;
			 diag.Height = 365;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		//删除类别
		function delEduType(eid,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>eduTypeController/delEduType.do?eduId="+eid;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		

		</script>
	</body>
</html>

