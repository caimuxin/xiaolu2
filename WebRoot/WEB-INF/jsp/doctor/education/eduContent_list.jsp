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

	<link rel="stylesheet" href="static/css/edu-content-list.css" />
	<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<form action="eduContentController/listPdPageContent.do" method="post" name="eduContentForm" id="eduContentForm">
        <table>
				<tr>
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="eduId" id="role_id" data-placeholder="请选择类别" style="vertical-align:top;width: 120px;">
						<option value="">全部</option>
						<option value=""></option>
						 <c:forEach items="${typeList}" var="tl" varStatus="vs">
							 <option value="${tl.EDU_ID }" <c:if test="${pd.eduId==tl.EDU_ID}">selected</c:if>>${tl.EDU_TITLE }</option>
						</c:forEach>
					  	</select>
					</td>
				
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="conTitle" value="${pd.conTitle }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="userName" value="${pd.userName }" placeholder="这里输入作者" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="padding-left: 20px;">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="conComment" value="${pd.conComment }" placeholder="评论次数" />
						</span>
					</td>
					<td style="padding-bottom: 10px;">至</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="conComments" value="${pd.conComments }" placeholder="评论次数" />
						</span>
					</td>
					<td style="padding-left: 20px;"><input class="span10 date-picker" name="conDt" id="lastLoginStart" value="${pd.conDt}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="conDts" id="lastLoginEnd" value="${pd.conDts}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="到期日期"/></td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</table>
        <div class="big_box2">
        	<ul>
                <li>
                	<a class="btn btn-mini btn-primary" id="but2" href="<%=basePath%>eduContentController/goAddContent.do">发布</a>
					<a class="btn btn-mini btn-danger" id="but1" onclick="makeAll('确定要删除选中的数据吗?');">删除</a>
                	<!-- <input class="but2"  type="button" value="发布"> <input class="but1" type="button" value="删除" onclick="makeAll('确定要删除选中的数据吗?');"> -->
                </li>
            </ul>
            
            <div class="biaoge">
            	<table class="tital" cellspacing="0">
                	<tr>
                    	<td class="gouxuan" onclick="selectAll()"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></td>
                    	<td class="wzbiaoti">文章标题</td>
                    	<td class="zuozhe">作者</td>
                    	<td class="time">发布时间</td>
                    	<td>评论</td>
                    	<td class="border_r">浏览</td>
                    	<td>操作</td>
                    </tr>
                </table>
                
                <table class="shuju" cellspacing="0">
                <!-- 开始循环 -->
                <c:forEach items="${contentList}" var="cl" varStatus="vs">
                	<tr>
                    	<td class="gouxuan">
                    	<label><input type='checkbox' name='ids' value="${cl.CONTENT_ID}"/><span class="lbl"></span></label>
                    	</td>
                    	<td class="wzbiaoti"><a href="<%=basePath%>eduContentController/goUpdContents.do?content_id=${cl.CONTENT_ID}">${cl.CON_TITLE}</a></td>
                    	<td class="zuozhe">${cl.USERNAME}</td>
                    	<td class="time">${cl.CON_DT}</td>
                    	<td>${cl.CON_COMMENT}</td>
                    	<td class="border_r">${cl.CON_BROWSE}</td>
                    	<td>
                    	<a class='btn btn-mini btn-info' title="编辑" href="<%=basePath%>eduContentController/goUpdContent.do?content_id=${cl.CONTENT_ID}"><i class='icon-edit'></i></a>
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
			$("#eduContentForm").submit();
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
								url: '<%=basePath%>eduContentController/deleteAllE.do?tm='+new Date().getTime(),
						    	data: {CONTENT_IDS:str},
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
		
	</body>
</html>

