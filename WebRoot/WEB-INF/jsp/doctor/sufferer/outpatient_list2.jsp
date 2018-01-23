﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

.mz_big_box{ border:1px #dedede solid; padding-top:30px; margin-top:20px; padding-bottom:20px;}
/*左边时间轴*/
.mz_left_box{ margin-top:12px; position:relative; float:left;}
.mz_left_box .mz_time1{ position:absolute; left:-10px; top:-17px;}
.mz_left_box .mz_time2{ position:absolute; left:-10px; top:463px;}
.mz_left_box .mz_time3{ position:absolute; left:-10px; top:905px;}
.mz_shijianzhou{ width:2px; height:410px; background-color:#dedede;}
.mz_shijianzhou2{ width:2px; height:480px; background-color:#dedede;}
/*右边单据*/
.mz_right_box{ float:left; margin-left:0px; padding-left:50px;}
.mz_right_box h1{ margin:0; margin-left:20px; margin-bottom:20px;}
.mz_danju{ background-color:#f2f2f2; border-radius:10px; border:1px #dedede solid; padding-left:20px; padding-right:20px; padding-bottom:30px; padding-top:30px; width:1190px;}
.mz_danju ul{ float:left;}
.mz_danju .mz_f_r{ float:right; padding-right:540px;}

.mz_danju li{ float:left; line-height:20px;}
.mz_first{ margin-bottom:40px;}
.mz_shurukuang135{ width:135px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;}
.mz_shurukuang150{ width:150px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;}
.mz_shurukuang164{  width:164px; border:none; border-bottom:1px #cccccc solid; background:none; outline:none;} 
.mz_ml214{ margin-left:181px;}
.mz_ml200{ margin-left:168px;}
.mz_mb20{ margin-bottom:36px;}
.mz_mb20 .mz_f_r{ float:right; padding-right:84px;}
.mz_xuxian{ width:1130px; height:1px; background-image:url(static/img/mz_xuxian.png);}
.mz_jianchadanju{ background-image:url(static/img/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
.mz_suoluetu{ margin-top:20px; padding-left:81px;}
.mz_suoluetu li{ line-height:30px; margin-right:10px;}
.mz_suoluetu img{ cursor:pointer;}
.mz_quanbuxiazai{padding-left:81px;}
.mz_quanbuxiazai a{ border:none; font-size:12px; color:#4f99c6;margin-top:10px; outline:none; cursor:pointer;}
/*单据2*/
/*门诊时间的选择*/
.sj_shurukuang{ border:1px solid #dedede; width:180px; font-size:14px; line-height:30px; padding-left:10px;/*  color:#cccccc; background-color:#fff ;*/}
.mz_xuanzekuang img{ float:right; position:absolute; margin-left:-30px; margin-top:7px;}
.yiyuan_shurukuang{ border:1px solid #dedede; width:280px; font-size:14px; line-height:30px; padding-left:10px; height: 35px; /* color:#cccccc; background-color:#fff; */}
.mz_yiyuan,.mz_keshi,.mz_yisheng{ margin-left:20px;}
.mz_yiyuan img{ float:right; position:absolute; margin-left:-22px; margin-top:14px;}
.keshi_shurukuang{ border:1px solid #dedede; width:150px; font-size:14px; line-height:30px; padding-left:10px; height: 35px; /* color:#cccccc; background-color:#fff; */}
.mz_keshi img{ float:right; margin-left:-22px; margin-top:14px; position:absolute;}
.yisheng_shurukuang{ border:1px solid #dedede; width:140px; font-size:14px; line-height:30px; padding-left:10px; height: 35px; /* color:#cccccc; background-color:#fff; */}
.mz_xuanzekuang{ margin-bottom:30px;}
/*按钮*/
.btn_bianji{border:none;color:#ffffff;width:42px;height:30px;background-color:#428bca;text-shadow:0px -1px 0px #a74939;cursor:pointer;font-size:12px;}
.btn_shanchu{border:none;color:#ffffff;width:42px;height:30px;text-shadow:0px -1px 0px #a74939;cursor:pointer;font-size:12px;background-color:#d15b47;}
.btn_baocun{border:none;color:#ffffff;width:42px;height:30px;background-color:#428bca;text-shadow:0px -1px 0px #a74939;cursor:pointer;font-size:12px;}
.btn{ height:30px; margin-bottom:10px;}
.btn h1{ float:left; line-height:30px;}
.btn .btn_bianji{ float:left; margin-left:650px;}
.btn .btn_bianji1{ float:left; margin-left:700px;}
.btn_bianji1{border:none;color:#ffffff;width:42px;height:30px;background-color:#428bca;text-shadow:0px -1px 0px #a74939;cursor:pointer;font-size:12px;}
.btn .btn_shanchu{ float:right; margin-right:10px;}
.btn_baocun{ float:right; margin-right:10px; margin-bottom:10px;}
/*新增*/
.xinzeng{ background-color:#f2f2f2; border-radius:10px; border:1px #dedede solid; padding-left:20px; padding-right:20px; padding-bottom:30px; padding-top:30px; width:1190px; height:410px; position:relative; margin-left:30px;}
.xinzeng img{ position:absolute;top:30%; left:40%;}

.box1_1{ float:left; margin-left:30px;}
.box2_2{ float:left; margin-left:30px;}
.over {position: fixed; left:0; top:0; width:100%; z-index:100;}  
.tempContainer {position:fixed; width:100%; margin-right:0px; margin-left:0px; text-align:center; z-index:101;}  
</style>



</head>
<body>
	<ul class="table">
        <li class="l_yuanjiao"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
		<li class="no_border this"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
		<li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
		<li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
		<li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
		<div class="clearfix"></div>
	</ul>
    
    <div class="mz_big_box">
        <div class="mz_right_box">
        
        
        	
        
        	<c:forEach items="${uoList}" var="uo">
        	<div class="mz_box1">
            <div class="mz_left_box">
        	<div class="mz_shijianzhou"></div>
			<img src="static/img/mz_time.png" class="mz_time1">
            <div class="clearfix"></div>
        	</div> 
            <div class="box1_1">
            <div class="btn">
            <h1>${uo.dates }&nbsp&nbsp<c:if test="${uo.times > 12}">下午</c:if><c:if test="${uo.times <= 12}">上午</c:if>&nbsp&nbsp${uo.HNAME}&nbsp&nbsp${uo.ONAME}&nbsp&nbsp${uo.DNAME}</h1>
            <input type="button" value="编辑" id="bj${uo.ID}" class="btn_bianji upd" onclick="bianji(${uo.ID})">
            <input type="button" value="保存" id="bc${uo.ID}" class="btn_bianji baocun" onclick="update('${uo.ID}')" hidden="hidden">
            <input type="button" value="删除" class="btn_shanchu" onclick="queren('${uo.ID}')"> 
            <div class="clearfix"></div>
            </div>
        	<div class="mz_danju">
            	<dl>
                	<dd class="mz_first">
                    	<ul>
                        	<li>孕　　期：</li>
                            <li>第<input type="text" class="mz_shurukuang135" id="yq${uo.ID}" value="${uo.O_PREGNANCY}" name="o_pregnancys">周</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_f_r">
                        	<li>产　　检：</li>
                            <li>第<input type="text"  class="mz_shurukuang135" id="cj${uo.ID}" value="${uo.O_CHECK}" name="o_checks">次</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
                    	<ul>
                        	<li>体　　重：</li>
                            <li><input type="text" class="mz_shurukuang150" id="tz${uo.ID}" value="${uo.O_WEIGHT}" name="ae">kg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_ml214">
                        	<li>腹　　围：</li>
                            <li><input type="text" class="mz_shurukuang150" id="fw${uo.ID}" value="${uo.O_WAIST}" name="o_checks">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_f_r">
                        	<li>胎　　心：</li>
                            <li><input type="text" class="mz_shurukuang164" id="tx${uo.ID}" value="${uo.O_HEART}" name="o_checks">bpm</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
                    	<ul>
                        	<li>血　　压：</li>
                            <li><input type="text" class="mz_shurukuang150" id="xy${uo.ID}" value="${uo.O_BLOOD}" name="o_checks">mmhg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_ml200">
                        	<li>宫　　高：</li>
                            <li><input type="text" class="mz_shurukuang150" id="gg${uo.ID}" value="${uo.O_WOMB}" name="o_checks">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <div class="clearfix"></div>
                    </dd>
                    <dd class="mz_jianchadanju">检查单据：</dd>
                    <dd class="mz_xuxian"></dd>
                    <dd class="mz_suoluetu">
                    	<ul>
                        	<li>
                        	
                        	<!-- <img src="static/img/mz_suoluetu.png"> -->
                        	
                        <div class="over"></div><!--背景层-->  
						<div class="logoImg amplifyImg"><!--注意：此处的amlifyImg不可少-->  
						      <img alt="单据" src="<%=basePath%>uploadFiles/uploadImgs/${uo.O_ATTACHMENT}" width="70px;" height="39px;" style="cursor:pointer;">
						</div>  
                        	
                        	</li>
                            <li>常规化验单.jpg</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    <dd class="mz_quanbuxiazai">
<!--                     <input type="submit" value="全部下载">
 -->                     <a href="<%=basePath%>uploadFiles/uploadImgs/${uo.O_ATTACHMENT}" download="住院单据.png">全部下载</a>
                  <!--   <img src="static/img/mz_quanbuxiazai.png" alt="下载图标"> -->
                    </dd>
                </dl>
            </div>
            </div>
             <div class="clearfix"></div>
            </div>
            </c:forEach>


            
            
            
            
			<form action="uoutpatientController/addOutpatient.do" method="post" name="uoutpatientForm" id="uoutpatientForm" enctype="multipart/form-data">
            <div class="mz_box2">
			<input type="hidden" id="uuid" name="uuid" value="${pd.uuid}">
            <div class="mz_left_box">
        	<div class="mz_shijianzhou2"></div>
			<img src="static/img/mz_time.png" class="mz_time1">
			<img src="static/img/mz_time.png" class="mz_time2">
        	</div> 
            <div class="box2_2">
            <div class="btn">
            <input type="button" value="保存" class="btn_baocun" onclick="savaUoutpatient()">
            <div class="clearfix"></div>
            </div>
        	<div class="mz_danju">
            	<dl>
                	   <dd class="mz_xuanzekuang">
                    	<ul>
                        	<li>门诊时间：
                        	<input id="o_date" name="o_date" type="datetime-local" class="sj_shurukuang">
                        	</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                    	<ul class="mz_yiyuan">	
                        	<li>所属医院：
							<select id="hospital_id" name="hospital_id" class="yiyuan_shurukuang" onchange ="findOfficeByHospitalId(this.options[this.options.selectedIndex].value);">
							<option value="">请选择</option>
							<c:forEach items="${hoList}" var="ho">
								<option value="${ho.id}">${ho.hospitalname}</option>
							</c:forEach>
							</select>                	
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                    	<ul class="mz_keshi">
                        	<li>选择科室：

                      	<select id="selectOffice" name="office_id" class="keshi_shurukuang" onchange ="findDoctorByOfficeId(this.options[this.options.selectedIndex].value);">
									<option value="">请选择</option>
						</select>  
                        	</li>
                            <div class="clearfix"></div>
                        </ul>
                         <ul class="mz_yisheng">
                        	<li>门诊医生：
						     <select id="doctorId" name="doctor_id" class="yisheng_shurukuang">
								<option value="">请选择</option>
							</select>  	
 							</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                	<dd class="mz_first">
                		<ul>
      				     	<li>孕　　期：</li>
                            <li>第<input id="o_pregnancy" name="o_pregnancy" type="text" class="mz_shurukuang135">周</li>
                            <div class="clearfix"></div>
                        </ul>
                        <ul class="mz_f_r">
                  			<li>产　　检：</li>
                            <li>第<input id="o_check" name="o_check" type="text" class="mz_shurukuang135">次</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
                 	  <ul>
     						<li>体　　重：</li>
                            <li><input id="o_weight" name="o_weight" type="text" class="mz_shurukuang150">kg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul class="mz_ml214">
                        <li>腹　　围：</li>
                            <li><input id="o_waist" name="o_waist" type="text" class="mz_shurukuang150">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                         <ul class="mz_f_r">
                         	<li>胎　　心：</li>
                            <li><input id="o_heart" name="o_heart" type="text" class="mz_shurukuang164">bpm</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                    <dd class="mz_mb20">
       					<ul>
                    	<li>血　　压：</li>
                            <li><input id="o_blood" name="o_blood" type="text" class="mz_shurukuang150">mmhg</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                       <ul class="mz_ml200">
                        <li>宫　　高：</li>
                            <li><input id="o_womb" name="o_womb" type="text" class="mz_shurukuang150">cm</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <div class="clearfix"></div>
                    </dd>
                    <dd class="mz_jianchadanju">检查单据：</dd>
                    <dd class="mz_xuxian"></dd>
                    <dd class="mz_suoluetu">
                        <ul class="mz_ml40">
                            <li>
                               <input type="file" id="tp" name="tp" onchange="fileType(this)"/>
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                </dl>
            </div>
            </div>
             <div class="clearfix"></div>
            </div> 
            </form>
      

      
      
      
        </div>
        <div class="clearfix"></div>
    </div>







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
		function search() {
			top.jzts();
			$("#userInfoForm").submit();
		}
		
		$(function(){
			$(".mz_box1 .mz_shurukuang135").attr("readonly",true);
			$(".mz_box1 .mz_shurukuang150").attr("readonly",true);
			$(".mz_box1 .mz_shurukuang164").attr("readonly",true);
		});
		
		
		function bianji(id){
			
			$('#yq'+id).attr("readonly",false);
			$('#cj'+id).attr("readonly",false);
			$('#tz'+id).attr("readonly",false);
			$('#fw'+id).attr("readonly",false);
			$('#tx'+id).attr("readonly",false);
			$('#xy'+id).attr("readonly",false);
			$('#gg'+id).attr("readonly",false);
			 $("#yq"+id).focus();
			 $("#yq"+id).select();
			
			$("#bc"+id).removeAttr("hidden");
			$("#bj"+id).attr("hidden","hidden");
		}
		
	</script>
	
	
	<script type="text/javascript">
	//所属医院的下拉款触发事件
	function findOfficeByHospitalId(hospitalId){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>doctorManage/officeOption.do',
		    	data: {hospitalId:hospitalId},
				dataType:'json',
				cache: false,
				success: function(data){
					 var select = document.getElementById("selectOffice");
					 	select.options.length=0; 
					 	$("#selectOffice").append("<option select>请选择</option>");
					 	$.each(data.list, function(i, office){
				        	$("#selectOffice").append("<option value='"+office.officeId+"'>"+office.officeName+"</option>");
						 });
					}
			});
		};
		
		//所属科室的下拉款触发事件
	 function findDoctorByOfficeId(officeId){
				$.ajax({
					type: "POST",
					url: '<%=basePath%>uoutpatientController/officeOptions.do',
			    	data: {office_id:officeId},
					dataType:'json',
					cache: false,
					success: function(data){
						 var select = document.getElementById("doctorId");
						 	select.options.length=0; 
						 	$("#doctorId").append("<option select>请选择</option>");
						 	$.each(data.list, function(i, doc){
					        	$("#doctorId").append("<option value='"+doc.doctor_id+"'>"+doc.doctor_name+"</option>");
							 });
						}
				});
			};
			
	function savaUoutpatient(){
		
		if($("#o_date").val()==""){
			$("#o_date").tips({
				side:3,
	            msg:'请输入门诊时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#o_date").focus();
			return false;
		}
		
		
		if($("#hospital_id").val()==""){
			$("#hospital_id").tips({
				side:3,
	            msg:'请输选择医院',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#hospital_id").focus();
			return false;
		}
		
		if($("#selectOffice").val()==""){
			$("#selectOffice").tips({
				side:3,
	            msg:'请选择科室',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#selectOffice").focus();
			return false;
		}
		
		if($("#doctorId").val()==""){
			$("#doctorId").tips({
				side:3,
	            msg:'请选择医生',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctorId").focus();
			return false;
		}
		
		if($("#o_pregnancy").val()==""){
			$("#o_pregnancy").tips({
				side:3,
	            msg:'请输入孕期次数',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_pregnancy").focus();
			return false;
		}
		
		if($("#o_check").val()==""){
			$("#o_check").tips({
				side:3,
	            msg:'请输入产检次数',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_check").focus();
			return false;
		}
		
		if($("#o_weight").val()==""){
			$("#o_weight").tips({
				side:3,
	            msg:'请输入体重',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_weight").focus();
			return false;
		}
		
		if($("#o_waist").val()==""){
			$("#o_waist").tips({
				side:3,
	            msg:'请输入腹围',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_waist").focus();
			return false;
		}
		
		if($("#o_heart").val()==""){
			$("#o_heart").tips({
				side:3,
	            msg:'请输入胎心',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_heart").focus();
			return false;
		}
		
		if($("#o_blood").val()==""){
			$("#o_blood").tips({
				side:3,
	            msg:'请输入血压',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_blood").focus();
			return false;
		}
		
		if($("#o_womb").val()==""){
			$("#o_womb").tips({
				side:3,
	            msg:'请输入宫高',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#o_womb").focus();
			return false;
		}
		
		$("#uoutpatientForm").submit();
	}
	
	function update(id,uuid){
		
		var yq=($('#yq'+id).val());
		var cj=($('#cj'+id).val());
		var tz=($('#tz'+id).val());
		var fw=($('#fw'+id).val());
		var tx=($('#tx'+id).val());
		var xy=($('#xy'+id).val());
		var gg=($('#gg'+id).val());
		
		
		$.ajax({
			type: "POST",
			url: '<%=basePath%>uoutpatientController/updOutpatient.do',
	    	data: {id:id,o_pregnancy:yq,o_check:cj,o_weight:tz,o_waist:fw,o_heart:tx,o_blood:xy,o_womb:gg,user_id:uuid},
			dataType:'json',
			cache: false,
			success: function(data){
				window.location.reload();
			}
		});
	};
	
	//删除
	function del(id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>uoutpatientController/delOutpatient.do?id="+id;
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		});
	}
	
	//删除门诊记录
	function queren(id){
	var se=confirm("是否删除该门诊记录？");
	if (se==true)
	  {
		window.location.href="<%=basePath%>uoutpatientController/delOutpatient.do?id="+id+"&uuid=${pd.uuid}";
	  }
	}
	</script>
	
	<script type="text/javascript">
	$(function (){
		
		var imgsObj = $('.amplifyImg img');//需要放大的图像  
		   if(imgsObj){  
		    $.each(imgsObj,function(){  
		        $(this).click(function(){  
		            var currImg = $(this);  
		            coverLayer(1);  
		            var tempContainer = $('<div class=tempContainer></div>');//图片容器  
		            with(tempContainer){//width方法等同于$(this)  
		                appendTo("body");  
		                var windowWidth=$(window).width();  
		                var windowHeight=$(window).height();  
		                //获取图片原始宽度、高度  
		                var orignImg = new Image();  
		                orignImg.src =currImg.attr("src") ;  
		                var currImgWidth= orignImg.width;  
		                var currImgHeight = orignImg.height;  
		                if(currImgWidth<windowWidth){//为了让图片不失真，当图片宽度较小的时候，保留原图  
		                    if(currImgHeight<windowHeight){  
		                        var topHeight=(windowHeight-currImgHeight)/2;  
		                        if(topHeight>35){/*此处为了使图片高度上居中显示在整个手机屏幕中：因为在android,ios的微信中会有一个title导航，35为title导航的高度*/  
		                            topHeight=topHeight-35;  
		                            css('top',topHeight);  
		                        }else{  
		                            css('top',0);  
		                        }  
		                        html('<img border=0 src=' + currImg.attr('src') + '>');  
		                    }else{  
		                        css('top',0);  
		                        html('<img border=0 src=' + currImg.attr('src') + ' height='+windowHeight+'>');  
		                    }  
		                }else{  
		                    var currImgChangeHeight=(currImgHeight*windowWidth)/currImgWidth;  
		                    if(currImgChangeHeight<windowHeight){  
		                        var topHeight=(windowHeight-currImgChangeHeight)/2;  
		                        if(topHeight>35){  
		                            topHeight=topHeight-35;  
		                            css('top',topHeight);  
		                        }else{  
		                            css('top',0);  
		                        }  
		                        html('<img border=0 src=' + currImg.attr('src') + ' width='+windowWidth+';>');  
		                    }else{  
		                        css('top',0);  
		                        html('<img border=0 src=' + currImg.attr('src') + ' width='+windowWidth+'; height='+windowHeight+'>');  
		                    }  
		                }  
		            }  
		            tempContainer.click(function(){  
		                $(this).remove();  
		                coverLayer(0);  
		                });
		        });  
		    });  
		   }  
		   else{  
		    return false;  
		   }  
	});
		
		   //使用禁用蒙层效果  
		   function coverLayer(tag){  
		    with($('.over')){  
		        if(tag==1){  
		            css('height',$(document).height());  
		            css('display','block');  
		            css('opacity',1);  
		            css("background-color","#191919");  
		        }  
		        else{  
		            css('display','none');  
		        }  
		    }  
		   }  
		
		</script>
</body>
</html>

