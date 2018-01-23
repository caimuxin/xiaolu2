<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="static/assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<style>
* {
	font-size: 12px;
	font-family: "宋体";
	color: #595959;
}

.clearfix {
	clear: both;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
	line-height: 30px;
}

a {
	text-decoration: none;
}

.big_box1 {
	
}

.big_box2 {
	border: 1px #dedede solid;
	margin-top: 20px;
	padding-top: 30px;
	padding-left: 20px;
}

.big_box2 ul {
	margin-bottom: 30px;
}

.big_box2 li {
	float: left;
	line-height: 40px;
}

.big_box2 select {
	width: 178px;
	height: 36px;
	outline: none;
	margin-left: 12px;
}

.big_box2 input {
	width: 360px;
	height: 30px;
	outline: none;
}

.big_box2 .shangchuan {
	height: 36px;
	width: 34px;
	border: none;
	margin-left: 2px;
	background-color: #e7e7e7;
	background-image: url(imgs/%E4%B8%8A%E4%BC%A0.png);
	background-repeat: no-repeat;
	background-position: center;
	outline: none;
	cursor: pointer;
}

.big_box2  .tishi {
	color: #cccccc;
	width: 320px;
	padding-left: 5px;
}

.pic {
	width: 442px;
	height: 328px;
	border: 1px solid #dedede;
}

.pic img {
	margin-left: auto;
	margin-right: auto;
	display: block;
	margin-top: 104px;
}

.big_box2 .fabu_but {
	color: #ffffff;
	background-color: #428BCA;
	border: none;
	width: 42px;
	height: 30px;
	text-shadow: 0px -1px 0px #356fa2;
	cursor: pointer;
}

.content li {
	clear: both;
}

.content textarea {
	width: 630px;
	height: 328px;
	border: 1px solid #abadb3;
	outline: none;
}

.shangchuan {
	height: 36px;
	width: 34px;
	border: none;
	margin-left: 2px;
	background-color: #e7e7e7;
	background-image: url(imgs/%E4%B8%8A%E4%BC%A0.png);
	background-repeat: no-repeat;
	background-position: center;
	outline: none;
	cursor: pointer;
}

.big_box2  .tishi {
	color: #cccccc;
	width: 213px;
	padding-left: 5px;
}

.big_box2 .mbottom10 {
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<form action="eduContentController/${msg}.do" name="ContentForm" id="ContentForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="tpz" id="tpz" value="${pd.CON_ATTACH}">
	<input type="hidden" name="content_id" id="content_id" value="${pd.CONTENT_ID}">
		<div id="zhongxin">
			<div class="big_box1">
				<div class="big_box2">

					<ul>
						<li>文章标题：&nbsp&nbsp&nbsp</li>
						<li><input type="text" id="conTitle" name="conTitle" value="${pd.CON_TITLE}"></li>
						<li><select id="eduId" name="eduId">
							<option value="">请选择类别</option>
							 <c:forEach items="${typeList}" var="tl" varStatus="vs">
                    			<option value="${tl.EDU_ID}"<c:if test="${pd.EDU_ID==tl.EDU_ID}">selected</c:if>>${tl.EDU_TITLE}</option>
                   			 </c:forEach>
						</select></li>
						<div class="clearfix"></div>
					</ul>

					<ul class="content mbottom10">
						<li>文章内容：&nbsp&nbsp&nbsp</li>
						<li><textarea id="conFullinfo" name="conFullinfo">${pd.CON_FULLINFO }</textarea></li>
						<li>上传附件：<br/></li>
						<div class="clearfix"></div>
					</ul>

					<ul>
						<li style="width: 220px;">
						<c:if test="${pd == null || pd.CON_ATTACH == '' || pd.CON_ATTACH == null }">
							<input type="file" id="tp" name="tp" width="210px" onchange="fileType(this)">
						</c:if>
						<c:if test="${pd != null && pd.CON_ATTACH != '' && pd.CON_ATTACH != null }">
							<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.CON_ATTACH}" width=200px; height=180px/><br/>
							<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.CON_ATTACH}','${pd.CONTENT_ID}');" style="width: 39px;"/>
							<input type="hidden" name="tpz" id="tpz" value="${pd.u_photo }"/>
						</c:if>
<!-- 						<input type="file" id="tp" name="tp" width="210px" onchange="fileType(this)">
 -->					</li>
						<div class="clearfix"></div>
					</ul>
					
					<ul>
						<li id="pic"></li>
						<div class="clearfix"></div>
					</ul>
					
					<ul>
						<li><a class="btn btn-mini btn-primary" onclick="save();">保存</a></li>
						<li style="padding-left: 20px;"><a class="btn btn-mini btn-danger" onclick="history.back()">取消</a></li>
						<div class="clearfix"></div>
					</ul>
					
				</div>
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
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//过滤类型
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
	
	//保存
	function save(){
	
		if($("#conTitle").val()==""){
			$("#conTitle").tips({
				side:3,
	            msg:'请输入文章标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#conTitle").focus();
			return false;
		}else{
			$("#conTitle").val($.trim($("#conTitle").val()));
		}
		
		if($("#eduId").val()==""){
			$("#eduId").tips({
				side:3,
	            msg:'请选择父类',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#eduId").focus();
			return false;
		}
		
		if($("#conFullinfo").val()==""){
			$("#conFullinfo").tips({
				side:3,
	            msg:'请输入文章标题',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#conFullinfo").focus();
			return false;
		}else{
			$("#conFullinfo").val($.trim($("#conFullinfo").val()));
		}
	if($("#conTitle").val()!=""){
			hasName();
		}else{
		$("#ContentForm").submit();
		$("#zhongxin2").show();
	}
}
	
	/* 判断标题是否存在 */
	function hasName(){
		var conTitle=$.trim($("#conTitle").val());
		
		$.ajax({
			type: "POST",
			url: '<%=basePath%>eduContentController/getContentName.do',
	    	data: {conTitle:conTitle,content_id:'${pd.CONTENT_ID}'},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#ContentForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					 $("#conTitle").tips({
							side:3,
				            msg:'标题已存在！',
				            bg:'#AE81FF',
				            time:2
				           
						 });
						$("#conTitle").focus();
						$("#conTitle").val('');
				 }
			}
		});
	}
	
	function fan1(){
		window.location.href="<%=basePath%>eduContentController/listPdPageContent.do";
	}
		
	
	//删除图片
	function delP(PATH,CONTENT_ID){
		if(confirm("确定要删除图片？")){
			var url = "eduContentController/delTxiang.do?PATH="+PATH+"&contentId="+CONTENT_ID;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					 window.location.reload();
				}
			});
		} 
	}
	
	</script>
</body>
</html>