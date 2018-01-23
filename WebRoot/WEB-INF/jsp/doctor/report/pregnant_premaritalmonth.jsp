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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="static/xiaolu/css/baobiao.css" />
	
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.zh-CN.min.js"></script><!-- 日期框 -->
	<link rel="stylesheet" href="static/css/bootstrap-datepicker.min.css" /><!-- 日期框 -->
	<script type="text/javascript" src="static/js/jQuery.print.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="static/layer/layer.js"></script>
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<!-- 检索  -->
		<form action="report/premaritalmonthlist.do" method="post" name="userInfoForm" id="userInfoForm">
				<div class="big_box_continue">
		    	<div class="xuanze_box">
		            <ul>
		        	    <li style="margin-left: -25px;">
								<input type="text" name="conDt" class="chose datepicker" placeholder="选择月份" value="${pd.conDt}">
						</li>
						<li>
						<select  name="choosearea" id="choosearea" data-placeholder="选择地区" style="vertical-align:top;width: 120px;">
							<option value="">市级</option>
							<option value="">县/区/镇级</option>
							<option value="">基层</option>
						 </select>
						</li>
	            		<li>
	                	<input type="button" id="print" class="but" style="width: 60px;">
		                </li>
		                <li>
		                <input type="button" id="upload" class="but2" style="width: 60px;">
		                </li>
		                <div class="clearfix"></div>
		            </ul>
		            <div class="clearfix"></div>
		        </div>
		        
		        <h1>婚前保健情况(${pd.conDt})月报表</h1>
		        <table class="biaoge_continue" cellspacing="0">
		        	<tr>
		            	<td class="td_left" rowspan="4">县（市、区）名称</td>
		              	<td rowspan="3" colspan="2" >结婚登记人数</td>
		              	<td rowspan="3" colspan="2" >婚前卫生咨询人数</td>
		              	<td rowspan="3" colspan="2" >婚前医学检查人数</td>
		                <td class="td_spacing" colspan="14" >婚检检出疾病分类情况</td>
		                <td rowspan="3" colspan="2">对影响婚育疾病的医学指导意见人数</td>
		                <td rowspan="4">已妊娠人数</td>
		                <td colspan="5">地中海贫血筛查</td>
		                <td colspan="4">HIV检查</td>
		                <td colspan="4">梅毒检查</td>
		                <td colspan="4">乙肝表面抗原检查</td>
		                <td colspan="4">淋病检查</td>
		                <td colspan="4">女性滴虫、霉菌检查</td>
		            </tr>
		            
		            <tr>
		             	<td rowspan="2" colspan="2">总人数</td>
		                <td colspan="4">指定传染病</td>
		                <td rowspan="2" colspan="2">严重遗传疾病人数</td>
		                <td rowspan="2" colspan="2">精神病人数</td>
		                <td rowspan="2" colspan="2">生殖系统疾病人数</td>
		                <td rowspan="2" colspan="2">内科系统疾病人数</td>
		                <td rowspan="2" colspan="2">筛查人数</td>
		                <td rowspan="2" colspan="2">阳性人数</td>
		                <td rowspan="3" >双方阳性对数（对）</td>
		                <td rowspan="2" colspan="2">筛查人数</td>
		                <td rowspan="2" colspan="2">感染人数</td>
		                <td rowspan="2" colspan="2">检查人数</td>
		                <td rowspan="2" colspan="2">感染人数</td>
		                <td rowspan="2" colspan="2">检查人数</td>
		                <td rowspan="2" colspan="2">阳性人数</td>
		                <td rowspan="2" colspan="2">检查人数</td>
		                <td rowspan="2" colspan="2">阳性人数</td>
		                <td rowspan="2" colspan="2">滴虫</td>
		                <td rowspan="2" colspan="2">霉菌</td>                
		            </tr>
		            
		            <tr>
		             	<td colspan="2">人数</td>
		                <td colspan="2">其中性传播疾病人数</td>
		            </tr>
		            
		            <tr>
		
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td> 
		
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>
		                                               
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>
		                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>                
		                <td>男</td>
		                <td>女</td>
		                
		                <td>男</td>
		                <td>女</td>                
		                <td>检查人数</td>
		                <td>阳性人数</td>                
		                <td>检查人数</td>
		                <td>阳性人数</td>                
		                
		            </tr>
		       		<c:choose>
		       		<c:when test="${not empty pd && not empty pmList}">
		       		<c:forEach items="${pmList}" var="pm">
		        	<tr>
		            	<td class="td_left" >${pm.pmcity}</td>
		                <td>${pm.pmregisterman}</td>
		                <td>${pm.pmregisterwoman}</td>
		                <td>${pm.pmconsultationman}</td>
		                <td>${pm.pmconsultationwoman}</td>
		                <td>${pm.pmexaminationman}</td>
		                <td>${pm.pmexaminationwoman}</td>
		                <td>${pm.pmpatientman}</td>
		                <td>${pm.pmpatientwoman}</td>
		                <td>${pm.pminfectiousman}</td>
		                
		            	<td>${pm.pminfectiouswoman}</td>
		                <td>${pm.pmstdman}</td>
		                <td>${pm.pmstdwoman}</td>
		                <td>${pm.pmgeneticman}</td>
		                <td>${pm.pmgeneticwoman}</td>
		                <td>${pm.pmpsychosisman}</td>
		                <td>${pm.pmpsychosiswoman}</td>
		                <td>${pm.pmreproductiveman}</td>
		                <td>${pm.pmreproductivewoman}</td>
		                <td>${pm.pminternalman}</td>
		                
		            	<td>${pm.pminternawoman}</td>
		                <td>${pm.pminstructionman}</td>
		                <td>${pm.pminstructionwoman}</td>
		                <td>${pm.pmpregnancetotal}</td>
		                <td>${pm.pmthalassemiaexamineman}</td>
		                <td>${pm.pmthalassemiaexaminewoman}</td>
		                <td>${pm.pmthalassemiapositiveman}</td>
		                <td>${pm.pmthalassemiapositivewoman}</td>
		                <td>${pm.pmthalassemiapositivecouple}</td>
		                <td>${pm.pmhivexamineman}</td>
		               
		            	<td>${pm.pmhivexaminewoman}</td>
		                <td>${pm.pmhivinfectionman}</td>
		                <td>${pm.pmhivinfectionwoman}</td>
		                <td>${pm.pmsyphilisexamineman}</td>
		                <td>${pm.pmsyphilisexaminewoman}</td>
		                <td>${pm.pmsyphilisinfectionman}</td>
		                <td>${pm.pmsyphilisinfectionwoman}</td>
		                <td>${pm.pmhbsagexamineman}</td>
		                <td>${pm.pmhbsagexaminewomen}</td>
		                <td>${pm.pmhbsagpositiveman}</td>
		                
		            	<td>${pm.pmhbsagpositivewoman}</td>
		                <td>${pm.pmgonorrhoeaexamineman}</td>
		                <td>${pm.pmgonorrhoeaexaminewoman}</td>
		                <td>${pm.pmgonorrhoeapositiveman}</td>
		                <td>${pm.pmgonorrhoeapositivewoman}</td>
		                <td>${pm.pmtrichomonadexamine}</td>
		                <td>${pm.pmtrichomonadpositive}</td>
		                <td>${pm.pmmildewexamine}</td>
		                <td>${pm.pmmildewpositive}</td>
		          	</tr>
		         </c:forEach>
		         </c:when>
		         
		         
		         
		         <c:otherwise>
		        	 <tr>
		            	<td class="td_left" >-</td>
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
		         </c:otherwise>
		       	</c:choose>
		        </table>
		        <c:if test="${not empty pd && not empty pmList}">
		        <div class="page-header position-relative">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
					</tr>
				</table>
				</div>
				</c:if>
		    </div>
		</form>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
			
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		
		<script type="text/javascript">
		
		$(function() {
			//日期框
			$('.datepicker').datepicker({
				format: 'yyyy-mm',
				startView: 1,
				minViewMode: 1,//月
				language: 'zh-CN'
			});
			
			
			$('[name=conDt]').datepicker().on('changeDate', function(e) {
				$('form').submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			
			
			$('#upload').click(function() {
				var actionUrl = 'report/upload/insertPremaritalmonth';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=PremaritalMonth';
				var url = '<%=basePath%>report/upload?action=' + actionUrl + '&url=' + downloadUrl;
				layer.open({
					  type: 2,
					  title: 'EXCEL 导入到数据库',
					  shadeClose: true,
					  skin: 'layui-layer-lan',
					  shade: 0.2,
					  area: ['480px', '320px'],
					  content: url,
					  end: function() {
						  //窗口销毁后的回调
						  self.frameElement.contentWindow.location.reload(); 
					  }
				}); 
			});
		});
		
		
		$(function(){
			$(top.hangge());
		});
		</script>
	</body>
</html>

