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
.sf_chsf_ml20{ margin-left:20px;}
.sf_chsf_mb20{ margin-bottom:20px;}
.sf_chsf_mb40{ margin-bottom:40px;}
.sf_chsf_center_box .sf_chsf_shurukuang{ width:175px; height:30px; padding-left:5px; outline:none; background-color:#ffffff; border:1px #abadb3 solid;}
.sf_chsf_center_box select{ width:180px; outline:none; height:30px;}
.sf_chsf_xuxian{ width:1130px; height:1px; background-image:url(static/img/mz_xuxian.png);}
.sf_chsf_suifangneirong{ background-image:url(static/img/neirong14px.png); background-repeat:no-repeat; padding-left:21px; margin-bottom:10px; margin-top:40px;}
.sf_chsf_center_box .shurukuang{width:1048px; outline:none; line-height:32px;}
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
</style>

</head>
<body style="background-color: white;">
<div class="container-fluid" id="main-container">
<ul class="table">
        <li class="l_yuanjiao"><a href="<%=basePath%>userInfoController/getDetails.do?uuid=${pd.uuid}">基本信息</a></li>
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
                    	<li><b>随访类型：</b><input type="text" class="sf_xiahuaxian180" value='<c:if test="${pd.F_TYPE=='p'}">孕期随访</c:if><c:if test="${pd.F_TYPE=='d'}">产后随访</c:if>'></li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                    	<li>随访方式:
							<input type="text" class="sf_xiahuaxian180" value="${pd.F_STYLE }随访">
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
                        	<input type="text" class="sf_xiahuaxian160" value="${pd.F_DATE}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_suifangneirong">随访内容</dd>
                <dd class="sf_chsf_xuxian sf_chsf_mb20"></dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>体　　重：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.D_WEIGHT}kg">
                        </li>
                        <li class="sf_chsf_ml43">血　　压：
                        	<input type="text" class="sf_xiahuaxian180" value="${pd.D_BLOOD}">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>

                        <li>心理状况：</li>
                        <li class="shurukuang">
                        ${pd.D_PSYCHIC}
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                        <li>健康状况：</li>
                        <li class="shurukuang">
						${pd.D_HEALTH}
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                 <dd class="sf_chsf_mb20">
                	<ul>
                        <li>乳　　房：<input type="radio" name="d_uber" value="无异常" onclick="rfs()" checked="checked">无异常</li>
						<li class="sf_chsf_ml20">
                            <input type="radio" name="d_uber" id="rf" onclick="rf1()">异常
                            <input type="text" id="d_uber" name="d_uber1" class="sf_xiahuaxian360" readonly="true">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                        <li>恶　　露：<input type="radio" name="d_lyma" value="无异常" onclick="els()" checked="checked">无异常</li>
						<li class="sf_chsf_ml20">
                            <input type="radio" name="d_lyma" onclick="el1()" id="el">异常
                            <input type="text" class="sf_xiahuaxian360" id="d_lyma" name="d_lyma1" readonly="true">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                        <li>子　　宫：<input type="radio" name="d_womb" value="无异常" onclick="zgs()" checked="checked">无异常</li>
						<li class="sf_chsf_ml20">
                            <input type="radio" name="d_womb" onclick="zg1()" id="zg">异常
                            <input type="text" class="sf_xiahuaxian360" id="d_womb" name="d_womb1" readonly="true">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd class="sf_chsf_mb20">
                	<ul>
                        <li>伤　　口：<input type="radio" name="d_wound" value="无异常" onclick="sks()" checked="checked">无异常</li>
						<li class="sf_chsf_ml20">
                            <input type="radio" name="d_wound" onclick="sk1()" id="sk">异常
                            <input type="text"  name="d_wound1" id="d_wound" class="sf_xiahuaxian360" readonly="true">
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </dd>
                <dd>
                	<ul>
                        <li>健康指导：</li>
                        <li class="shurukuang">
                        	${pd.D_EDUCATION}
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
		
		if('${msg}'=='MedFollowDUpd'){
			
			if('${pd.D_UBER}' != '无异常'){
				$('#rf').attr('checked', 'true');
				 $("#d_uber").attr("readonly",false);
				$('#d_uber').val('${pd.D_UBER}');
			}
			if('${pd.D_LYMA}' != '无异常'){
				$('#el').attr('checked', 'true');
				 $("#d_lyma").attr("readonly",false);
				$('#d_lyma').val('${pd.D_LYMA}');
			}
			if('${pd.D_WOMB}' != '无异常'){
				$('#zg').attr('checked', 'true');
				 $("#d_womb").attr("readonly",false);
				$('#d_womb').val('${pd.D_WOMB}');
			}
			if('${pd.D_WOUND}' != '无异常'){
				$('#sk').attr('checked', 'true');
				 $("#d_wound").attr("readonly",false);
				$('#d_wound').val('${pd.D_WOUND}');
			}
		
		}
		 $("input").attr("readonly",true);
	});
		
		
		function fan(){
			window.location.href="<%=basePath%>MedFollowController/listPageMedFollow.do?uuid=${pd.uuid}";
		}
	
	</script>
</body>
</html>