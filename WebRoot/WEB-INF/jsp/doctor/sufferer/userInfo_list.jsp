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
.tital .wzbiaoti{ width:203px; text-align:left; padding-left:5px;}

.shuju td{height:38px;  border-left:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center;}
.shuju .border_r{ border-right:1px #dedede solid;}
.shuju .gouxuan{ width:46px;}
.shuju .wzbiaoti{ width:203px; text-align:left; padding-left:5px;}

.caozuo{width: 200px;}
</style>
	
	
	
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<form action="userInfoController/listPdPageUserInfo.do" method="post" name="userInfoForm" id="userInfoForm">
        <table>
				<tr>
				
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="status1" id="status" data-placeholder="请选择类别" style="vertical-align:top;width: 120px;">
						<option value="">全部</option>
						<option value="0" <c:if test="${pd.xuan==3}">selected</c:if>>启用</option>
						<option value="1" <c:if test="${pd.status1==1}">selected</c:if>>停用</option>
					  	</select>
					</td>
					
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="useName" value="${pd.useName }" placeholder="患者姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					
					
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="uTelphone" value="${pd.uTelphone }" placeholder="联系方式" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="conDt" id="lastLoginStart" value="${pd.conDt}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="孕产期时间"/></td>
					<td style="padding-bottom: 10px;">至</td>
					<td><input class="span10 date-picker" name="conDts" id="lastLoginEnd" value="${pd.conDts}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="孕产期时间"/></td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td>
				</tr>
			</table>
        <div class="big_box2">
        	<ul>
                <li>
                	<a class="btn btn-mini btn-primary" id="but2" href="<%=basePath%>userInfoController/getAddInfo.do">新增</a>
					<a class="btn btn-mini btn-danger" id="but1" onclick="makeAll('确定要删除选中的数据吗?');">删除</a>
                	<!-- <input class="but2"  type="button" value="发布"> <input class="but1" type="button" value="删除" onclick="makeAll('确定要删除选中的数据吗?');"> -->
                </li>
            </ul>
            
            
            
            
            
            
            <div class="biaoge">
            	<table class="tital" cellspacing="0">
                	<tr>
                    	<td class="gouxuan" onclick="selectAll()"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></td>
                    	<td class="wzbiaoti">姓名</td>
                    	<td class="wzbiaoti">联系方式</td>
                    	<td class="wzbiaoti">性别</td>
                    	<td class="wzbiaoti">年龄</td>
                    	<td class="wzbiaoti">所在地区</td>
                    	<td class="wzbiaoti">注册时间</td>
                    	<td class="wzbiaoti">状态</td>
                    	<td class="caozuo">操作</td>
                    </tr>
                </table>
                
                <table class="shuju" cellspacing="0">
                <!-- 开始循环 -->
                <c:forEach items="${userInfoList}" var="cl">
                	<tr>
                    	<td class="gouxuan">
                    	<label><input type='checkbox' name='ids' value="${cl.uuid}"/><span class="lbl"></span></label>
                    	</td>
                    	<td class="wzbiaoti">
	                    	<a href="<%=basePath%>userInfoController/getDetails.do?uuid=${cl.uuid}">
	                    	<c:choose>
									<c:when test="${not empty cl.user_namezs}">
									${cl.user_namezs}
									</c:when>
									
									<c:otherwise>
									宾客
									</c:otherwise>
							</c:choose>
	                    	
	                    	</a>
                    	</td>
                    	<td class="wzbiaoti"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${cl.uuid}">${cl.phone}</a></td>
                    	<td class="wzbiaoti">${cl.u_sex}</td>
                    	<td class="wzbiaoti">
							<c:choose>
								<c:when test="${not empty cl.u_age}">
								${cl.u_age}
								</c:when>
								
								<c:otherwise>
								${cl.age}
								</c:otherwise>
							</c:choose>
						                    	
                    	</td>
                    	<td class="wzbiaoti">${cl.u_address}</td>
                    	<td class="wzbiaoti">${cl.createtime}</td>
                    	<td class="wzbiaoti"><c:if test="${cl.status==0}">启用</c:if><c:if test="${cl.status==1}">停用</c:if></td>
                    	<td class="caozuo">
							<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>userInfoController/getDetailss.do?uuid=${cl.uuid}"><i class='icon-edit'></i></a>
							<c:if test="${cl.status==1}">
							<a class='btn btn-mini btn-danger' title="启用" onclick="delEduType('${cl.uuid}','0');" ><img src="<%=basePath%>static/images/qiyong.png" width="20px;"/></a>
							</c:if>
							<c:if test="${cl.status==0}">
							<a class='btn btn-mini btn-danger' title="停用" onclick="delEduType('${cl.uuid}','1');" ><img src="<%=basePath%>static/images/tingyong.png" width="20px;"/></a>
							</c:if>
						</td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty userInfoList}">     
                  <tr>
                  	<td style="width:1650px;">没有相关数据！</td>
                  </tr>
                  </c:if>
                </table>
		         <c:if test="${not empty userInfoList}">     
		       	<div class="page-header position-relative">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
					</tr>
				</table>
				</div>
				</c:if>
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
			 diag.URL = '<%=basePath%>userInfoController/goUploadExcel.do';
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
		//操作状态
		function delEduType(uuid,status){
					top.jzts();
					var url = "<%=basePath%>userInfoController/updStatus.do?uuid="+uuid+"&status="+status;	
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
		}
		
		</script>
	</body>
</html>

