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

		<!-- <link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/ace.min.css" /> -->
		<!-- ace styles -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="static/xiaolu/css/doctorinfodetail.css" type="text/css">
	
	</head>
<body style="background-color: white;">
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
	<div class="row-fluid">
						
		<ul class="table">
        <li class="l_yuanjiao this" id="t0"><a href="<%=basePath%>doctorManage/toUpdDoctor.do?doctor_id=${pd.doctor_id}">基本信息</a></li>
        <li class="no_border" id="t1"><a href="<%=basePath%>doctorManage/toDisease.do?doctor_id=${pd.doctor_id}">病患记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>MedFollowLnglat/listPageMedFollow.do?doctor_id=${pd.doctor_id}">随访轨迹</a></li>
        <div  class="clearfix"></div>
		</ul>
	<div class="ysgl_jbxx_big_box">
    	<form action="doctorManage/${msg}.do" name="doctorInfoForm" id="doctorInfoForm" method="post" enctype="multipart/form-data">
    	<input id="doctor_id" name="doctor_id" value="${pd.doctor_id}" type="hidden">
    	<div class="ysgl_jbxx_xinxi"style="width: 1300px;">
        	<div class="ysgl_jbxx_center_box">
                <div class="ysgl_jbxx_left_box" >
                    <div class="pic" id="MyFiles" >
                    <c:if test="${pd != null && pd.doctor_photo != '' && pd.doctor_photo != null }">
							<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.doctor_photo}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.doctor_photo}" width=139px; height=180px/></a>
							<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.doctor_photo}','${pd.doctor_id}');" />
							<input type="hidden" name="tpz" id="tpz" value="${pd.doctor_photo }"/>
					</c:if>
                    </div>
                    <ul>
                    <li style="width: 200px">
                    <c:if test="${pd == null || pd.doctor_photo == '' || pd.doctor_photo == null }">
							<input type="file" id="tp" name="tp" onchange="fileType(this)"/>
					</c:if>
                    </li>
                    </ul>
                </div>
            
            <div class="ysgl_jbxx_tianxie">
            	<dl>
<!--姓名 出生日期-->
					 <dd>
                    	<ul>
                        	<li>工      龄：</li>
                            <li class="shurukuang360"><input type="text" id="doctor_work" name="doctor_work" value="${pd.doctor_work}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul style="padding-left:25px;">
                        	<li>职     称：</li>
                            <li>
							<select id="doctor_position" name="doctor_position">
                              <option value="">请选择</option>
                              <option value="主治医师" <c:if test="${pd.doctor_position=='主治医师'}">selected</c:if>>主治医师</option>
                              <option value="副主任医师" <c:if test="${pd.doctor_position=='副主任医师'}">selected</c:if>>副主任医师</option>
                              <option value="主任医师" <c:if test="${pd.doctor_position=='主任医师'}">selected</c:if>>主任医师</option>
                         	</select>
							</li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    <dd>
                    	<ul>
                        	<li>姓　　名：</li>
                            <li class="shurukuang360"><input type="text" id="doctor_name" name="doctor_name" value="${pd.doctor_name}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>出生日期：</li>
                            <li><input id="doctor_birth" name="doctor_birth" type="date" value="${pd.doctor_birth}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--性别 联系方式-->
                    <dd>
                    	<ul>
                        	<li>性　　别：</li>
                            <li class="shurukuang360"><input type="text" id="doctor_sex" name="doctor_sex" value="${pd.doctor_sex}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        
                        <ul>
                        	<li>联系方式：</li>
                            <li class="shurukuang360"><input type="text" id="doctor_phone" name="doctor_phone" value="${pd.doctor_phone}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--证件类型 证件号码-->
					    <dd>
                    	<ul>
                        	<li>证件类型：</li>
                            <li class="shurukuang360">
                            	<select id="d_papertype" name="d_papertype" >
                                	<option value="身份证">身份证</option>
                                    <option value="居住证">居住证</option>
                                </select>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>证件号码：</li>
                            <li class="shurukuang360"><input type="text" id="d_papernum" name="d_papernum" value="${pd.d_papernum}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
