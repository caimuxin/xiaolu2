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
		<link rel="stylesheet" href="static/xiaolu/css/hospitaldetail.css" />
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
		var msginfo = $("#msginfo");
	});
	
	//保存
	function save(){
		 var tabId = "${pd.tabId}"; 
		if(tabId == 2 || tabId ==3){
			$("#hospitalForm").submit();
			$("#zhongxin2").show();
			return;
		}
		
		if($("#hospitalname").val()=="" || $("#hospitalname").val()=="此用户名已存在!"){
			
			$("#hospitalname").tips({
				side:3,
	            msg:'输入医院名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#hospitalname").focus();
			$("#hospitalname").val('');
			$("#hospitalname").css("background-color","white");
			return false;
		}else{
			$("#hospitalname").val(jQuery.trim($('#hospitalname').val()));
		}
				
				
		
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		var phone = /^0\d{2,3}-?\d{7,8}$/;
		if($("#hospitalphone").val()==""){
			
			$("#hospitalphone").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#hospitalphone").focus();
			return false;
		}else if(!phone.test($("#hospitalphone").val()) && !myreg.test($("#hospitalphone").val())){
			$("#hospitalphone").tips({
				side:3,
	            msg:'号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#hospitalphone").focus();
			return false;
		}
		
		if($("#hospital_id").val()==""){
			hasH();
		}else{
			$("#hospitalForm").submit();
			$("#zhongxin2").show();
		}
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasH(){
		var hospitalName = $.trim($("#hospitalname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>hospital/hasHospital.do',
	    	data: {hospitalname:hospitalName},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#hospitalForm").submit();
					$("#zhongxin2").show();
				 }else{
					$("#hospitalname").css("background-color","#D16E6C");
					setTimeout("$('#hospitalname').val('此医院名称已存在!')",500);
				 }
			}
		});
	}
	
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
	    }
	}
	
	//删除图片
	function delP(PATH,hospitalId,pictureType){
		if(confirm("确定要删除图片？")){
			var url = "hospital/delHospitalPi.do?PATH="+PATH+"&hospitalId="+hospitalId+"&pictureType="+pictureType;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#EMAIL').val('')",2000);
				 }
			}
		});
	}
	
	//返回主界面
	function toMainList(){
		window.location.href ="hospital/listHospitals.do";
	}
</script>
	</head>
