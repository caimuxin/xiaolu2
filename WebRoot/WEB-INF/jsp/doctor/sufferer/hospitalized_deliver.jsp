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
		
		.sf_chsf_center_box .zy_zyzl_shurukuang{ width:175px; height:30px; padding-left:5px; outline:none; background-color:#ffffff; border:1px #abadb3 solid;}
		.sf_chsf_center_box select{ width:180px; outline:none; height:30px;}
		.sf_chsf_xuxian{ width:1130px; height:1px; background-image:url(imgs/mz_xuxian.png);}
		.sf_chsf_suifangneirong{ background-image:url(<%=basePath%>static/images/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
		.sf_chsf_center_box textarea{ width:1048px; height:98px; outline:none; line-height:20px;}
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
		.but1:hover{ background-image:url(imgs/bg_shanchu.png); background-repeat:no-repeat; background-position:center;}
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
		.but2:hover{ background-image:url(imgs/bg_baocun.png); background-repeat:no-repeat; background-position:center;}
		.zy_zyzl_suoluetu ul{ float:left;}
		.sf_yqsf_shangchuantupian{ width:60px; height:30px; border:none; background-image:url(imgs/mz_shangchuan.png); cursor:pointer;}
		.sf_yqsf_shangchuantupian:hover{ background-image:url(imgs/mz_shangchuan_hover.png);}
		.zy_zyzl_quanbuxiazai input{ border:none; font-size:12px; color:#4f99c6;margin-top:10px; outline:none; cursor:pointer; background:none;}
		.zy_zyzl_quanbuxiazai input:hover{ color:#1b6aaa;}
		.sf_chsf_mb20 ul li span input[type=checkbox]{
			 position: relative;top: 2px;
		}
		.sf_chsf_mb20 ul li span input[type=radio]{
			 position: relative;top: 2px;
		}
		</style>

	</head>
<body style="background-color: white;">
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">
		 <ul class="table">
        <li class="l_yuanjiao no_border"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>uoutpatientController/findUoutpatient.do?uuid=${pd.uuid}">门诊记录</a></li>
        <li class="no_border this"><a href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">住院记录</a></li>
        <li class="no_border"><a href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}">随访记录</a></li>
        <li class="r_yuanjiao"><a href="<%=basePath%>examRecord/examRecordList.do?uuid=${pd.uuid}">检测记录</a></li>
        <div  class="clearfix"></div>
	</ul>
	 <form action="hospitalizedController/${msg}.do" name="hdForm" id="hdForm" method="post" enctype="multipart/form-data">
	 <input type="hidden" id="uuid" name="uuid" value="${pd.uuid}">
	 <input type="hidden" id="h_id" name="h_id" value="${pd.H_ID}">
	 <input type="hidden" id="d_styles" name="d_styles">
        <div class="sf_chsf_big_box">
    	<div class="sf_chsf_center_box">
        	<dl>
            	<dd class="sf_chsf_mb20">
                	<ul>
                    	<li><strong>住院类型：</strong>
                   	     <select name="h_type" id="h_type" onchange="bao(this.options[this.options.selectedIndex].value)">
                                	<option value="b">住院分娩</option>
                                    <option value="t">住院治疗</option>
                          </select>
                         </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb40">
                	<ul>

                        <li>住院日期：
                        	<input id="h_in_date" name="h_in_date" type="date" value="${pd.H_IN_DATE}" class="sf_xiahuaxian180">
                        </li>

                         <li class="sf_chsf_ml43 float_right">出院日期日期：
                        	<input id="h_out_date" name="h_out_date" value="${pd.H_OUT_DATE}" type="date" class="sf_xiahuaxian180">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>分娩时间：
                        	<input id="d_datetime" name="d_datetime" value="${pd.D_DATETIME}" type="date" class="sf_xiahuaxian180">
                        </li>
                        <li class="sf_chsf_ml34">分娩孕周：
                        	<input type="text" class="sf_xiahuaxian180" id="d_week" name="d_week" value="${pd.D_WEEK}">
                        </li>
                        <li class="sf_chsf_ml34">　总产程：
                        	<input type="text" class="sf_xiahuaxian180" id="d_alltime" name="d_alltime" value="${pd.D_ALLTIME}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
						<li>分娩医院：
								<select id="hospital_id" name="hospital_id" onchange ="findHospitalId(this.options[this.options.selectedIndex].value);">
								<option value="">请选择</option>
			                        <c:forEach items="${psList}" var="ps">
			                   	    	<option value="${ps.id}" <c:if test="${ps.id==pd.HOSPITAL_ID}">selected</c:if>>${ps.hospitalname}</option>
			                   	    </c:forEach>
                   	   			 </select>
                        </li>
                        <li class="sf_chsf_ml34">助产医生：
                        	<select id="doctorId" name="doctor_id">
	                   	    	<option value="">请选择</option>
	                   	    <c:forEach items="${dcList}" var="dc">
	                   	    	<option value="${dc.doctor_id}"<c:if test="${pd.DOCTOR_ID==dc.doctor_id}">selected</c:if> >${dc.doctor_name}</option>
	                   	    </c:forEach>
	                   	    </select>
                        	<%-- <input type="text" class="sf_xiahuaxian180" id="doctor_id" name="doctor_id"  value="${pd.DOCTOR_ID}"> --%>
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

                        <li class="box">产科并发症：
                        	<input type="text" class="sf_xiahuaxian360" id="m_complication" name="m_complication" value="${pd.M_COMPLICATION}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong">新生儿情况</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>体　　重：
                        	<input type="text" class="sf_xiahuaxian180" id="b_weight" name="b_weight" value="${pd.B_WEIGHT}">
                        </li>
                        <li class="sf_chsf_ml34">身　　长：
                        	<input type="text" class="sf_xiahuaxian180" id="b_height" name="b_height" value="${pd.B_HEIGHT}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20" id="f2">
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

                        <li class="box">新生儿并发症：
                        	<input type="text" class="sf_xiahuaxian360" id="b_complication" name="b_complication" value="${pd.B_COMPLICATION}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong" id="attachment">住院单据</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="zy_zyzl_suoluetu">
                	<ul>
                        <li class="sf_chsf_ml10" style="width: 200px;"	>
                        <c:if test="${pd == null || pd.ATTACHMENT == '' || pd.ATTACHMENT == null }">
                        <input type="file" id="tp" name="tp" onchange="fileType(this)"/>
                        </c:if>
                        <c:if test="${pd != null && pd.ATTACHMENT != '' && pd.ATTACHMENT != null }">
							<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.ATTACHMENT}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.ATTACHMENT}" width="210"/></a>
							<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.ATTACHMENT}','${pd.H_ID}');" />
							<input type="hidden" name="tpz" id="tpz" value="${pd.ATTACHMENT }"/>
						</c:if>
                        </li>
                        <div class="clearfix"></div>
                     </ul>
                     <div class="clearfix"></div>
                </dd>
                <dd class="zy_zyzl_suoluetu">
                	<ul>
                        <li class="sf_chsf_ml10" style="width: 200px;" id="MyFiles">
                        </li>
                        <div class="clearfix"></div>
                     </ul>
                     <div class="clearfix"></div>
                </dd>
              <!--   <dd class="zy_zyzl_quanbuxiazai"><input type="submit" value="全部下载"></dd> -->
            </dl>
        </div>
        <ul class="sf_chsf_ml20">
       		<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
			<a class="btn btn-mini btn-danger" href="<%=basePath%>hospitalizedController/listPdPageHospitalized.do?uuid=${pd.uuid}">返回</a>
        </ul>
         
    </div>
	 </form>
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
	//下拉框触发事件
	function bao(s)
	{
		if(s=='t'){
			window.location.href='<%=basePath%>hospitalizedController/getHospitalizedTreat.do?uuid=${pd.uuid}';
		}
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
	    }else{
	    	var path = URL.createObjectURL(obj.files[0]);
	    	document.getElementById("MyFiles").innerHTML = "<img src='"+path+"' width=300px; height=300px/>"; 
	    }
	}
	
	//删除图片
	function delP(PATH,h_id){
		if(confirm("确定要删除图片？")){
			var url = "hospitalizedController/attachmentDels.do?PATH="+PATH+"&h_id="+h_id;
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
		
		var tdlist = $("#f1").find("ul").find("li").find("span");
		var chkboxstr = "";
		$.each(tdlist,function(idx,item){
		var chkbox = $(this).find("input[type=checkbox]");
		if($(chkbox).attr("checked")){
		chkboxstr += $(chkbox).val() + ","
		}
		});
		$("#d_styles").attr("value",chkboxstr);
		
		
		if($("#h_in_date").val()==""){
			$("#h_in_date").tips({
				side:3,
	            msg:'请输入住院日期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#h_in_date").focus();
			return false;
		}
		
		if($("#h_out_date").val()==""){
			$("#h_out_date").tips({
				side:3,
	            msg:'请输入出院日期',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#h_out_date").focus();
			return false;
		}
		
		if($("#d_datetime").val()==""){
			$("#d_datetime").tips({
				side:3,
	            msg:'请输入分娩时间',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_datetime").focus();
			return false;
		}
		
		if($("#d_week").val()==""){
			$("#d_week").tips({
				side:3,
	            msg:'请输入分娩周',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_week").focus();
			return false;
		}
		
		if($("#d_alltime").val()==""){
			$("#d_alltime").tips({
				side:3,
	            msg:'请输入总产程',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#d_alltime").focus();
			return false;
		}
		
		if($("#hospital_id").val()==""){
			$("#hospital_id").tips({
				side:3,
	            msg:'请选择分娩医院',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#hospital_id").focus();
			return false;
		}
		
		if($("#doctorId").val()==""){
			$("#doctorId").tips({
				side:3,
	            msg:'请选择助产医生',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#doctorId").focus();
			return false;
		}
		
		if($("#b_weight").val()==""){
			$("#b_weight").tips({
				side:3,
	            msg:'请输入体重',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#b_weight").focus();
			return false;
		}
		
		if($("#b_height").val()==""){
			$("#b_height").tips({
				side:3,
	            msg:'请输入身长',
	            bg:'#AE81FF',
	            time:2
			 });
			$("#b_height").focus();
			return false;
		}
		
		$("#hdForm").submit(); 
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