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
<style>
*{ font-size:14px; color:#595959; font-family:"宋体";}
.clearfix{ clear:both;}
dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
h1{ font-size:16px; font-weight:bold;}
a{ text-decoration:none;}
input{ margin:0; padding:0;}
/*导航*/

.table li{ float:left; width:120px; line-height:24px; font-size:12Px; color:#4f99c6; text-align:center; border:1px #4f99c6 solid;}
.table li a{ color:#4f99c6;}
.table .l_yuanjiao{ border-radius:5px 0px 0px 5px;}
.table .r_yuanjiao{ border-radius:0px 5px 5px 0px; }
.table .this{ background-color:#4f99c6; color:#ffffff;}
.table .this a{color:#ffffff;}
.table .no_border{ border-right:none;}
.table li:hover{ background-color:#4f99c6; color:#ffffff;}
.table li:hover a{ color:#ffffff;}
.table .current{ background-color:#4f99c6; color:#ffffff;}

.mz_big_box{ /* border:1px #dedede solid;  */padding-top:0px; margin-top:0px; padding-bottom:20px;}
/*左边时间轴*/
.mz_left_box{ margin-left:50px; position:relative; float:left;}
.mz_left_box .mz_time1{ position:absolute; left:-10px; top:-17px;}
.mz_left_box .mz_time2{ position:absolute; left:-10px; top:417px;}
.mz_shijianzhou{ width:2px; height:420px; background-color:#dedede;}
/*右边单据*/
.mz_right_box{ float:left; margin-left:30px;}
.mz_right_box h1{ margin:0; margin-left:20px; margin-bottom:20px;}
.mz_danju{ background-color:#f2f2f2; border-radius:10px; border:1px #dedede solid; padding-left:20px; padding-right:20px; padding-bottom:30px; padding-top:30px; width:1130px;}
.mz_danju ul{ float:left;}
.mz_danju .mz_f_r{ float:right;}
.mz_danju li{ float:left; line-height:20px;}
.mz_first{ margin-bottom:40px;}
.mz_shurukuang135{ width:135px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;}
.mz_shurukuang150{ width:150px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;}
.mz_shurukuang164{  width:164px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;} 
.mz_ml214{ margin-left:214px;}
.mz_ml200{ margin-left:200px;}
.mz_mb20{ margin-bottom:20px;}
.mz_xuxian{ width:1130px; height:1px; background-image:url(imgs/mz_xuxian.png);}
.mz_jianchadanju{ background-image:url(imgs/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
.mz_suoluetu{ margin-top:20px;}
.mz_suoluetu li{ line-height:30px; margin-right:10px;}
.mz_suoluetu img{ cursor:pointer;}
.mz_ml40{ margin-left:40px;}
.mz_quanbuxiazai input{ border:none; font-size:12px; color:#4f99c6;margin-top:10px; outline:none; cursor:pointer;}
/*单据2*/
.mz_box2{ margin-top:47px;}
</style>
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">
	<ul class="table" style="margin-bottom:88px;">
        <li class="l_yuanjiao"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border this"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
     <c:forEach items="${uoList}" var="uo">
    <div class="mz_big_box">
    	<div class="mz_left_box">
        	<div class="mz_shijianzhou"></div>
            
			<img src="<%=basePath%>static/img/mz_time.png" class="mz_time1">
            <img src="<%=basePath%>static/img/mz_time.png" class="mz_time2">
        </div>
        <div class="mz_right_box">
        	<div class="mz_box1">
        	<h1>${uo.O_DATE}　　　${uo.HNAME}　${uo.ONAME}　${uo.DNAME}</h1>
        	<div class="mz_danju">
            	<dl>
                	<dd class="mz_first">
                    	<ul>
                        	<li>孕　　期：</li>
                            <li>第<input type="text" class="mz_shurukuang135" value="${uo.O_PREGNANCY}">周</li>
                            <div class="clearfix"></div>
                        </ul>
                        <ul class="mz_f_r">
                        	<li>产检类型：</li>
                            <li><input type="text" class="mz_shurukuang135" value="第${uo.O_CHECK}次产检"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
                    	<ul>
                        	<li>体　　重：</li>
                            <li><input type="text" class="mz_shurukuang150" value="${uo.O_WEIGHT}">kg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_ml214">
                        	<li>腹　　围：</li>
                            <li><input type="text" class="mz_shurukuang150" value="${uo.O_WAIST}">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_f_r">
                        	<li>胎　　心：</li>
                            <li><input type="text" class="mz_shurukuang164" value="${uo.O_HEART}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
                    	<ul>
                        	<li>血　　压：</li>
                            <li><input type="text" class="mz_shurukuang150" value="${uo.O_BLOOD}">mmhg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_ml200">
                        	<li>宫　　高：</li>
                            <li><input type="text" class="mz_shurukuang150" value="${uo.O_WOMB}">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <div class="clearfix"></div>
                    </dd>
                    <dd class="mz_jianchadanju">检查单据</dd>
                    <dd class="mz_xuxian"></dd>
                    <dd class="mz_suoluetu">
                    	<ul>
                        	<li><img src="<%=basePath%>static/images/neirong16px.png"></li>
                            <li>尿常规化验单.jpg</li>
                            <div class="clearfix"></div>
                        </ul>
                        <ul class="mz_ml40">
                        	<li><img src="<%=basePath%>static/images/neirong16px.png"></li>
                            <li>尿常规化验单.jpg</li>
                            <div class="clearfix"></div>
                        </ul>
                        <ul class="mz_ml40">
                        	<li><img src="<%=basePath%>static/images/neirong16px.png"></li>
                            <li>尿常规化验单.jpg</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    <dd class="mz_quanbuxiazai"><input type="submit" value="全部下载"></dd>
                </dl>
            </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    </c:forEach>
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
		</script>
	</body>
</html>

