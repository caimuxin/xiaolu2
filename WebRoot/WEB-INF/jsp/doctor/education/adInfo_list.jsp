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
	
<style>
*{ font-size:14px;font-family:"宋体";}

.big_box{  width:1669px; }
.center_box{  width:1669px; clear:both;}
/*标题*/
.big_box .fabu{ border:none; background-color:#428bca; width:44px; height:32px; color:#ffffff; text-shadow:0px -1px 0px #356fa2; margin-top:10px; margin-bottom:10px; cursor:pointer; float:right; outline:none;}
.big_box .fabu:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
.tital td{ width:230px; height:42px; border-left:1px solid #dedede; border-top:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center; font-size:16px; font-weight:bold; background-color:#4f99c6; color:#ffffff;}
.tital .gouxuan{ width:46px;}
.tital .bankuai{ width:225px; text-align:left; padding-left:5px;}
.tital .biaoti{ width:418px; text-align:left; padding-left:5px;}
.tital .tuwen{ width:225px; text-align:left; padding-left:5px;}
.tital .who{  width:225px; text-align:left; padding-left:5px;}
.tital .time{ width:225px; text-align:left; padding-left:5px;}
.tital .caozuo{ width:76px;}
.tital .border_r{ border-right:1px solid #dedede;}
/*数据表格*/
.shuju td{ width:230px; height:40px; border-left:1px solid #dedede; border-bottom:1px solid #dedede; text-align:center;}
.shuju .gouxuan{ width:46px;}
.shuju .bankuai{ width:225px; text-align:left; padding-left:5px;}
.shuju .biaoti{ width:418px; text-align:left; padding-left:5px;}
.shuju .tuwen{ width:225px; text-align:left; padding-left:5px;}
.shuju .who{  width:225px; text-align:left; padding-left:5px;}
.shuju .time{ width:225px; text-align:left; padding-left:5px;}
.shuju .caozuo{ width:76px;}
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
		
		<div class="big_box">
    	<input type="button" value="发布" class="fabu" onclick="fabu()">
        <form action="adInfoController/allAdInfo.do" method="post" name="adInfoForm" id="adInfoForm">
        <div class="center_box">
    	<table class="tital" cellspacing="0">
        	<tr>

            <td class="gouxuan" onclick="selectAll()"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></td>
            <td class="bankuai">版块</td>
            <td class="biaoti">标题</td>
			<td class="tuwen">链接图文</td>
            <td class="who">发布者</td>
            <td class="time">发布时间</td>
            <td>顺序</td>
            <td class="border_r caozuo">操作</td>
            </tr>
        </table>
        
        <table class="shuju" cellspacing="0">
        	<c:forEach items="${adList}" var="al">
        	<tr>
	            <td class="gouxuan">
					<label><input type='checkbox' name='ids' value="${al.AD_ID}"/><span class="lbl"></span></label>
				</td>
	            <td class="bankuai">
	            <c:if test="${al.AD_SECTION=='SY'}">首页板块</c:if>
	            <c:if test="${al.AD_SECTION=='JC'}">检测版块</c:if>
	            <c:if test="${al.AD_SECTION=='XJ'}">课堂宣教</c:if>
	            </td>
	            <td class="biaoti">${al.AD_TITLE}</td>
	            
				<td class="tuwen">
				<c:if test="${al.AD_ISUB=='Y'}">是</c:if>
	            <c:if test="${al.AD_ISUB=='N'}">否</c:if>
				</td>
	            <td class="who">${al.USERNAME}</td>
	            <td class="time">${al.AD_DT}</td>
	            <td>${al.AD_SEQUENCE}</td>
	            
	            <td class="border_r caozuo">
					<a class='btn btn-mini btn-info' title="编辑 " href="<%=basePath%>adInfoController/getupd.do?adId=${al.AD_ID}"><i class='icon-edit'></i></a>
					<a class='btn btn-mini btn-danger' title="删除" onclick="delAdInfo('${al.AD_ID}','${al.AD_TITLE}');"><i class='icon-trash'></i></a>
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
       </form>
    </div>
</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#adInfoForm").submit();
		}
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
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
		
		//删除
		function delAdInfo(anId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>adInfoController/delAdInfo.do?anId="+anId;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		
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
		
		function fabu(){
			window.location.href ="adInfoController/getAdd.do";
		}
		
		
		</script>
	</body>
</html>

