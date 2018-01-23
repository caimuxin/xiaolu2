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
	
	.xuanze li{ float:left;}
	.biaoge{ width:3324px; border: 1px solid #000000; text-align:center;}
	.biaoge td{ width:63px; height:42px; border: 1px solid #000000; text-align:center;}
	.biaoti{ width:1662px;font-size:24px;  font-weight:bold; text-align:center; padding-top:20px; padding-bottom:20px;}
	.width100{ width:100px;}
	.xuanze .chose{  padding-left:10px; margin-right:10px; width:100px;}
	
	
	
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
		<form action="report/findPregnantHealth.do" method="post" name="phForm" id="phForm">	
		<div class="xuanze no-print">
			<ul>
				<li>
				<input class="chose" name="searchDate" id="searchDate"  value="${pd.searchDate}" type="text"  placeholder="选择年份" title="某年"/>
				</li>
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
		
		<h1 class="biaoti">孕产妇保健和健康情况(${pd.titleYear })年度表</h1>
		
		<table cellspacing="0" class="biaoge">
		<tr>
		    <td rowspan="3" class="width100">县（市、区）名称</td>
		    <td colspan="5">活产数</td>
		    <td colspan="3">产妇数</td>
		    <td colspan="19">孕产妇保健管理</td>
		    <td colspan="4">接生情况</td>
		    <td colspan="3">孕产妇高危管理</td>
		    <td colspan="6">孕产妇死亡</td>
		    <td colspan="8">围产儿情况</td>
		    <td rowspan="3">新生儿破伤风发病数</td>
		    <td rowspan="3">新生儿破伤风死亡数</td>
		</tr>
		<tr>
		    <td rowspan="2">合计</td>
		    <td rowspan="2">男</td>
		    <td rowspan="2">女</td>
		    <td rowspan="2">性别不明</td>
		    <td rowspan="2">农业户籍活产数</td>
		    <td rowspan="2">合计</td>
		    <td rowspan="2">非农业户籍</td>
		    <td rowspan="2">农业户籍</td>
		    <td rowspan="2">产妇建卡人数</td>
		    <td colspan="3">产妇产前检查情况</td>
		    <td colspan="3">孕产期血红蛋白检测</td>
		    <td colspan="2">艾滋病病毒检测</td>
		    <td colspan="2">产妇梅毒检测</td>
		    <td colspan="2">产妇乙肝表面抗原检测</td>
		    <td colspan="2">孕产妇产前筛查</td>
		    <td colspan="2">孕产妇产前诊断</td>
		    <td rowspan="2">产妇产后访视人数</td>
		    <td rowspan="2">产妇系统管理人数</td>
		    <td colspan="2">住院分娩活产数</td>
		    <td rowspan="2">剖宫产活产数</td>
		    <td rowspan="2">非住院分娩中新法接生活产数</td> 
		    <td rowspan="2">高危产妇人数</td> 
		    <td rowspan="2">高危产妇管理人数</td>  
		    <td rowspan="2">高危产妇住院分娩人数</td> 
		    <td rowspan="2">死亡人数</td>  
		    <td rowspan="2">产科出血</td> 
		    <td rowspan="2">妊娠高血压疾病</td>
		    <td rowspan="2">内科合并症</td>
		    <td rowspan="2">羊水栓塞</td>
		    <td rowspan="2">其他原因</td> 
		    <td rowspan="2">出生体重＜2500克人数</td> 
		    <td rowspan="2">出生体重≥4000克人数</td> 
		    <td rowspan="2">＜37周活产数</td> 
		    <td rowspan="2">死胎死产数</td>
		    <td colspan="4">早期新生儿死亡数</td>  
		</tr>
		<tr>
			<td>产检人数</td>
		    <td>产检≥5次人数</td>
		    <td>早检人数</td>
		    <td>产检人数</td>
		    <td>血红蛋白＜100克/升</td>
		    <td>血红蛋白＜80克/升</td>
		    <td>产妇检测人数</td>
		    <td>孕产妇感染人数</td>
		    <td>检测人数</td>
		    <td>梅毒感染人数</td>
		    <td>检测人数</td>
		    <td>阳性人数</td>
		    <td>筛查人数</td>
		    <td>高危人数</td>
		    <td>诊断人数</td>
		    <td>确诊人数</td>
		    <td>合计</td>
		    <td>其中农业户籍</td>
		    <td>合计</td>
		    <td>男</td>
		    <td>女</td>
		    <td>性别不明</td>
		</tr>
		 <c:if test="${empty list  }">
		 	<tr>
				<td> - </td>
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
		<c:forEach items="${list }" var="ph">
		<tr>
			<td> ${ph.city } </td>
			<td>${ph.livebirthcount }</td>
		    <td>${ph.livebirthman }</td>
		    <td>${ph.livebirthwoman }</td>
		    <td>${ph.livebirthsexun }</td>
		    <td>${ph.livebirthfarm }</td>
		    <td>${ph.pregnantcount }</td>
		    <td>${ph.pregnantunfarm }</td>
		    <td>${ph.pregnantfarm }</td>
		    <td>${ph.opencard }</td>
		    <td>${ph.antenatalcount }</td>
		    <td>${ph.antenatalupfive }</td>
		    <td>${ph.earlyantenatal }</td>
		    <td>${ph.proteinexam }</td>
		    <td>${ph.lesshundred }</td>
		    <td>${ph.lesseighty }</td>
		    <td>${ph.hivexam }</td>
			<td>${ph.hiv }</td>
		    <td>${ph.syphilisexam }</td>
		    <td>${ph.syphilis }</td>
		    <td>${ph.hepatitisb }</td>
		    <td>${ph.positive }</td>
		    <td>${ph.screen }</td>
		    <td>${ph.highrisk }</td>
		    <td>${ph.diagnose }</td>
		    <td>${ph.bediagnose }</td>
		    <td>${ph.visit }</td>
		    <td>${ph.systemmanage }</td>
		    <td>${ph.hpchildbirthlive }</td>
		    <td>${ph.childbirthfarm }</td>
		    <td>${ph.caesareansection }</td>
		    
		    <td>${ph.unhpchildbirthlive }</td>
		    <td>${ph.hrp }</td>
		    <td>${ph.hrpmanage }</td>
		    <td>${ph.hrphpbirth }</td>
		    <td>${ph.pd }</td>
		    <td>${ph.pdbleed }</td>
		    <td>${ph.pdhighblood }</td>
		    <td>${ph.pdmedicalcomplication }</td>
		    <td>${ph.pdAFE }</td>
		    <td>${ph.pdother }</td>
		    <td>${ph.pplessttf }</td>
		    <td>${ph.ppmoreft }</td>
		    <td>${ph.pplesstsweek }</td>
		    <td>${ph.ppdiebirth }</td>
		    <td>${ph.ppnbd }</td>
		    <td>${ph.ppnbdman }</td>
		    <td>${ph.ppnbdwoman }</td>
		    <td>${ph.ppnbdsexun }</td>
		    <td>${ph.newBirthTAT }</td>
		    <td>${ph.newbirthTATdie }</td>
		</tr>
		</c:forEach>
		</table>
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
				var actionUrl = 'reportImportOne/read_pregnant_health';
				var downloadUrl = 'reportImportOne/pregnant_healthExcel';
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

