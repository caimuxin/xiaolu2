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
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="static/layer/layer.js"></script>
	<style>

	*{ font-size:14px; color:#595959; font-family:"宋体";}
	.clearfix{ clear:both;}
	h1{ margin:0; padding:0;}
	ul,li{ list-style:none; margin:0; padding:0;}
	input{ margin:0; padding:0; border:none;}
		
	/*选择*/
	.xuanze_box li{ float:left;}
	.big_box h1{ width:1662px;font-size:24px; text-align:center; padding-top:20px; padding-bottom:20px;}
	.xuanze_box .chose{ line-height:32px; padding-left:10px; margin-right:10px; border:1px solid #e7e7e7; width:100px;}
	/*表格*/
	.biaoge21{ width:1662px; border: 1px solid #000000; text-align:center;}
	.biaoge21 td{ border: 1px solid #000000; width:50px; height:42px;}
	.biaoge21 .name{ width:100px;}
	.zijiange{ letter-spacing:8px;}
	
	.but2{width:60px;line-height:32px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/daoru.png);background-repeat:no-repeat;background-position:center; margin-left:10px;}
	.but2:hover{background-image:url(static/img/daoru-hover.png); background-repeat:no-repeat; background-position:center;}

	.but{width:60px; line-height:32px; margin-left:10px; border:none; color:#e7e7e7; outline:none;cursor:pointer;text-align:center; background-color:#6fb3e0;background-image:url(static/img/dayin.png);background-repeat:no-repeat;background-position:center;}
	.but:hover{background-image:url(static/img/dayin-hover.png); background-repeat:no-repeat; background-position:center;}
	</style>
	</head> 
	
<body>
		
<div class="container-fluid" id="main-container">

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
		<form action="report/childPregnantHealthY.do" method="post" name="phForm" id="phForm">	
		<div class="big_box">
		<div class="xuanze_box no-print">
			<ul>
				<li><input type="text" name="searchDate" id="searchDate" class="chose"  value="${pd.searchDate}" placeholder="选择年份" title="某年"/></li>
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
		    <div class="clearfix"></div>	
		</div>
		
		 <h1>儿童与孕产妇健康状况（${pd.titleYear }）年报表</h1>
        <table class="biaoge21" cellspacing="0" >
        	<tr>
            	<td rowspan="3" class="name">县（市、区）名称</td>
                <td colspan="4" rowspan="2">活产数</td>
				<td colspan="16" class="zijiange">5岁以下儿童死亡情况</td>
                <td rowspan="3">孕产妇死亡数</td>
                <td rowspan="3">死胎死产数</td>
            </tr>
            <tr>
            	<td colspan="4">5岁以下儿童死亡数</td>
                <td colspan="4">婴儿死亡数</td>
                <td colspan="4">新生儿死亡数</td>
                <td colspan="4">早期新生儿死亡数</td>
            </tr>
			<tr>
				<td>合计</td>
                <td>男</td>
                <td>女</td>
                <td>性别不明</td>
                <td>合计</td>
                <td>男</td>
                <td>女</td>
                <td>性别不明</td>
                <td>合计</td>
                <td>男</td>
                <td>女</td>
                <td>性别不明</td>
                <td>合计</td>
                <td>男</td>
                <td>女</td>
                <td>性别不明</td>
                <td>合计</td>
                <td>男</td>
                <td>女</td>
                <td>性别不明</td>
            </tr>
           <c:if test="${empty list  }">
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
            	</tr> 
           </c:if>
           <c:forEach items="${list }" var="bs">          
            <tr>
            	<td>${bs.city }</td>
            	<td>${bs.blife }</td>
            	<td>${bs.blifeman }</td>
            	<td>${bs.blifewoman }</td>
            	<td>${bs.blifenosex }</td>
            	<td>${bs.fd }</td>
            	<td>${bs.fdman }</td>
            	<td>${bs.fdwoman }</td>
            	<td>${bs.fdnosex }</td>
            	<td>${bs.bd }</td>
            	<td>${bs.bdman }</td>
            	<td>${bs.bdwoman }</td>
            	<td>${bs.bdnosex }</td>
            	
            	<td>${bs.nbd }</td>
            	<td>${bs.nbdman }</td>
            	<td>${bs.nbdwoman }</td>
            	<td>${bs.nbdnosex }</td>
            	<td>${bs.enbd }</td>
            	<td>${bs.enbdman }</td>
            	<td>${bs.enbdwoman }</td>
            	<td>${bs.enbdnosex }</td>
            	<td>${bs.pregnantdie }</td>
            	<td>${bs.beforebirthdie }</td>
            	
            </tr> 
            </c:forEach>
		
		</table>
		</div>
		</form>	
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
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
			$("#phForm").submit();
		}
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			//日期框
			$('.chose').datepicker({
				format:'yyyy',
				autoclose:true,
				startView: 2,
				maxViewMode:2,
				minViewMode:2
			});
			$('#searchDate').datepicker().on('changeDate', function(e) {
				$("#phForm").submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			
			//打开上传excel页面
			$('#upload').click(function() {
				var actionUrl = 'reportImportOne/childPregnantHealthYear';
				var downloadUrl = 'reportImportOne/childPregnantHealthYearExcel';
				var url = '<%=basePath%>report/upload?action=' + actionUrl + '&url=' + downloadUrl;
				layer.open({
					  type: 2,
					  title: 'EXCEL 导入到数据库',
					  shadeClose: true,
					  skin: 'layui-layer-lan',
					  shade: 0.2,
					  area: ['480px', '320px'],
					  content: url
				}); 
			});
		});
		
		
		
		
		
		</script>
		
	</body>
</html>