<body>
<input type="hidden" name="msginfo" id="msginfo" value="${pd.msginfo}"/>
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
	<ul class="table">
        <li <c:choose><c:when test="${pd.tabId == 1}">class="l_yuanjiao no_border this"</c:when><c:otherwise>class="l_yuanjiao no_border"</c:otherwise></c:choose>  >
        	<a href="hospital/goHospitalDetail.do?tabId=1&hospitalId=${pd.id}">医院信息</a>
        </li>
        <li <c:choose><c:when test="${pd.tabId == 2}">class="no_border this"</c:when><c:otherwise>class="no_border"</c:otherwise></c:choose> >
        	<a href="hospital/goHospitalDetail.do?tabId=2&hospitalId=${pd.id}">医院导航</a>
        </li>
        <li <c:choose><c:when test="${pd.tabId == 3}">class="r_yuanjiao this"</c:when><c:otherwise>class="r_yuanjiao"</c:otherwise></c:choose> >
        <a href="hospital/goHospitalDetail.do?tabId=3&hospitalId=${pd.id}">医院须知</a></li>
        <div  class="clearfix"></div>
	</ul>
	
	<form action="hospital/${msg}.do" name="hospitalForm" id="hospitalForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hospitalid" id="hospital_id" value="${pd.id }"/>
		<input type="hidden" name="tabId" id="tabId" value="${pd.tabId}"/>
		<div id="zhong">
		<c:choose>
			<c:when test="${pd.tabId == 1}">
				<%-- <div class="yygl_yyxx_big_box">
			    	<div class="yygl_yyxx_left_box">
			        	<dl>
			            	<dd>
			                	<ul>
			                   		<li>医院名称：<input type="text" name="hospitalname" id="hospitalname" value="${pd.hospitalname }" maxlength="32" placeholder="这里输入医院名称" title="医院名称"/></li>
			                    </ul>
			                </dd>
			                <dd>
			                	<ul>
			                   		<li>别　　名：<input type="text" name="anothername" id="anothername" value="${pd.anothername }" maxlength="32" placeholder="这里输入别名" title="别名" onblur="hasN('${pd.anothername }')"/></li>
			                    </ul>
			                </dd>
			                <dd>
			                	<ul>
			                   		<li>医院电话：<input type="text" name="hospitalphone" id="hospitalphone" value="${pd.hospitalphone }" maxlength="32" style="width:25%;" placeholder="输入等级" title="医院电话"/></li>
			                    </ul>
			                </dd>
			                <dd>
			                	<ul>
			                   		<li>医院网址：<input type="text" name="hospitalurl" id="hospitalurl" value="${pd.hospitalurl }" maxlength="32" style="width:25%;" placeholder="输入网址" title="医院网址" /></li>
			                    </ul>
			                </dd>
			                <dd>
			                	<ul class="yiyuanjianjie">
			                   		<li>医院简介：</li>
			                        <li><textarea id="introduction" name="introduction" title="医院简介" class="autosize-transition span12" style="width:690px; height:300px;">${pd.introduction }</textarea></li>
			                    </ul>
			                </dd>
			            </dl>
			        </div>
			        <div class="yygl_yyxx_right_box">
			        	<dl>
			            	 <c:if test="${pd == null || pd.appearpicture == '' || pd.appearpicture == null }">
									<input type="file" id="tp" name="tp" onchange="fileType(this)"/>
								</c:if>
								<c:if test="${pd != null && pd.appearpicture != '' && pd.appearpicture != null }">
									<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" width="210"/></a>
									<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.appearpicture}','${pd.id}','appearpicture');" />
									<input type="hidden" name="tpz" id="tpz" value="${pd.appearpicture }"/>
								</c:if>
			            </dl>
			        </div>
			        <div class="clearfix"></div>
			    </div> --%>
				
				
				<div class="widget-body">
	 				<div class="widget-main">
					<table  class="table table-striped table-bordered table-hover" style="width:50%;">
						
						<tr>
							<td rowspan = "4" style="width:30%;">
								<c:if test="${pd == null || pd.appearpicture == '' || pd.appearpicture == null }">
									<input type="file" id="tp" name="tp" onchange="fileType(this)"/>
								</c:if>
								<c:if test="${pd != null && pd.appearpicture != '' && pd.appearpicture != null }">
									<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.appearpicture}" width="210"/></a>
									<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.appearpicture}','${pd.id}','appearpicture');" />
									<input type="hidden" name="tpz" id="tpz" value="${pd.appearpicture }"/>
								</c:if>
							</td>
							<th style="width: 10%;">医院名称:</th>
							<td><input type="text" name="hospitalname" id="hospitalname" value="${pd.hospitalname }" maxlength="32" placeholder="这里输入医院名称" title="医院名称"/></td>
						</tr>
						<tr>
							<th>别&nbsp;&nbsp;名:</th>
							<td><input type="text" name="anothername" id="anothername" value="${pd.anothername }" maxlength="32" placeholder="这里输入别名" title="别名" onblur="hasN('${pd.anothername }')"/></td>
						</tr>
						<tr>
							<th>医院电话:</th>
							<td><input type="text" name="hospitalphone" id="hospitalphone" value="${pd.hospitalphone }" maxlength="32" placeholder="输入等级" title="医院电话"/></td>
						</tr>
						<tr>
							<th>医院网址:</th>
							<td><input type="text" name="hospitalurl" id="hospitalurl" value="${pd.hospitalurl }" maxlength="32" placeholder="输入网址" title="医院网址" /></td>
						</tr>
						</table>
						<div class="step-content row-fluid position-relative">
							<label style="float:left;padding-left: 1px;"><span class="lbl">医院简介</span></label>
						</div>
						<div class="step-content row-fluid position-relative">
							<textarea id="introduction" name="introduction" title="医院简介" class="autosize-transition span12" style="width:50%; height:300px;">${pd.introduction }</textarea>
					 	</div>
					 	<div class="step-content row-fluid position-relative">
						 	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="toMainList();">返回</a>
						</div>
				 	
				 	</div>
				 </div>
			</c:when>
			<c:when test="${pd.tabId == 2}">
				
				<%-- <div class="big_box">
			    	<div class="center_box">
			            <ul>
			                <h1>院外导航图：</h1>
			                <li class="yuanwaidaohang">
			                	<c:if test="${pd == null || pd.outnavigation == '' || pd.outnavigation == null }">
									<input type="file" id="tp2" name="tp2" onchange="fileType(this)"/>
								</c:if>
								<c:if test="${pd != null && pd.outnavigation != '' && pd.outnavigation != null }">
									<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.outnavigation}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.outnavigation}" /></a>
									<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.outnavigation}','${pd.id}','outnavigation');" />
									<input type="hidden" name="tpz2" id="tpz2" value="${pd.outnavigation }"/>
								</c:if>
			                </li>
			                <div  class="clearfix"></div>
			            </ul>
			            <ul class="yuanneidaohang_box">
			                <h1 class="text1">院内导航图：</h1>
			                <li class="yuanneidaohang">
			               		 <c:if test="${pd == null || pd.innavigation == '' || pd.innavigation == null }">
									<input type="file" id="tp3" name="tp3" onchange="fileType(this)"/>
								</c:if>
								<c:if test="${pd != null && pd.innavigation != '' && pd.innavigation != null }">
										<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.innavigation}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.innavigation}" /></a>
										<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.innavigation}','${pd.id}','innavigation');" />
										<input type="hidden" name="tpz3" id="tpz3" value="${pd.innavigation }"/>
								</c:if>
			                </li>
			                <div  class="clearfix"></div>
			            </ul>
			            <div  class="clearfix"></div>
			        </div>
			        <ul class="chengcheluxian">
			            <h1>乘车路线参考：</h1>
			            <li>
			               <textarea id="ride" name="ride" title="乘车路线参考" class="autosize-transition span12" style="width:50%; height:100px;">${pd.ride }</textarea>
			            </li>
			        </ul>
			        <div>
			        	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="toMainList();">返回</a>
			        </div>
			    </div> --%>
				
				
				<div class="widget-body">
	 				<div class="widget-main">
	 					<table  class="table table-striped table-bordered table-hover" style="width:60%">
	 						<tr>
	 							<td>院外导航图</td>
	 							<td>院内导航图</td>
	 						</tr>
	 						<tr>
								<td style="height:400px;width:30%;">
									<c:if test="${pd == null || pd.outnavigation == '' || pd.outnavigation == null }">
										<input type="file" id="tp2" name="tp2" onchange="fileType(this)"/>
									</c:if>
									<c:if test="${pd != null && pd.outnavigation != '' && pd.outnavigation != null }">
										<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.outnavigation}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.outnavigation}" /></a>
										<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.outnavigation}','${pd.id}','outnavigation');" />
										<input type="hidden" name="tpz2" id="tpz2" value="${pd.outnavigation }"/>
									</c:if>
								</td>
								<td style="height:400px;width:30%;">
									<c:if test="${pd == null || pd.innavigation == '' || pd.innavigation == null }">
									<input type="file" id="tp3" name="tp3" onchange="fileType(this)"/>
									</c:if>
									<c:if test="${pd != null && pd.innavigation != '' && pd.innavigation != null }">
										<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.innavigation}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.innavigation}" /></a>
										<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.innavigation}','${pd.id}','innavigation');" />
										<input type="hidden" name="tpz3" id="tpz3" value="${pd.innavigation }"/>
									</c:if>
								</td>
							</tr>
	 					</table>
	 					<div class="step-content row-fluid position-relative">
							<label style="float:left;padding-left: 1px;"><span class="lbl">乘车路线参考</span></label>
						</div>
						<div class="step-content row-fluid position-relative">
							<textarea id="ride" name="ride" title="乘车路线参考" class="autosize-transition span12" style="width:50%; height:100px;">${pd.ride }</textarea>
					 	</div>
					 	<div class="step-content row-fluid position-relative">
						 	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="toMainList();">返回</a>
						</div>
	 				</div>
	 			</div>
			</c:when>
			<c:otherwise>
				<div class="yygl_yyxz_big_box">
			    	<h1>住院指南</h1>
			        <textarea id="inguide" name="inguide" title="住院指南" class="autosize-transition span12" style="width:690px; height:300px;">${pd.inguide }</textarea>
			        <h1>出院指南</h1>
			        <textarea id="outguide" name="outguide" title="出院指南" class="autosize-transition span12" style="width:690px; height:300px;">${pd.outguide }</textarea>
			        <div>
			        	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="toMainList();">返回</a>
			        </div>
			        <div  class="clearfix"></div>
			    </div>
			</c:otherwise>
		</c:choose>
		
		
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
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
	
</body>
</html>