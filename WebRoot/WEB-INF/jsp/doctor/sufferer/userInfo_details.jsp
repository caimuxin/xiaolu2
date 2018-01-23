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
<!-- <link rel="stylesheet" href="static/css/ace.min.css" />-->
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>


<!-- ace styles -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
<link rel="stylesheet" href="static/assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<!-- 日期框 -->	
<link rel="stylesheet" href="static/css/datepicker.css" />

		
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
		.pic{ width:150px; height:200px; margin-left:20px; background-image:url(imgs/pic1.png); float:left;}
		.tianxie{ float:left;}
		.tianxie dl{padding-left:25px;}
		.tianxie ul{ margin-left:25px; margin-right:25px; float:left;}
		.tianxie li{ float:left; line-height:30px;}
		.tianxie dd{ margin-top:20px; margin-bottom:20px;}
		.tianxie select{ width:360px; height:32px; outline:none;}
		.shurukuang360 input{ border:none;border-bottom:1px #cccccc solid; width:360px; height:20px; background:none; outline:none; line-height:14px;}
		.shurukuang120 input{ border:none;border-bottom:1px #cccccc solid; width:120px; height:20px; background:none; outline:none; line-height:14px;}
		.shurukuang851 input{ border:none;border-bottom:1px #cccccc solid; width:845px; height:20px; background:none; outline:none; line-height:14px;}
		/*孕产信息*/
		.yunchanxinxi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; padding-left:20px; padding-right:20px; padding-bottom:20px; width:1120px;}
		.yunchanxinxi ul{ float:left;}
		.yunchanxinxi .f_r{ float:right;}
		.yunchanxinxi li{ float:left; line-height:30px;}
		.yunchanxinxi dd{ margin-bottom:20px;}
		.shurukuang375 input{  border:none;border-bottom:1px #cccccc solid; width:375px; height:20px; background:none; outline:none; line-height:14px; }
		.yuchanqi{ color:#4f99c6; font-weight:bold;}
		/*既往史*/
		.jiwangshi{border:#DEDEDE solid 1px; border-radius:10px;  padding-top:20px; background-color:#f2f2f2; padding-left:20px; padding-right:20px; padding-bottom:20px; width:1120px;}
		.m_l50{ margin-left:50px;}
		.shurukuang666{ border:none;border-bottom:1px #cccccc solid; width:666px; height:20px; background:none; outline:none; line-height:30px; margin-left:18px;}
		.jiwangshi dd{ margin-bottom:20px;}
		.jiwangshi dl dd span input[type=checkbox]{margin-bottom: 6px;}
		.jiwangshi dl dd input[type=checkbox]{margin-bottom: 6px;}
		.jiwangshi dl dd input[type=text]{margin-bottom: 2px;}
		</style>
		
		<script type="text/javascript">
		$(top.hangge());
		$(document).ready(function(){
			if($("#user_id").val()!=""){
				$("#loginname").attr("readonly","readonly");
				$("#loginname").css("color","gray");
			}
			var msginfo = $("#msginfo");
		});
		</script>
	
	</head>
<body style="background-color: white;">
<input type="hidden" name="msginfo" id="msginfo" value="${pd.msginfo}"/>
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	<ul class="table">
        <div  class="clearfix"></div>
	</ul>
	<form action="userInfoController/${msg}.do" name="uInfoForm" id="uInfoForm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="u_past" name="u_past" >
	<input type="hidden" id="u_family" name="u_family" >
	<input type="hidden" name="uuid" id="uuid" value="${pd.uuid }"/>
	<div class="big_box">
    
    	<div class="xinxi">
        
        	<div class="pic">
						<c:if test="${pd == null || pd.u_photo == '' || pd.u_photo == null }">
							<input type="file" id="tp" name="tp" onchange="fileType(this)"/>
						</c:if>
						<c:if test="${pd != null && pd.u_photo != '' && pd.u_photo != null }">
							<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.u_photo}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.u_photo}" width=139px; height=180px/></a>
							<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.u_photo}','${pd.uuid}');" />
							<input type="hidden" name="tpz" id="tpz" value="${pd.u_photo }"/>
						</c:if>
						<span id="pic"></span>
            </div>
            
            <div class="tianxie">
            	<dl>
<!--姓名 出生日期-->	
                    <dd>
                    	<ul>
                        	<li>姓　　名：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.user_namezs}" name="user_name" id="user_name"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>出生日期：</li>
                            <li><input type="date" value="${pd.u_birthday}" id="u_birthday" name="u_birthday"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--性别 身高 手机-->
                    <dd>
                    	<ul>
                        	<li>性　　别：</li>
                            <li class="shurukuang120"><input type="text" value="${pd.u_sex }" id="u_sex" name="u_sex"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>身　　高：</li>
                            <li class="shurukuang120"><input type="text" value="${pd.u_height }" id="u_height" name="u_height"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>手　　机：</li>
                            <li class="shurukuang360"><input type="text" value="${pd.phone }" id="u_telphone" name="u_telphone"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--证件类型 证件号码-->
					    <dd>
                    	<ul>
                        	<li>证件类型：</li>
                            <li class="shurukuang360">
                            	<select name="u_papertype" id="u_papertype">
                                	<option value="身份证">身份证</option>
                                    <option value="居住证">居住证</option>
                                </select>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>证件号码：</li>
                            <li class="shurukuang360"><input type="text" id="u_papernum" name="u_papernum" value="${pd.u_papernum }"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
                       <dd>
                    	<ul>
                        	<li>医生所在机构：</li>
                            <li class="shurukuang360">
                      		  <select id="hospital_id" name="hospital_id" onchange ="findHospitalId(this.options[this.options.selectedIndex].value);">
                            	<option value="">请选择</option>
			                        <c:forEach items="${psList}" var="ps">
			                   	    	<option value="${ps.id}"<c:if test="${ps.id==pd.hospital_id}">selected</c:if>>${ps.hospitalname}</option>
			                   	    </c:forEach>
                                </select>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>家庭医生：</li>
                            <li class="shurukuang360">
							<select id="doctorId" name="doctor_id">
	                        <option value="">请选择</option>
	                       	<c:if test="${not empty pd.hospital_id}">
	                        <c:forEach items="${dcList}" var="dc">
	                   	    	<option value="${dc.doctor_id}"<c:if test="${pd.doctor_id==dc.doctor_id}">selected</c:if> >${dc.doctor_name}</option>
	                   	    </c:forEach>
	                   	    </c:if>
	                   	    </select>
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    
<!--家庭住址-->
					<dd>
                        <ul>
                        	<li>家庭地址：</li>
                            <li class="shurukuang851"><input type="text" value="${pd.u_address }" id="u_address" name="u_address"></li>
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
                                <li class="shurukuang360"><input type="date" value="${pd.u_duedate }" id="u_duedate" name="u_duedate"></li>
                                <div class="clearfix"></div>
                            </ul>
                            
                            <ul class="f_r">
                                <li>孕　　次：</li>
                                <li class="shurukuang375"><input type="text" value="${pd.u_preg_all}" id="u_preg_all" name="u_preg_all" readonly></li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </dd>
                        <dd>
                            <ul>
                                <li>阴道分娩：</li>
                                <li class="shurukuang360"><input type="text" value="${pd.u_preg_zr}" id="u_preg_zr" name="u_preg_zr"></li>
                                <li>次</li>
                                <div class="clearfix"></div>
                            </ul>
                            
                            <ul class="f_r">
                                <li>剖宫分娩：</li>
                                <li class="shurukuang360"><input type="text" value="${pd.u_preg_pf }" id="u_preg_pf" name="u_preg_pf"></li>
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
				<dd>
					<div class="step-content row-fluid position-relative">
						 	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
							<a class="btn btn-mini btn-danger" href="<%=basePath%>userInfoController/listPdPageUserInfo.do">返回</a>
					</div>
				</dd>              
            </dl>
        </div>
        <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
			
		//页面加载时远中相关的既往史
		 var obj='${pd.u_past}';
		 var obs=obj.split(",");
		 for(var i = 0;i < obs.length; i++) {
			 $("#uPast input[type=checkbox]").each(function(){
					if(obs[i]==$(this).val()){
						$(this).attr("checked","true"); 
						}
					});
		 }
		//页面加载时远中相关的家族史 
		 var objs='${pd.u_family}';
		 var obss=objs.split(",");
		 for(var i = 0;i < obss.length; i++) {
			 $("#uFamily input[type=checkbox]").each(function(){
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
		 
		 if(document.getElementById("j66").checked || document.getElementById("j11").checked || document.getElementById("j77").checked ||
			document.getElementById("j22").checked || document.getElementById("j33").checked || document.getElementById("j44").checked || document.getElementById("j55").checked){
				 
		 }else{
				 $("#q2").val('${pd.u_family}');
				 $('#zcheckboxs').attr("checked",true);
				 $("#q2").attr("readonly",false);
		 }
		 
		 $('#u_preg_zr').blur(function (){
			 var n1=$('#u_preg_zr').val();
			 var n2=$('#u_preg_pf').val();
			 if(n2==''){
				 n2='0';
				 $('#u_preg_pf').val('0');
			 }
			 $('#u_preg_all').val(parseInt(n1)+parseInt(n2));
		 });
		 
		 $('#u_preg_pf').blur(function (){
			 var n1=$('#u_preg_zr').val();
			 var n2=$('#u_preg_pf').val();
			 if(n1==''){
				 n1='0';
				 $('#u_preg_zr').val('0');
			 }
			 $('#u_preg_all').val(parseInt(n1)+parseInt(n2));
		 });
		 
		 $('#j0').click(function (){
			 
			 var checklist = document.getElementsByName ("ids");
			   if(document.getElementById("j0").checked){
			   for(var i=0;i<checklist.length;i++){
			      checklist[i].checked=0;
			   }
			   $('#zcheckbox').attr("checked", false);
			   $('#j0').attr("checked", true);
			   $("#q1").attr("readonly",true);
			   $("#q1").val('');
			 }		 
		 });
		 
		//日期框
		$('.span10 date-picker').datepicker();
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
		
	<script type="text/javascript">
	
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
	    	document.getElementById("pic").innerHTML = "<img src='"+path+"' width=150px; height=155px/>"; 
	    }
	}
	
	//删除图片
	function delP(PATH,uuid){
		if(confirm("确定要删除图片？")){
			var url = "userInfoController/delTxiang.do?PATH="+PATH+"&uuid="+uuid;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					 window.location.reload();
				}
			});
		} 
	}
	
	
	//保存
	function save(){
		
		var tdlist = $("#uPast").find("dl").find("dd").find("span");
		var chkboxstr = "";
		$.each(tdlist,function(idx,item){
		var chkbox = $(this).find("input[type=checkbox]");
		if($(chkbox).attr("checked")){
		chkboxstr += $(chkbox).val() + ","
		}
		});
		
		var tdlists = $("#uFamily").find("dl").find("dd").find("span");
		var chkboxstrs = "";
		$.each(tdlists,function(idx,item){
		var chkbox = $(this).find("input[type=checkbox]");
		if($(chkbox).attr("checked")){
		chkboxstrs += $(chkbox).val() + ","
		}
		});
		$("#u_past").attr("value",chkboxstr);
		$("#u_family").attr("value",chkboxstrs);
		
		
		if( $("#q1").val()!=''){
			$("#u_past").attr("value",$("#q1").val());
		}
		if( $("#q2").val()!=''){
			$("#u_family").attr("value",$("#q2").val());
		}
		
		
		if($("#user_name").val()==''){
			$("#user_name").tips({
				side:3,
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#user_name").focus();
			return false;
		}
		
		
		if($("#u_birthday").val()==""){
			$("#u_birthday").tips({
				side:3,
	            msg:'请输入出生日期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_birthday").focus();
			return false;
		}
		
		if($("#u_sex").val()==""){
			$("#u_sex").tips({
				side:3,
	            msg:'请输入性别',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_sex").focus();
			return false;
		}
		
		if($("#u_height").val()==""){
			$("#u_height").tips({
				side:3,
	            msg:'请输入身高',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_height").focus();
			return false;
		}
		var myreg = /^[1][0-9][0-9]{9}$/;
		var phone = /^0\d{2,3}-?\d{7,8}$/;
		if($("#u_telphone").val()==""){
			$("#u_telphone").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_telphone").focus();
			return false;
		}else if(!phone.test($("#u_telphone").val())  && !myreg.test($("#u_telphone").val())){
			$("#u_telphone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_telphone").focus();
			return false;
		}
		var papernum=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
		if($("#u_papernum").val()==""){
			$("#u_papernum").tips({
				side:3,
	            msg:'请输入证件号码',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_papernum").focus();
			return false;
		}else if(!papernum.test($("#u_papernum").val())){
			$("#u_papernum").tips({
				side:3,
	            msg:'证件号格式不正确',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_papernum").focus();
			return false;
		}
		
		if($("#hospital_id").val()==''){
			$("#hospital_id").tips({
				side:3,
	            msg:'请选择医生所在机构',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#hospital_id").focus();
			return false;
		}
		
		if($("#doctorId").val()==''){
			$("#doctorId").tips({
				side:3,
	            msg:'请选择家庭医生',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctorId").focus();
			return false;
		}
		
		if($("#u_address").val()==""){
			$("#u_address").tips({
				side:3,
	            msg:'请输入家庭住址',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_address").focus();
			return false;
		}
		
		if($("#u_duedate").val()==""){
			$("#u_duedate").tips({
				side:3,
	            msg:'请输入预产期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_duedate").focus();
			return false;
		}
		
		if($("#u_preg_zr").val()==""){
			$("#u_preg_zr").tips({
				side:3,
	            msg:'请输入阴道分娩次数',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_preg_zr").focus();
			return false;
		}
		
		if($("#u_preg_pf").val()==""){
			$("#u_preg_pf").tips({
				side:3,
	            msg:'请输入剖宫分娩次数',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_preg_pf").focus();
			return false;
		}
		
		$("#uInfoForm").submit();
		$("#zhongxin2").show();
	}
	
	
	//全选 （是/否）
	function selectAll(){
		 var checklist = document.getElementsByName ("ids");
		   if(document.getElementById("zcheckbox").checked){
		   for(var i=0;i<checklist.length;i++){
		      checklist[i].checked=0;
		   }
		   $("#q1").attr("readonly",false);
		   $("#q1").focus();
		 }else{
			 $("#q1").attr("readonly",true);
			 $("#q1").val('');
		 }
	}
	
	//全选 （是/否）
	function selectAlls(){
		 var checklist = document.getElementsByName ("idss");
		   if(document.getElementById("zcheckboxs").checked){
		   for(var i=0;i<checklist.length;i++){
		      checklist[i].checked=0;
		   }
		   $("#q2").attr("readonly",false);
		   $("#q2").focus();
		 }else{
			 $("#q2").attr("readonly",true);
			 $("#q2").val('');
		 }
	}
	
	//所属医院的下拉款触发事件
	function findHospitalId(hospitalId){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>doctorManage/doctorOption.do',
	    	data: {hospital_id:hospitalId},
			dataType:'json',
			cache: false,
			success: function(data){
				 var select = document.getElementById("doctorId");
				 	select.options.length=0; 
				 	$("#doctorId").append("<option value='' select>请选择</option>");
				 	$.each(data.list, function(i,doctor){
			        	$("#doctorId").append("<option value='"+doctor.doctor_id+"'>"+doctor.doctor_name+"</option>");
					 });
				}
		});
	};
	</script>
	
</body>
</html>