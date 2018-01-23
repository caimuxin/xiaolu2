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
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		
		
		<style>
		*{ font-size:14px; font-family:"宋体"; color:#595959;}
		.clearfix{ clear:both;}
		ul,li{ margin:0; padding:0; list-style:none; line-height:30px;}
		a{ text-decoration:none;}
		input{ margin:0; padding:0;}
		.big_box1{ }
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
		
		.big_box2{ border:1px #dedede solid; margin-top:20px; padding-top:30px; padding-left:20px;}
		.big_box2 ul{ margin-bottom:30px;}
		.big_box2 li{ float:left; line-height:32px;}
		.big_box2 select{ width:364px; height:32px; outline:none;}
		.big_box2 input{ width:360px; height:30px; outline:none;}
		.big_box2 .shangchuan{ height:32px; width:34px; border:none; margin-left:2px; background-color:#e7e7e7; background-image:url(imgs/shangchuan.png); background-repeat:no-repeat; background-position:center; outline:none; cursor:pointer;}
		.big_box2 .shangchuan:hover{ background-image:url(imgs/bg_shangchuan.png); background-repeat:no-repeat; background-position:center;}
		.big_box2  .tishi{width:320px; padding-left:5px;}
		.pic{ width:442px; height:328px; border:1px solid #dedede;}
		.pic img{ margin-left:auto; margin-right:auto; display:block; margin-top:104px;}
		.big_box2 .fabu_but{color:#ffffff;background-color:#428BCA; border:none; width:60px; height:26px; text-shadow:0px -1px 0px #356fa2; cursor:pointer; margin-top:20px;}
		.big_box2 .fabu_but:hover{ background-image:url(imgs/xuanjiao_daohangbianji_fabu.png); background-repeat:no-repeat; background-position:center;}
		.big_box2 .next_but{color:#ffffff;background-color:#87b97e; border:none; width:60px; height:26px; text-shadow:0px -1px 0px #6c9465; cursor:pointer; margin-left:324px; margin-top:20px;}
		.big_box2 .next_but:hover{ background-image:url(imgs/xuanjiao_daohangbianji_xiayibu.png); background-repeat:no-repeat; background-position:center;}
		
		
		
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
	
	.big_box2{ border:1px #dedede solid; margin-top:20px; padding-top:30px; padding-left:20px;}
	.big_box2 ul{ margin-bottom:30px;}
	.big_box2 li{ float:left; line-height:40px;}
	.big_box2 select{ width:364px; height:36px; outline:none;}
	.big_box2 input{ width:355px; height:30px; padding-left:5px; outline:none;}
	.big_box2 .shangchuan{ height:36px; width:34px; border:none; margin-left:2px; background-color:#e7e7e7; background-image:url(imgs/%E4%B8%8A%E4%BC%A0.png); background-repeat:no-repeat; background-position:center; outline:none; cursor:pointer;}
	.big_box2  .tishi{ color:#cccccc; width:320px; padding-left:5px;}
	.pic{ width:442px; height:328px; border:1px solid #dedede;}
	.pic img{ margin-left:auto; margin-right:auto; display:block; margin-top:104px;}
	.big_box2 .fabu_but{color:#ffffff;background-color:#428BCA; border:none; width:60px; height:26px; text-shadow:0px -1px 0px #356fa2; cursor:pointer;}
	.big_box2 .next_but{color:#ffffff;background-color:#87b97e; border:none; width:60px; height:26px; text-shadow:0px -1px 0px #6c9465; cursor:pointer; margin-left:324px;}
	.content li{ clear:both;}
	.content textarea{ width:442px; height:328px; border:1px solid #abadb3; outline:none;}
	 .shangchuan{ height:36px; width:34px; border:none; margin-left:2px; background-color:#e7e7e7; background-image:url(imgs/%E4%B8%8A%E4%BC%A0.png); background-repeat:no-repeat; background-position:center; outline:none; cursor:pointer;}
	 .big_box2  .tishi{ color:#cccccc; width:213px; padding-left:5px;}
	 .big_box2 .mbottom10{ margin-bottom:10px;}
		</style>
	</head>
<body>
<input type="hidden" name="msginfo" id="msginfo" value="${pd.msginfo}"/>
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	<form action="adInfoController/addAdInfo.do" name="adInfoForm" id="adInfoForm" method="post" enctype="multipart/form-data">
	   <div class="big_box1">
	   
    	<ul class="table">
            <li class="l_yuanjiao this" id="t0"><a onclick="showdivs()">导航编辑</a></li>
            <li class="r_yuanjiao" id="t1"><a onclick="showdiv()">链接图文</a></li>
        <div  class="clearfix"></div>
		</ul>
	
        <div class="big_box2" id="dv1">
            <ul>
                <li>版块名称：&nbsp&nbsp&nbsp</li>
                <li>
                    <select id="adSection" name="adSection">
                    <option value="SY">首页版块</option>
                     <option value="JC">检测版块</option>
                    <option value="XJ">课堂宣教</option>
                    </select>
                </li>
                <div class="clearfix"></div>
            </ul>
            
             <ul>
                <li>所属医院：&nbsp&nbsp&nbsp</li>
                <li>
                    <select id="hospital_id" name="hospital_id" onchange ="findHospitalId(this.options[this.options.selectedIndex].value);" style="width:360px">
	                       <c:forEach items="${psList}" var="ps">
	                   	    	<option value="${ps.id}"<c:if test="${pd.HOSPITAL_ID==ps.id}">selected</c:if>>${ps.hospitalname}</option>
	                   	   </c:forEach>
	                </select>
                </li>
                <div class="clearfix"></div>
            </ul>
            
            <ul>
                <li>导航标题：&nbsp&nbsp&nbsp</li>
                <li>
                    <input type="text" id="adTitle" name="adTitle">
                </li>
                <div class="clearfix"></div>
            </ul>
            
             <ul>
                <li>顺　　序：&nbsp&nbsp&nbsp</li>
                <li>
                    <input type="text" id="adSequence" name="adSequence">
                </li>
                <div class="clearfix"></div>
            </ul>
            
            <ul>
                <li>导航图片：&nbsp&nbsp&nbsp</li>
                <li style="width: 210px">
                    <input type="file" id="tp" name="tp" width="210px" onchange="fileType(this)">
                </li>
                <div class="clearfix"></div>
            </ul>
            
            <ul>
                <li id="pic"></li>
                <div class="clearfix"></div>
            </ul>
            
            <ul>
            	<li><input type="button" value="发布" class="fabu_but" onclick="save()"></li>
            	<li><input type="button" value="下一步" class="next_but" onclick="showdiv()"></li>
                <div class="clearfix"></div>
            </ul>
        
        </div>
        
        
        
        
        
        <div class="big_box2" id="dv2" style="display: none;">
            
            <ul>
                <li>文章标题：&nbsp&nbsp&nbsp</li>
                <li>
                    <input type="text" id="adSubtitle" name="adSubtitle">
                </li>
                <div class="clearfix"></div>
            </ul>
            
             <ul class="content mbottom10">
                <li>文章内容：&nbsp&nbsp&nbsp</li>
                <li>
                    <textarea id="adSubinfo" name="adSubinfo"></textarea>
                </li>
                <div class="clearfix"></div>
            </ul>
            
            
            <ul>
                <li>上传附件：&nbsp&nbsp&nbsp</li>
                <li style="width: 210px" id="fi1">
                    <input type="file" id="tp" name="tps" width="210px" onchange="fileTypes(this)">
                </li>
                <div class="clearfix"></div>
            </ul>
            
             <ul>
                <li id="pics">
                </li>
                <div class="clearfix"></div>
            </ul>
            
            <ul>
            	<li><input type="button" value="发布" class="fabu_but" onclick="save1()"></li>
<!--             	<li><input type="button" value="预览 " class="next_but"></li>
 -->               
 					<li><input type="button" value="取消 " class="next_but" onclick="exit()"></li>
 					 <div class="clearfix"></div>
            </ul>
        
        </div>
        
    </div>
    	<div id="zhongxin2" class="center" style="display: none">
			<br />
			<br />
			<br />
			<br />
			<img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
    </form>
    </div>




	</div>
   </div>
 </div>
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//上传
			$('#tp,#tp2,#tp3').ace_file_input({
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
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
		var msginfo = $("#msginfo");
	});
	
	//过滤类型path
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#tp").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    	document.getElementById("tp").files[0] = '请选择图片';
	    }else{
	    	var path = URL.createObjectURL(obj.files[0]);
	    	 document.getElementById("pic").innerHTML = "<img src='"+path+"' width=350px; height=300px/>"; 
	    }
	}
	
	//过滤类型
	function fileTypes(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#fi1 input[type=file]").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    	document.getElementById("tp").files[0] = '请选择图片';
	    }else{
	    	var path = URL.createObjectURL(obj.files[0]);
	    	 document.getElementById("pics").innerHTML = "<img src='"+path+"' width=350px; height=300px/>"; 
	    }
	}
	
	function showdiv(){
		if($("#adTitle").val()==""){
			$("#adTitle").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adTitle").focus();
			return false;
		}else{
			$("#adTitle").val($.trim($("#adTitle").val()));
		}
		
		
		if($("#adSequence").val()==""){
			$("#adSequence").tips({
				side:3,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adSequence").focus();
			return false;
		}
		else{
			$("#adSequence").val($.trim($("#adSequence").val()));
		}
		
	      var target=document.getElementById("dv1");
	      var target2=document.getElementById("dv2");
	      target.style.display="none";
	      target2.style.display="";
	      $("#t1 a").css("color","white");
	  	  $("#t1").css("background-color","#4f99c6");
	  		$("#t0").css("background-color","#ffffff");
	  		$("#t0 a").css("color","#4f99c6");
	}
	
	function showdivs(){
		
	      var target=document.getElementById("dv1");
	      var target2=document.getElementById("dv2");
	      target.style.display="";
	      target2.style.display="none";
	      $("#t0 a").css("color","white");
	  	  $("#t0").css("background-color","#4f99c6");
	  		$("#t1").css("background-color","#ffffff");
	  		$("#t1 a").css("color","#4f99c6");
	}
	
	//保存
	function save(){
	
	if($("#adTitle").val()==""){
			$("#adTitle").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adTitle").focus();
			return false;
		}else{
			$("#adTitle").val($.trim($("#adTitle").val()));
		}
		
		
		if($("#adSequence").val()==""){
			$("#adSequence").tips({
				side:3,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adSequence").focus();
			return false;
		}
		else{
			$("#adSequence").val($.trim($("#adSequence").val()));
		}
		
		$("#adInfoForm").submit();
		$("#zhongxin2").show();
}
	
	//保存
	function save1(){
	
	if($("#adSubtitle").val()==""){
			$("#adSubtitle").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adSubtitle").focus();
			return false;
		}else{
			$("#adSubtitle").val($.trim($("#adSubtitle").val()));
		}
		
		
		if($("#adSubinfo").val()==""){
			$("#adSubinfo").tips({
				side:3,
	            msg:'请输入文章内容',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#adSubinfo").focus();
			return false;
		}
		else{
			$("#adSubinfo").val($.trim($("#adSubinfo").val()));
		}
		
		$("#adInfoForm").submit();
		$("#zhongxin2").show();
}
	
	function exit(){
		
		window.location.href="<%=basePath%>adInfoController/allAdInfo.do";
	}
	</script>
</body>
</html>