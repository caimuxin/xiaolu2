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
<meta charset="utf-8" />
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

.ysgl_jbxx_big_box{ border:#DEDEDE solid 1px; padding-top:20px; padding-left:20px; margin-top:20px; padding-bottom:30px;}
.ysgl_jbxx_xinxi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; width:1140px; padding-left:20px; padding-right:20px;}
.pic{ width:150px; height:200px;float:left;}
.pic img{ display:block;}
.ysgl_jbxx_left_box{ float:left;}
.ysgl_jbxx_tianxie{ float:left;}
.ysgl_jbxx_tianxie dl{padding-left:25px;}
.ysgl_jbxx_tianxie ul{ margin-left:25px; margin-right:25px; float:left;}
.ysgl_jbxx_tianxie li{ float:left; line-height:20px;}
.ysgl_jbxx_tianxie dd{ margin-top:20px; margin-bottom:40px;}
.ysgl_jbxx_tianxie select{ width:360px; height:30px; outline:none;}
.shurukuang360 input{ border:none;border-bottom:1px #cccccc solid; width:360px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang120 input{ border:none;border-bottom:1px #cccccc solid; width:120px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang851 input{ border:none;border-bottom:1px #cccccc solid; width:845px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang346 input{ border:none;border-bottom:1px #cccccc solid; width:346px; height:20px; background:none; outline:none; line-height:14px;}
.zhicheng li{ float:left; margin-top:20px; margin-bottom:20px;}
.zhicheng select{ width:105px; height:30px;}
.lianxidizhi li{ float:left; margin-bottom:40px;}
.shurukuang1040 input{ border:none;border-bottom:1px #cccccc solid; width:1040px; height:20px; background:none; outline:none; line-height:14px;}
.shurukuang105 input{  border:none;border-bottom:1px #cccccc solid; width:105px; height:20px; background:none; outline:none; line-height:14px;}
.jianjie li{ float:left; margin-bottom:40px; line-height:24px}
.jianjie .jieshao{ width:1040px; line-height:24px;}
/*保存返回*/
.baocunfanhui{ margin-top:20px; margin-left:20px;}
.but1{
	border:none;
	color:#ffffff;
	width:42px;
	height:30px;
	background-color:#D15B47;
	text-shadow:0px -1px 0px #a74939;
	cursor:pointer;
	font-size:12px;
	}
.but1:hover{ background-image:url(../imgs/bg_shanchu.png); background-repeat:no-repeat; background-position:center;}
.but2{
	background-color:#428bca;
	color:#ffffff;
	border:none;
	width:42px;
	height:30px;
	text-shadow:0px -1px 0px #356fa2;
	cursor:pointer;
	font-size:12px;
	}
.but2:hover{ background-image:url(../imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
</style>
</head>
<body>

	 <ul class="table">
        <li class="l_yuanjiao this"><a href="<%=basePath%>doctorManage/toUpdDoctors.do?doctor_id=${pd.doctor_id}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>doctorManage/toDisease.do?doctor_id=${pd.doctor_id}">病患记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>MedFollowLnglat/listPageMedFollow.do?doctor_id=${pd.doctor_id}">随访轨迹</a></li>
        <div  class="clearfix"></div>
	</ul>
	<div class="ysgl_jbxx_big_box">
    
    	<div class="ysgl_jbxx_xinxi">
        	<div class="ysgl_jbxx_center_box">
                <div class="ysgl_jbxx_left_box">
                    <div class="pic">
                    <img src="<%=basePath%>uploadFiles/uploadImgs/${pd.doctor_photo }" width=139px; height=180px;	>
                    </div>
                    <ul class="zhicheng">
                       <li>职称：</li>
                       <li class="shurukuang105">
                       		<input type="text" value="${pd.doctor_position }">
                       </li>
                       <div class="clearfix"></div>
                   </ul>
                   <ul class="zhicheng">
                       <li>工龄：</li>
                       <li class="shurukuang105">
                       		<input type="text" value="${pd.doctor_work}年">
                       </li>
                       <div class="clearfix"></div>
                    </ul>
                </div>
            
            <div class="ysgl_jbxx_tianxie">
            	<dl>
<!--姓名 出生日期-->
                    <dd>
                    	<ul>
                        	<li>姓　　名：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.doctor_name}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>出生日期：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.doctor_birth}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--性别 联系方式-->
                    <dd>
                    	<ul>
                        	<li>性　　别：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.doctor_sex}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        
                        <ul>
                        	<li>联系方式：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.doctor_phone}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--证件类型 证件号码-->
					    <dd>
                    	<ul>
                        	<li>证件类型：</li>
							<li class="shurukuang360"><input type="text" value="${pd.d_papertype }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>证件号码：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.d_papernum}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--教育程度 执业证日期-->
					    <dd>
                    		<ul>
                        	<li>教育程度：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.doctor_education }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>执业证日期：</li>
                            <li class="shurukuang346"><input type="text" value="${pd.d_award}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    <dd>
                    	<ul>
                        	<li>所在医院：</li>
							<li class="shurukuang360">
							<c:forEach items = "${hOption}" var ="hospital">
                                   <c:if test="${hospital.hospitalId==pd.hospital_id}"><input type="text" value="${hospital.hospitalName}"></c:if>
                             </c:forEach>
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>所在科室：</li>
							<li class="shurukuang360">
							<c:forEach items = "${OOption}" var ="office">
                                    <c:if test="${office.officeId==pd.office_id}"><input type="text" value="${office.officeName }"></c:if>
                            </c:forEach>
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    	</dd>
                    
                		</dl>	

            		</div>
            		<div class="clearfix"></div>
            	</div>
                <dl>
                    <!-- <dd  class="lianxidizhi">
                        <ul>
                           <li>联系地址：</li>
                           <li class="shurukuang1040"><input type="text" value="深圳市龙岗区坂田民营市场和磡路8号505室" hidden="hidden"></li>
                           <div class="clearfix"></div>
                        </ul>
                    </dd> -->
                    <dd class="jianjie">
                    	<ul>
							<li>简　　介：</li>
                            <li class="jieshao">
									${pd.doctor_brief}
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </dd>
                    <dd class="jianjie">
                    	<ul>
							<li>擅　　长：</li>
                            <li class="jieshao">
								${pd.doctor_expert}
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </dd>
                
                </dl>
            
        	<div class="clearfix"></div>
        </div>
        <div class="baocunfanhui">
        	<input class="but2"  type="button" value="返回" onclick="fan()">
        </div>
        <div class="clearfix"></div>
    </div>
	
	








		<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<!-- ace scripts -->
	<script src="static/assets/js/ace/elements.fileinput.js"></script>
	<script src="static/assets/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript">
	$(top.hangge());
	
	$(function(){
		
		 $("input").attr("readonly",true); 
	});
	
	function fan(){
		window.location.href="<%=basePath%>doctorManage/doctorInfoList.do";
	}
	</script>
</body>
</html>