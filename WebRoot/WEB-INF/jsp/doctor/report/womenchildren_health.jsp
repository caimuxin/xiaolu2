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
	ul,li{ list-style:none; margin:0; padding:0;}
	h1{padding:0; margin:0;}
	.clearfix{ clear:both;}
	.text_left{ text-align:left;}
	
	/*表格*/
	.biaoge09{ width:1662px; border: 1px solid #000000; text-align:center;}
	.biaoge09 tr{ height:42px;}
	.biaoge09 td{ border: 1px solid #000000; width:56px;}
	.biaoge09 .name{ width:100px;}
	
	/*选择*/
	.xuanze_box li{ float:left;}
	.big_box h1{ width:1662px;font-size:24px;  font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
	input{ margin:0; padding:0; border:none;}
	.xuanze_box .chose{  padding-left:10px; margin-right:10px; width:100px;}
	
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
		<form action="report/womenChildrenHealth.do" method="post" name="phForm" id="phForm">	
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
		
		<h1>基层妇幼保健基本情况（${pd.titleYear }）年报表</h1>
        <table class="biaoge09" cellspacing="0" >
        	<tr>
            	<td rowspan="4" class="name">县（市、区）名称</td>
                <td rowspan="4">全县（区）总人口数</td>
                <td rowspan="4">15-49岁育龄妇女数</td>
                <td rowspan="4">乡镇数</td>
                <td colspan="2">乡镇卫生院</td>
                <td rowspan="4">社区卫生服务中心、站数</td>
                <td colspan="13">妇幼保健人员</td>
                <td rowspan="4">乡级人员培训人次数</td>
                <td rowspan="4">行政村数</td>
                <td rowspan="4">社区数</td>
                <td colspan="2" rowspan="2">村医</td>
                <td rowspan="4">村保健员人数</td>
                <td rowspan="4">村医兼保健员人数</td>
                <td rowspan="4">村医培训人次数</td>
                <td rowspan="4">持家庭接生员证人数</td>
            </tr>
            
            <tr>
                <td rowspan="3">总数</td>
                <td rowspan="3">其中中心卫生院数</td>
                <td rowspan="3">总数</td>
                <td colspan="3">持证情况</td>
                <td colspan="9" class="text_left">其中：</td>
            </tr>

            <tr class="box">
                <td rowspan="2">助产技术合格证</td>
                <td rowspan="2">计划生育手术合格证</td>
                <td rowspan="2">产前筛查技术合格证</td>
                <td rowspan="2">副主任及以上医师</td>
                <td rowspan="2">主治及主管医师</td>
                <td rowspan="2">医师</td>
                <td rowspan="2">助理医师</td>
                <td rowspan="2">医士</td>
                <td rowspan="2">助产士</td>
                <td rowspan="2">副主任以上护师</td>
                <td rowspan="2">主管护师</td>
                <td rowspan="2">护士</td>
                <td rowspan="2">人数</td>
                <td rowspan="2">其中女性</td>
            </tr>
            
            <tr>
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
            	<td>${bs.totalperson }</td>
            	<td>${bs.birthage }</td>
            	<td>${bs.towncount }</td>
            	<td>${bs.townhptotal }</td>
            	<td>${bs.centerhp }</td>
            	<td>${bs.areahp }</td>
            	<td>${bs.whhealthtotal }</td>
            	<td>${bs.delivertechnology }</td>
            	<td>${bs.birthcontrolope }</td>
            	<td>${bs.beforebirthscreen }</td>
            	<td>${bs.deputydc }</td>
            	<td>${bs.maindc }</td>
            	<td>${bs.doctor }</td>
            	<td>${bs.assistantdc }</td>
            	<td>${bs.feldsher }</td>
            	<td>${bs.deliverdc }</td>
            	<td>${bs.deputynurse }</td>
            	<td>${bs.mainnurse }</td>
            	<td>${bs.nurse }</td>
            	<td>${bs.towntrain }</td>
            	<td>${bs.admintown }</td>
            	<td>${bs.areacount }</td>
            	<td>${bs.towndc }</td>
            	<td>${bs.towndcwoman }</td>
            	<td>${bs.townhealthperson }</td>
            	<td>${bs.towndchealth }</td>
            	<td>${bs.towndctrain }</td>
            	<td>${bs.delivercard }</td>
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
				var actionUrl = 'reportImportOne/womenChildrenHealth';
				var downloadUrl = 'reportImportOne/womenChildrenHealthExcel';
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

