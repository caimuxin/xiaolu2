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
	</head>
	
<style>
*{ font-size:14px; color:#595959; font-family:"宋体";}
.clearfix{ clear:both;}
dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
h1{ font-size:16px; font-weight:bold; margin-left:20px; margin-top:40px; margin-bottom:10px;}
a{ text-decoration:none;}
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

.big_box{ border:#DEDEDE solid 1px; padding-top:20px; padding-left:20px; margin-top:20px; padding-bottom:30px;}
.xinxi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; padding-bottom:20px; width:1160px;}
.pic{ width:150px; height:200px; margin-left:20px;float:left;}
.pic img{ display:block;}
.tianxie{ float:left;}
.tianxie dl{padding-left:25px;}
.tianxie ul{ margin-left:25px; margin-right:25px; float:left;}
.tianxie li{ float:left; line-height:20px;}
.tianxie dd{ margin-top:20px; margin-bottom:20px;}
.tianxie select{ width:360px; height:32px; outline:none;}
.shurukuang360 input{ border:none;border-bottom:1px #cccccc solid; width:360px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang120 input{ border:none;border-bottom:1px #cccccc solid; width:120px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang851 input{ border:none;border-bottom:1px #cccccc solid; width:845px; height:20px; background:none; outline:none; line-height:14px;}
/*孕产信息*/
.yunchanxinxi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; padding-left:20px; padding-right:20px; padding-bottom:20px; width:1120px;}
.yunchanxinxi ul{ float:left;}
.yunchanxinxi .f_r{ float:right;}
.yunchanxinxi li{ float:left; line-height:20px;}
.yunchanxinxi dd{ margin-bottom:20px;}
.shurukuang375 input{  border:none;border-bottom:1px #cccccc solid; width:375px; height:20px; background:none; outline:none; line-height:14px; }
.yuchanqi{ color:#4f99c6; font-weight:bold;}
.yuchaqi_time{ color:#4f99c6; font-weight:bold;}
/*既往史*/
.jiwangshi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; padding-left:20px; padding-right:20px; padding-bottom:20px; width:1120px;}
.m_l50{ margin-left:50px;}
.shurukuang666{ border:none;border-bottom:1px #cccccc solid; width:666px; height:20px; background:none; outline:none; line-height:14px; margin-left:18px;}
.jiwangshi dd{ margin-bottom:20px;}
.but2{
	background-color:#428bca;
	color:#ffffff;
	border:none;
	width:42px;
	height:30px;
	text-shadow:0px -1px 0px #356fa2;
	cursor:pointer;
	font-size:12px;
	margin-top:20px;
	margin-left:20px;
	}
.but2:hover{ background-image:url(../imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}

input{readonly:readonly;}
</style>

<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">

 <ul class="table">
        <li class="l_yuanjiao this"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
	<div class="big_box">
    
    	<div class="xinxi">
        
        	<div class="pic">
            <img src="<%=basePath%>uploadFiles/uploadImgs/${pd.u_photo}" width=139px; height=180px;	>
            </div>
            
            <div class="tianxie">
            	<dl>
<!--姓名 出生日期-->
                    <dd>
                    	<ul>
                        	<li>姓　　名：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.user_namezs}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>出生日期：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.u_birthday}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--性别 身高 手机-->
                    <dd>
                    	<ul>
                        	<li>性　　别：</li>
                            <li class="shurukuang120"><input type="text" value="${pd.u_sex }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>身　　高：</li>
                            <li class="shurukuang120"><input type="text" value="${pd.u_height}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>手　　机：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.phone }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--证件类型 证件号码-->
					    <dd>
                    	<ul>
                        	<li>证件类型：</li>
								<li class="shurukuang360"><input type="text" value="${pd.u_papertype }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>证件号码：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.u_papernum }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                       <dd>
                    	<ul>
                        	<li>医生所在机构：</li>
                            <li class="shurukuang120">
							<c:forEach items="${psList}" var="ps">
                   	    	<c:if test="${ps.id==pd.hospital_id}">
                   	    		<c:set value="${ps.hospitalname}" var="hospitalname"></c:set>
                   	    	</c:if>
                   	    	</c:forEach>
                            <input type="text" value="${hospitalname}">
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>家庭医生：</li>
                            <li class="shurukuang360">
                            <c:forEach items="${dcList}" var="dc">
	                   	    	<c:if test="${pd.doctor_id==dc.doctor_id}">
									<c:set value="${dc.doctor_name}" var="doctorname"></c:set>
								</c:if>
	                   	    </c:forEach>
                            <input type="text" value="${doctorname}">
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>

<!--家庭住址-->
					<dd>
                        <ul>
                        	<li>家庭地址：</li>
                            <li class="shurukuang851"><input type="text" value="${pd.u_address }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                </dl>	

            </div>
        	<div class="clearfix"></div>
        </div>
<!--孕产信息-->
	<h1>孕产信息</h1>
		<div class="yunchanxinxi">
            <dl>
                <dd>
                            <ul>
                                <li class="yuchanqi">本次预产期：</li>
                                <li class="shurukuang360"><input type="text" value="${pd.u_duedate }" class="yuchaqi_time"></li>
                                <div class="clearfix"></div>
                            </ul>
                            
                            <ul class="f_r">
                                <li>孕　　次：</li>
                                <li class="shurukuang375"><input type="text" value="${pd.u_preg_all}"></li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </dd>
                        
                        <dd>
                            <ul>
                                <li>阴道分娩：</li>
                                <li class="shurukuang360"><input type="text" value="${pd.u_preg_zr}"></li>
                                <li>次</li>
                                <div class="clearfix"></div>
                            </ul>
                            
                            <ul class="f_r">
                                <li>剖宫分娩：</li>
                                <li class="shurukuang360"><input type="text" value="${pd.u_preg_pf }"></li>
                                <li>次</li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </dd>
                   </dl>
        
        </div>
<!--既往史-->
		<h1>既往史</h1>
        <div class="jiwangshi" id="uPast">
			<dl>
            	<dd>
                      <span><input type="checkbox" value="无" name="ids" id="j0">1：无</span>
                      <span><input type="checkbox" class="m_l50" value="心脏病" name="ids" id="j1">2：心脏病</span>
                      <span><input type="checkbox" class="m_l50" value="肾脏疾病" name="ids" id="j2">3：肾脏疾病</span>
                      <span><input type="checkbox" class="m_l50" value="肝脏疾病" name="ids" id="j3">4：肝脏疾病</span>
                      <span><input type="checkbox" class="m_l50" value="高血压" name="ids" id="j4">5：高血压</span>
                      <span><input type="checkbox" class="m_l50" value="贫血" name="ids" id="j5">6：贫血</span>
                     <span> <input type="checkbox" class="m_l50" value="糖尿病" name="ids" id="j6">7：糖尿病</span>
                </dd>
                <dd>
                	<input type="checkbox" onclick="selectAll()" id="zcheckbox">8：其他<input type="text" id="q1" readonly="true" class="shurukuang666" style="border:none;border-bottom:1px #cccccc solid; width:666px; height:32px; background:none; outline:none; line-height:14px; ">
                </dd>
            </dl>
        </div>
<!--家族及个人史-->
				<h1>家族及个人史</h1>
        <div class="jiwangshi" id="uFamily">
			<dl>
            	<dd>
                    <span><input type="checkbox" value="遗传性疾病史" name="idss" id="j11">1：遗传性疾病史</span>
                    <span><input type="checkbox" class="m_l50" value="精神疾病史" name="idss" id="j22">2：精神疾病史</span>
                    <span><input type="checkbox" class="m_l50" value="吸烟" name="idss" id="j33">3：吸烟</span>
                    <span><input type="checkbox" class="m_l50" value="饮酒" name="idss" id="j44">4：饮酒</span>
                    <span> <input type="checkbox" class="m_l50" value="服用药物" name="idss" id="j55">5：服用药物</span>
                    <span> <input type="checkbox" class="m_l50" value="接触有毒有害物质" name="idss" id="j66">6：接触有毒有害物质</span>
                    <span><input type="checkbox" class="m_l50" value="接触放射线" name="idss" id="j77">7：接触放射线</span>
                </dd>
                <dd>
                	<input type="checkbox" onclick="selectAlls()" id="zcheckboxs">8：其他<input id="q2" readonly="true" type="text" class="shurukuang666" style="border:none;border-bottom:1px #cccccc solid; width:666px; height:32px; background:none; outline:none; line-height:14px; ">
                </dd>
            </dl>
        </div>
        <input class="but2"  type="button" value="返回" onclick="fan()">
    </div>
    
</div>	


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
		$(function() {
		//页面加载时远中相关的既往史
		 var obj='${pd.u_past}';
		 var obs=obj.split(",");
		 for(var i = 0;i < obs.length; i++) {
			 $("#uPast span input[type=checkbox]").each(function(){
					if(obs[i]==$(this).val()){
						$(this).attr("checked","true"); 
						}
					});
		 }
		//页面加载时远中相关的家族史 
		 var objs='${pd.u_family}';
		 var obss=objs.split(",");
		 for(var i = 0;i < obss.length; i++) {
			 $("#uFamily span input[type=checkbox]").each(function(){
					if(obss[i]==$(this).val()){
						$(this).attr("checked","true"); 
						}
					});
		 }
		 
		 if(document.getElementById("j0").checked || document.getElementById("j1").checked || document.getElementById("j6").checked ||
		    document.getElementById("j2").checked || document.getElementById("j3").checked || document.getElementById("j4").checked || document.getElementById("j5").checked){
			 
		 }else{
			 $("#q1").val('${pd.u_past}');
			 $('#zcheckbox').attr("checked",true);
			 $("#q1").attr("readonly",false);
		 }
		 
		 if(document.getElementById("j11").checked || document.getElementById("j66").checked || document.getElementById("j77").checked ||
			document.getElementById("j22").checked || document.getElementById("j33").checked || document.getElementById("j44").checked || document.getElementById("j55").checked){
				 
		 }else{
				 $("#q2").val('${pd.u_family}');
				 $('#zcheckboxs').attr("checked",true);
				 $("#q2").attr("readonly",false);
		 }
		 
		 $("input").attr("readonly",true); 
		});
		
		function fan(){
			location.href=history.go(-1);
		}
	</script>
</body>
</html>

