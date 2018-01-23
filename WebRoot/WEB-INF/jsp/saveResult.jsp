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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
<base href="<%=basePath%>">
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

</head>
<body>
	<div id="zhongxin"></div>
	<script type="text/javascript">
		var msg = "${msg}";
		var mss = "${mss}";
		var med = "${med}";
		var dmc = "${dmc}";
		var out = "${out}";
		
		if(msg !=""){
		if(msg=="success"){
			window.location.href ="eduContentController/listPdPageContent.do";
		}else if((msg=="adInfo")){
			window.location.href ="adInfoController/allAdInfo.do";
		}else if((msg=="addDetails" || msg=="updDetails")){
			window.location.href ="userInfoController/listPdPageUserInfo.do";
		}else{
			window.location.href ="error.jsp";
		}
	}
		
		if(mss!=""){
		if(mss=="hospitalizedTreatAdd"){
			window.location.href="hospitalizedController/listPdPageHospitalized.do?uuid=${uuid}";	
		}else if(mss=="hospitalizedTreatUpd"){
			window.location.href="hospitalizedController/listPdPageHospitalized.do?uuid=${uuid}";	
		}else if(mss=="hdAdd"){
			window.location.href="hospitalizedController/listPdPageHospitalized.do?uuid=${uuid}";	
		}else if(mss=="hdUpd"){
			window.location.href="hospitalizedController/listPdPageHospitalized.do?uuid=${uuid}";	
		}
		else{
			window.location.href ="error.jsp";
		}
	}
		
	if(med!=""){
		
		if(med=="medFollowPAdd" || med=="medFollowPUpd"){
			window.location.href="MedFollowController/listPageMedFollow.do?uuid=${uuid}";	
		}else if(med=="medFollowDAdd" || med=="medFollowDUpd"){
			window.location.href="MedFollowController/listPageMedFollow.do?uuid=${uuid}";	
		}
		else{
			window.location.href ="error.jsp";
		}
	}
	
	if(dmc!=""){
	
		if(dmc=="updDoctor" || dmc=="addDoctor"){
			window.location.href="doctorManage/doctorInfoList.do";	
		}
		else{
			window.location.href ="error.jsp";
		}
	}
	
	if(out!=""){
		
		if(out=="add1"){
			window.location.href="uoutpatientController/findUoutpatient.do?uuid=${uuid}";	
		}
		else{
			window.location.href ="error.jsp";
		}
	}
	</script>
	
</body>
</html>