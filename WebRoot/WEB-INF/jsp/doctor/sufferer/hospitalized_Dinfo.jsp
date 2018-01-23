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
h1{ font-size:16px; font-weight:bold; padding:0; margin:0;}
a{ text-decoration:none;}
input{ outline:none;}
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
/*表单*/
.sf_chsf_big_box{ border:1px #dedede solid; margin-top:20px; padding-top:20px; padding-left:20px; padding-bottom:20px;}
.sf_chsf_center_box{ width:1130px; border:1px  #dedede solid;background-color:#f2f2f2; border-radius:10px; padding:20px; margin-bottom:20px;}
.sf_chsf_center_box li{ float:left; line-height:32px;}
.sf_xiahuaxian180{ border:none; border-bottom:1px #dedede solid; background:none; width:180px;}
.sf_xiahuaxian360{  border:none; border-bottom:1px #dedede solid; background:none;width:920px;}
.sf_chsf_center_box .float_right{ float:right;}
.zy_zyzl_ml616{ margin-left:616px;}
.sf_chsf_ml43{ margin-left:43px;}
.zy_zyzl_ml50{ margin-left:50px;}
.sf_chsf_ml34{ margin-left:34px;}
.sf_chsf_ml20{ margin-left:20px;}
.sf_chsf_ml10{ margin-left:10px;}
.sf_chsf_mb20{ margin-bottom:20px;}
.sf_chsf_mb40{ margin-bottom:40px;}
.sf_chsf_mb50{ margin-bottom:50px;}
.sf_chsf_pl70{ padding-left:70px;}
.shurukuang{ float:left; outline:none; width:1028px; line-height:32px;}

.sf_chsf_center_box .zy_zyzl_shurukuang{ border:none; border-bottom:1px #dedede solid; background:none; width:180px;}
.sf_chsf_center_box select{ width:180px; outline:none; height:30px;}
.sf_chsf_xuxian{ width:1130px; height:1px; background-image:url(static/img/mz_xuxian.png);}
.sf_chsf_suifangneirong{ background-image:url(static/img/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
.sf_chsf_center_box textarea{ width:820px; height:98px; outline:none; line-height:20px;}
/*保存返回*/
.but1{
	border:none;
	color:#ffffff;
	width:42px;
	height:30px;
	background-color:#428bca;
	text-shadow:0px -1px 0px #a74939;
	cursor:pointer;
	font-size:12px;
	}
.but1:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
.zy_zyzl_suoluetu ul{ float:left;}
.sf_yqsf_shangchuantupian{ width:60px; height:30px; border:none; background-image:url(imgs/mz_shangchuan.png); cursor:pointer;}
.sf_yqsf_shangchuantupian:hover{ background-image:url(imgs/mz_shangchuan_hover.png);}
.zy_zyzl_quanbuxiazai a{ border:none; font-size:12px; color:#4f99c6;margin-top:10px; outline:none; cursor:pointer; background:none;}
.zy_zyzl_quanbuxiazai a:hover{ color:#1b6aaa;}
.over {position: fixed; left:0; top:0; width:100%; z-index:100;}  
.tempContainer {position:fixed; width:100%; margin-right:0px; margin-left:0px; text-align:center; z-index:101;}  
</style>
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">
<ul class="table">
        <li class="l_yuanjiao no_border"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border this"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
        <div class="sf_chsf_big_box">
    	<div class="sf_chsf_center_box">
        	<dl>
            	<dd class="sf_chsf_mb20">
                	<ul>
                    	<li><strong>住院类型：</strong>
                   	    <input type="text" value="<c:if test="${pd.H_TYPE=='t'}">住院治疗</c:if><c:if test="${pd.H_TYPE=='b'}">住院分娩</c:if>" class="zy_zyzl_shurukuang"></li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>分娩时间：
                        	<input type="text" value="${pd.D_DATETIME}" class="sf_xiahuaxian180">
                        </li>
                        <li class="sf_chsf_ml34">分娩孕周：
                        	<input type="text" value="第${pd.D_WEEK}周" class="sf_xiahuaxian180">
                        </li>
                        <li class="sf_chsf_ml34">　总产程：
                        	<input type="text" value="${pd.D_ALLTIME}小时" class="sf_xiahuaxian180">
                        </li>
                        <li class="sf_chsf_ml34">分娩医院：
                        	
                        	 <c:forEach items="${psList}" var="ps">
			                 	<c:if test="${ps.id==pd.HOSPITAL_ID}"><input type="text" value="${ps.hospitalname}" class="sf_xiahuaxian180"></c:if>
			                 </c:forEach>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>助产医生：
                        	
                        	 <c:forEach items="${dcList}" var="dc">
	                   	    	 <c:if test="${pd.DOCTOR_ID==dc.doctor_id}"><input type="text" value="${dc.doctor_name}"class="sf_xiahuaxian180"></c:if>
	                   	    </c:forEach>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20" id="f1">
                	<ul>

                        <li>分娩方式：
                            <span><input type="checkbox"  class="zy_zyzl_ml501" value="顺产">1：顺产</span>
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="胎头吸引">2：胎头吸引</span>
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="产钳">3：产钳(低中)</span>
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="臀部助产">4：臀部助产</span>
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="臀牵引">5：臀牵引</span>
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="剖宫产">6：剖宫产</span>	
                             <span><input type="checkbox" class="zy_zyzl_ml50" value="毁胎术">7：毁胎术</span>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb50">
                	<ul>
                        <li>产科并发症：</li>
                        <li class="shurukuang">${pd.M_COMPLICATION}</li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong">新生儿情况</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>体　　重：
                        	<input type="text" value="${pd.B_WEIGHT}kg" class="sf_xiahuaxian180">
                        </li>
                        <li class="sf_chsf_ml34">身　　长：
                        	<input type="text" value="${pd.B_HEIGHT}cm" class="sf_xiahuaxian180">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>
                             <span><input type="radio" name="b_sex" value="男" id="nan">男</span>
                             <span><input type="radio" name="b_sex" value="女" id="nv" class="zy_zyzl_ml50">女</span>
                            <span><input type="radio" name="b_number" id="dan" class="zy_zyzl_ml50" value="单胎">单胎</span>
                            <span><input type="radio" name="b_number" id="suan" class="zy_zyzl_ml50" value="双胎">双胎</span>
                           <span><input type="radio" name="b_number" id="duo" class="zy_zyzl_ml50" value="多胎">多胎</span>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>新生儿并发症：</li>
                        <li class="shurukuang">${pd.B_COMPLICATION}</li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong">住院单据</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="zy_zyzl_suoluetu">
                	<ul>
                        <li>
                        <div class="over"></div><!--背景层-->  
						<div class="logoImg amplifyImg"><!--注意：此处的amlifyImg不可少-->  
						      <img alt="单据" src="<%=basePath%>uploadFiles/uploadImgs/${pd.ATTACHMENT}" width="70px;" height="39px;" style="cursor:pointer;">
						</div>  
                        </li>
                        <li class="sf_chsf_ml10">常规化验单.jpg</li>
                        <div class="clearfix"></div>
                     </ul>
                     <div class="clearfix"></div>
                </dd>
                <dd class="zy_zyzl_quanbuxiazai">
                <!-- <input type="submit" value="全部下载"> -->
                <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.ATTACHMENT}" download="住院单据.png">全部下载</a>
                </dd>
            </dl>
        </div>
        <ul class="sf_chsf_ml20">
       		<input class="but1"  type="button" value="返回" onclick="fan()">
        </ul>
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
		
		$(top.hangge());
		
		$(function(){
			//页面加载时选中复选框
			 var obj='${pd.D_STYLES}';
			 var obs=obj.split(",");
			 for(var i = 0;i < obs.length; i++) {
				 $("#f1 input[type=checkbox]").each(function(){
						if(obs[i]==$(this).val()){
							$(this).attr("checked","true"); 
								}
						});
			 }
			 
			 if('${pd.B_SEX}'=="男"){
				 $("#nan").attr("checked",'checked');
			 }else if('${pd.B_SEX}'=="女"){
				 $("#nv").attr("checked",'checked');
			 }
			 
			 if('${pd.B_NUMBER}'=="单胎"){
				 $("#dan").attr("checked",'checked');
			 }else if('${pd.B_NUMBER}'=="双胎"){
				 $("#suan").attr("checked",'checked');
			 } else if('${pd.B_NUMBER}'=="多胎"){
				 $("#duo").attr("checked",'checked');
			 }
			 
			 
			 $("input").attr("readonly",true); 
		});
		
		function fan(){
			window.location.href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}";
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