<!--教育程度 执业证日期-->
					    <dd>
                    		<ul>
                        	<li>教育程度：</li>
                            <li class="shurukuang360">
                            	<select id="doctor_education" name="doctor_education">
                                	<option value="">请选择</option>
                                    <option value="大专" <c:if test="${pd.doctor_education=='大专'}">selected</c:if>>大专</option>
                                    <option value="本科" <c:if test="${pd.doctor_education=='本科'}">selected</c:if>>本科</option>
                                    <option value="研究生" <c:if test="${pd.doctor_education=='研究生'}">selected</c:if>>研究生</option>
                                    <option value="博士" <c:if test="${pd.doctor_education=='博士'}">selected</c:if>>博士</option>
                                </select>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>执业证日期：</li>
                            <li><input id="d_award" name="d_award" type="date" value="${pd.d_award}"></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="clearfix"></div>
                    </dd>
                    <dd>
                    	<ul>
                        	<li>所在医院：</li>
                            <li class="shurukuang360">
                            	<select id="selectHospital" onchange ="findOfficeByHospitalId(this.options[this.options.selectedIndex].value);" name="hospital_id">
                            		<option value="">请选择</option>
                            		<c:forEach items = "${hOption}" var ="hospital">
                                    <option <c:if test="${hospital.hospitalId==pd.hospital_id}">selected</c:if> value="${hospital.hospitalId}">${hospital.hospitalName}</option>
                                    </c:forEach>
                                </select>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                        
                        <ul>
                        	<li>所在科室：</li>
                            <li class="shurukuang360">
                            	<select id="selectOffice" name="office_id">
                                	<option value="">请选择</option>
                                	<c:forEach items = "${OOption}" var ="office">
                                    	<option <c:if test="${office.officeId==pd.office_id}">selected</c:if> value="${office.officeId}">${office.officeName }</option>
                                    </c:forEach>
                                </select>
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
                           <li class="shurukuang1040"><input type="text"></li>
                           <div class="clearfix"></div>
                        </ul>
                    </dd> -->
                    <dd class="jianjie">
                    	<ul>
							<li>简　　介：</li>
                            <li>
                            	<textarea id="doctor_brief" name="doctor_brief">${pd.doctor_brief}</textarea>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </dd>
                    <dd class="jianjie">
                    	<ul>
							<li>擅　　长：</li>
                            <li>
                            	<textarea id="doctor_expert" name="doctor_expert">${pd.doctor_expert}</textarea>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </dd>
                
                </dl>
            
        	<div class="clearfix"></div>
        </div>
        </form>
        <div class="baocunfanhui">
        	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
			<a class="btn btn-mini btn-danger" href="<%=basePath%>doctorManage/doctorInfoList.do">返回</a>
        </div>
        <div class="clearfix"></div>
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
	    	document.getElementById("MyFiles").innerHTML = "<img src='"+path+"' width=150px; height=200px/>"; 
	    }
	}
	
	//删除图片
	function delP(PATH,doctor_id){
		if(confirm("确定要删除图片？")){
			var url = "doctorManage/delTxiang.do?PATH="+PATH+"&doctor_id="+doctor_id;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					window.location.href='<%=basePath%>doctorManage/toUpdDoctor.do?doctor_id='+doctor_id;
				}
			});
		} 
	}
	
	//保存
	function save(){
		if($("#doctor_position").val()==""){
			$("#doctor_position").tips({
				side:3,
	            msg:'请选择医生职称',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_position").focus();
			return false;
		}
		
		if($("#doctor_work").val()==""){
			$("#doctor_work").tips({
				side:3,
	            msg:'请输入工龄',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_work").focus();
			return false;
		}
		
		if($("#doctor_name").val()==""){
			$("#doctor_name").tips({
				side:3,
	            msg:'请输姓名',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_name").focus();
			return false;
		}
		
		if($("#doctor_birth").val()==""){
			$("#doctor_birth").tips({
				side:3,
	            msg:'请输入出生日期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_birth").focus();
			return false;
		}
		
		if($("#doctor_sex").val()==""){
			$("#doctor_sex").tips({
				side:3,
	            msg:'请输入请输入性别',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_sex").focus();
			return false;
		}
		
		var myreg = /^[1][0-9][0-9]{9}$/;
		var phone = /^0\d{2,3}-?\d{7,8}$/;
		if($("#doctor_phone").val()==""){
			$("#doctor_phone").tips({
				side:3,
	            msg:'请输入联系方式',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_phone").focus();
			return false;
		}else if(!phone.test($("#doctor_phone").val())  && !myreg.test($("#doctor_phone").val())){
			$("#doctor_phone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#u_telphone").focus();
			return false;
		}
		
		var papernum=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
		if($("#d_papernum").val()==""){
			$("#d_papernum").tips({
				side:3,
	            msg:'请输入证件号码',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_papernum").focus();
			return false;
		}else if(!papernum.test($("#d_papernum").val())){
			$("#d_papernum").tips({
				side:3,
	            msg:'证件号格式不正确',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_papernum").focus();
			return false;
		}
		
		if($("#doctor_education").val()==""){
			$("#doctor_education").tips({
				side:3,
	            msg:'请选择教育程度',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_education").focus();
			return false;
		}
		
		if($("#d_award").val()==""){
			$("#d_award").tips({
				side:3,
	            msg:'请输入营业证日期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_award").focus();
			return false;
		}
		
		if($("#selectHospital").val()==""){
			$("#selectHospital").tips({
				side:3,
	            msg:'请选择所在医院',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#selectHospital").focus();
			return false;
		}
		
		if($("#selectOffice").val()==""){
			$("#selectOffice").tips({
				side:3,
	            msg:'请选择所在科室',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#selectOffice").focus();
			return false;
		}
		
		if($("#doctor_brief").val()==""){
			$("#doctor_brief").tips({
				side:3,
	            msg:'请输入简介',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_brief").focus();
			return false;
		}
		
		if($("#doctor_expert").val()==""){
			$("#doctor_expert").tips({
				side:3,
	            msg:'请输入擅长',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctor_expert").focus();
			return false;
		}
		
		$("#doctorInfoForm").submit();
	}
	</script>
	
	<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function searchExam(){
			top.jzts();
			$("#examRecordForm").submit();
		};
		function changeView(recordType){
			var uuid = $("#uuid").val();
			if(recordType =="chart"){
				window.location.href="examRecord/listRecordChart.do?uuid="+uuid;
			}
		};
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
		$(function() {
			//日期框
			$('.date-picker').datepicker();
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		});
		</script>
</body>
</html>