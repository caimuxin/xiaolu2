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
<title></title>
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
.sf_xiahuaxian160{ border:none; border-bottom:1px #dedede solid; background:none; width:160px;}
.sf_xiahuaxian180{ border:none; border-bottom:1px #dedede solid; background:none; width:180px;}
.sf_xiahuaxian360{  border:none; border-bottom:1px #dedede solid; background:none;width:920px;}
.sf_chsf_ml43{ margin-left:43px;}
.sf_chsf_pl70{ padding-left:70px;}
.sf_chsf_ml34{ margin-left:34px;}
.sf_chsf_ml20{ margin-left:20px;}
.sf_chsf_ml10{ margin-left:10px;}
.sf_chsf_mb20{ margin-bottom:20px;}
.sf_chsf_mb40{ margin-bottom:40px;}

.sf_chsf_center_box .sf_chsf_shurukuang{ width:175px; height:30px; padding-left:5px; outline:none; background-color:#ffffff; border:1px #abadb3 solid;}
.sf_chsf_center_box select{ width:180px; outline:none; height:30px;}
.sf_chsf_xuxian{ width:1130px; height:1px; background-image:url(staic/img/mz_xuxian.png); margin-bottom:40px;}
.sf_chsf_suifangneirong{ background-image:url(static/img/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
.sf_chsf_center_box textarea{ width:1048px; height:98px; outline:none; line-height:20px;}
.shurukuang{width:1048px;outline:none; line-height:32px;}
/*保存返回*/
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
.sf_yqsf_suoluetu{ padding-left:70px; padding-top:20px;}
.sf_yqsf_suoluetu ul{ float:left;}
.sf_yqsf_shangchuantupian{ width:60px; height:30px; border:none; background-image:url(../imgs/mz_shangchuan.png); cursor:pointer;}
.sf_yqsf_shangchuantupian:hover{ background-image:url(../imgs/mz_shangchuan_hover.png);}
.sf_yqsf_quanbuxiazai{ padding-left:70px; padding-bottom:50px;}
.sf_yqsf_quanbuxiazai a{ border:none; font-size:12px; color:#4f99c6;margin-top:10px; outline:none; cursor:pointer; background:none;}
.sf_yqsf_quanbuxiazai a:hover{ color:#1b6aaa;}
.over {position: fixed; left:0; top:0; width:100%; z-index:100;}  
.tempContainer {position:fixed; width:100%; margin-right:0px; margin-left:0px; text-align:center; z-index:101;}  
</style>
	</head>
<body style="background-color: white;">
<div class="container-fluid" id="main-container">
<ul class="table">
        <li class="l_yuanjiao no_border"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border this"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
    <div class="sf_chsf_big_box">
    	<div class="sf_chsf_center_box">
        	<dl>
            	<dd class="sf_chsf_mb20">
                	<ul>
                    	<li><strong>随访类型：</strong>
                   	    <input type="text" class="sf_xiahuaxian180" value='<c:if test="${pd.F_TYPE=='p'}">孕期随访</c:if><c:if test="${pd.F_TYPE=='d'}">产后随访</c:if>'></li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                    	<li>随访方式:
							<input type="text" class="sf_xiahuaxian180" value="${pd.F_STYLE}随访">
                        </li>
                        <li class="sf_chsf_ml43">随访人员：
                         <c:forEach items="${dcList}" var="dc">
                        	 	 <c:if test="${pd.DOCTOR_ID==dc.doctor_id}"><input type="text" class="sf_xiahuaxian180" value="${dc.doctor_name}"></c:if>
                         </c:forEach>
                        	
                        </li>
                        <li class="sf_chsf_ml43">所属单位：
                        <c:forEach items="${psList}" var="ps">
			                  	<c:if test="${pd.HOSPITAL_ID==ps.id}"><input type="text" class="sf_xiahuaxian180"  value="${ps.hospitalname}"></c:if>
			             </c:forEach>
                        	
                        </li>
                         <li class="sf_chsf_ml43">随访日期：
                        	<input type="text" class="sf_xiahuaxian160"  value="${pd.F_DATE}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong">随访内容</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>体　　重：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.P_WEIGHT}kg">
                        </li>
                        <li class="sf_chsf_ml34">腹　　围：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.P_WAIST}">
                        </li>
                        <li class="sf_chsf_ml34">胎　　心：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.P_HEART}">
                        </li>
                        <li class="sf_chsf_ml34">血　　压：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.P_BLOOD}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                
                <dd>
                	<ul>

                        <li>孕期异常：</li>
                        <li class="shurukuang">
                  		${pd.P_UNUSUAL}
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_yqsf_suoluetu">
                	<ul>
                        <li>
                        <%-- <img src="<%=basePath%>static/img/mz_suoluetu.png"> --%>
                         <div class="over"></div><!--背景层-->  
						<div class="logoImg amplifyImg"><!--注意：此处的amlifyImg不可少-->  
						      <img alt="单据" src="<%=basePath%>uploadFiles/uploadImgs/${pd.P_ATTACHMENT}" width="70px;" height="39px;" style="cursor:pointer;">
						</div>
                        </li>
                        <li class="sf_chsf_ml10">脚浮肿.jpg</li>
                        <div class="clearfix"></div>
                     </ul>
                     <div class="clearfix"></div>
                </dd>
                <dd class="sf_yqsf_quanbuxiazai">
               <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.P_ATTACHMENT}" download="住院单据.png">全部下载</a>
               <!--  <input type="submit" value="全部下载"> -->
                </dd>
                <dd >
                	<ul>
                        <li>健康指导：</li>
                        <li class="shurukuang">
                        	${pd.P_EDUCATION}
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
            </dl>
        </div>
        <ul class="sf_chsf_ml20">
       		<input class="but2"  type="button" value="返回" onclick="fan()">
        </ul>
    </div>

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
	$(function() {
		//上传
		$('#tp').ace_file_input({
			no_file:'请选择图片 ...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false, //| true | large
			whitelist:'gif|png|jpg|jpeg',
			//blacklist:'gif|png|jpg|jpeg'
			//onchange:''
			//
		});
	});
	</script>
	
	<script type="text/javascript">
	
		$(function() {
			
		 var obj='${pd.u_past}';
		 var obs=obj.split(",");
		 for(var i = 0;i < obs.length; i++) {
			 $("#uPast input[type=checkbox]").each(function(){
					if(obs[i]==$(this).val()){
						$(this).attr("checked","true"); 
						}
					});
		 }
		 
		 var objs='${pd.u_family}';
		 var obss=objs.split(",");
		 for(var i = 0;i < obss.length; i++) {
			 $("#uFamily input[type=checkbox]").each(function(){
					if(obss[i]==$(this).val()){
						$(this).attr("checked","true"); 
						}
					});
		 }
		 $("input").attr("readonly",true);
		});
		
		function fan(){
			window.location.href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}";
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