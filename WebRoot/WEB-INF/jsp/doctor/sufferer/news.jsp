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
	
	<style type="text/css">
	
	.over {position: fixed; left:0; top:0; width:100%; z-index:100;}  
.tempContainer {position:fixed; width:100%; margin-right:0px; margin-left:0px; text-align:center; z-index:101;}  
	</style>
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container" style="padding-top: 10px;">

<div class="over"></div><!--背景层-->  
<div class="logoImg amplifyImg"><!--注意：此处的amlifyImg不可少-->  
     <img src="static/img/default.png" width="100px;" height="100px;"/>
</div>  



</div><!--/.fluid-container#main-container-->
		
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

