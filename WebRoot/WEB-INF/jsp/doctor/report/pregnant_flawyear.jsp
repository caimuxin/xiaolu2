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
	<!-- jsp文件头和头部 -->
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
		<form action="report/flawyearlist.do" method="post" name="userInfoForm" id="userInfoForm">
		<div class="big_box">
    	<div class="xuanze_box">
            <ul>
            	<li style="margin-left: -25px;">
					<input type="text" name="conDt" value="${pd.conDt}" placeholder="选择年份" class="chose datepicker">
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
        
        <h1>出生缺陷发生情况(${pd.conDt})年报表</h1>
        <table class="biaoge" cellspacing="0" >
        	<tr>
            	<td class="td_left" rowspan="3">县（市、区）名称</td>
              	<td colspan="8">接产医疗机构数</td>
                <td rowspan="3">住院分娩围产儿数 </td>
                <td rowspan="2" colspan="2">出生缺陷儿数</td>
               	<td rowspan="2" colspan="11">≥28周出生缺陷儿主要的出生缺陷诊断</td>
                <td rowspan="2" colspan="2">诊断为缺陷后治疗性引产数</td>
                <td rowspan="2" colspan="2">≥28周出生缺陷儿畸形确诊时间</td>
                <td rowspan="2" colspan="4">≥28周出生缺陷儿转归</td>
            </tr>
            
            <tr>
             	<td rowspan="2">总数</td>
                <td colspan="4">其中：医院</td>
                <td colspan="3">其中：妇幼</td>
            </tr>
            
            <tr>
                <td>自治区级</td>
                <td>市级</td>
                <td>县（区）级</td>
                <td>乡镇级</td>
                <td>省级</td>
                <td>市级</td>
                <td>县（区）级</td>
                <td>≥28周</td>
                <td>＜28周</td>
                <td>无脑畸形</td>
                <td>脊柱裂</td>
                <td>脑膨出</td>
                <td>先天性脑积水</td>
                <td>腭裂</td>
                <td>唇裂</td>
                <td>唇裂合并腭裂</td>
                <td>唐氏综合征</td>
                <td>先天性心脏病</td>
                <td>胎儿水肿综合征</td>
                <td>其他</td>
                <td>≥28周</td>
                <td>＜28周</td>
                <td>产前</td>
                <td>产后7天</td>
                <td>活产</td>
                <td>死胎</td>
                <td>死产</td>
                <td>七天内死亡</td>
            </tr>
            <c:if test="${not empty pd && not empty fyList}">
       		<c:forEach items="${fyList}" var="fy">
        	<tr>
            	<td class="td_left" >${fy.bfcounties}</td>
                <td>${fy.bfsum}</td>
                <td>${fy.bfmunicipalityy}</td>
                <td>${fy.bfhospitalcity}</td>
                <td>${fy.bfhospitalcounty}</td>
                <td>${fy.bfhospitalvillage}</td>
                <td>${fy.bfwomendistrict}</td>
                <td>${fy.bfwomencity}</td>
                <td>${fy.bfwomencounty}</td>
                <td>${fy.bfdelivery}</td>
                
            	<td>${fy.bfflawgtday}</td>
                <td>${fy.bfflawltday}</td>
                <td>${fy.bfmalformation}</td>
                <td>${fy.bfrachischisis}</td>
                <td>${fy.bfharns}</td>
                <td>${fy.bfponding}</td>
                <td>${fy.bfcleftpalate}</td>
                <td>${fy.bfharelip}</td>
                <td>${fy.bfcleftpalateharelip}</td>
                <td>${fy.bfsyndrome}</td>
                
            	<td>${fy.bfcardiopathy}</td>
                <td>${fy.bfedema}</td>
                <td>${fy.bfother}</td>
                <td>${fy.bfgtcure}</td>
                <td>${fy.bfltcure}</td>
                <td>${fy.bfantenatal}</td>
                <td>${fy.bfpostpartum}</td>
                <td>${fy.bflivebirth}</td>
                <td>${fy.bfdeadfetus}</td>
                <td>${fy.bfstillbirth}</td>
                
                <td>${fy.bfpostpartumday}</td> 
          	</tr>
          	</c:forEach>
          	</c:if>
			
			
			 <c:if test="${empty pd || empty fyList}">
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
			 </tr>
			 </c:if>
			 
			     	
        </table>
        <c:if test="${not empty pd && not empty fyList}">
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
			$('.chose').datepicker({
				format:'yyyy',
				autoclose:true,
				startView: 2,
				maxViewMode:2,
				minViewMode:2
			});
			
			$('[name=conDt]').datepicker().on('changeDate', function(e) {
				$('form').submit();
		    });
			$('#print').click(function() {
				$('.big_box').print();
			});
			
			
			
			$('#upload').click(function() {
				var actionUrl = 'report/upload/insertFlawyear';
				var downloadUrl = '<%=basePath%>report/downExcel?excelName=FlawYear';
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
			top.hangge();
		});
		
		</script>
		
		
	</body>
</html>

