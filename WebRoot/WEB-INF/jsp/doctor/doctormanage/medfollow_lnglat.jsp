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
	<!-- jsp文件头和头部 -->
	<title>${pd.SYSNAME}</title>
	<meta name="description" content="overview & stats" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<!-- jsp文件头和头部 -->
	
	
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
	<title>轨迹回放</title>  
	<style type="text/css">  
		html{height:100%}  
		body{height:100%;margin:0px;padding:0px}  
		#container{height:100%;}
		.input-date{
			padding: 10px 20px;
		}
		.input-date input{
			height: 30px;
		}
		.input-note{
			line-height: 30px;
			font-size: 12px;
			padding-left: 20px;
		}
</style>  
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=YWdGplhYjUGQ3GtpKNeuTM2S"></script>
	<script type="text/javascript" src="static/xiaolu/baidu/WdatePicker.js"></script>
	
	<style type="text/css">
	*{ font-size:14px; color:#595959; font-family:"宋体";}
	.clearfix{ clear:both;}
	dd,dl,ul,li{ margin:0; padding:0; list-style:none;}
	h1{ font-size:16px; font-weight:bold; margin-left:20px; margin-top:40px; margin-bottom:10px;}
	a{ text-decoration:none;}
	input{ list-style:none; border:none; margin:0; padding:0;}
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
	.suifang li{ float:left;}
	.suifang .search{ width:180px; line-height:30px; border:#dedede 1px solid; color:#cccccc; padding-left:10px; background-image:url(imgs/huanzheguanli_jc_jlb_time_table.png); background-repeat:no-repeat; background-position:92% 50%;}
	.suifang .but1{ width:32px; line-height:32px; margin-left:10px; background-image:url(static/xiaolu/imgs/bg_search.png); background-repeat:no-repeat; background-position:center;}
	.big_box .ditu{ width:1000px; height:696px; border:#dedede 1px solid; margin-top:20px;}
</style>

</head> 
<body>
	<ul class="table">
        <li class="l_yuanjiao"><a href="<%=basePath%>doctorManage/toUpdDoctor.do?doctor_id=${pd.doctor_id}">基本信息</a></li>
        <li class="no_border"><a href="<%=basePath%>doctorManage/toDisease.do?doctor_id=${pd.doctor_id}">患者记录</a></li>
        <li class="r_yuanjiao this"><a href="<%=basePath%>MedFollowLnglat/listPageMedFollow.do?doctor_id=${pd.doctor_id}">随访轨迹</a></li>
        <div  class="clearfix"></div>
	</ul>
	<div class="big_box">
		<ul class="suifang">
	    	<li><input type="date" id="followDate" name="followDate" onchange ="findDate(this.value,'${pd.doctor_id}');" style="width:130px;margin-right:10px; border:1px solid #dedede; line-height:30px;" value="${pd.followDate}"></li>
	       	<li>
       		  <select id="user_id" name="user_id" style="width:100px;height:34px; border:1px solid #dedede; line-height:30px;" onchange ="findUserLine(this.options[this.options.selectedIndex].value);">
             	<option value="">请选择</option>
           		 	
              </select>
              
            </li>
	       <!--  <li><input type="button" class="but1" onclick="search();"></li> -->
	        <div  class="clearfix"></div>
	    </ul>
	     <div  class="clearfix"></div>
	     <div id="ditu"></div>

	</div>
<div id="container"></div>
	

	<script type="text/javascript">

		/*my97时间选择控件--开始*/
		var md=""; //第二个输入框最大值的全局变量

      	//第一个输入框选择好日期的时候操作
      	function pickedFunc(){

      		var Y=$dp.cal.getP('y');
      		var M=$dp.cal.getP('M');
      		var D=$dp.cal.getP('d');
      		var H=$dp.cal.getP('H');
      		var M1=$dp.cal.getP('m');
      		var S=$dp.cal.getP('s');

      		H=parseInt(H)+2;//相差只能是两小时
      		M=parseInt(M)-1;
      		D=parseInt(D);
      		H=parseInt(H);
      		M1=parseInt(M1);
      		S=parseInt(S);

      		var d = new Date();
			d.setFullYear(Y,M,D); //设置时间
			d.setHours(H,M1,S);

			var nowDate=new Date();
			//跟现在的时间比较，如果算出来的值大于现在时间，修改全局变量md为现在时间。否则为算出来的时间。
			if(nowDate<=d){
				md="";
			}else{
				var month=d.getMonth()+1; //月份的范围是（0到11）;
				md=d.getFullYear()+"-"+month+"-"+d.getDate()+" "+H+":"+M1+":"+S; //直接把d给过去会有问题，所以拼成字符串发过去
			}
		}

		//第一个清空的时候的操作
		function clearedFunc(){
			md= "";
		}
		//给第二个输入框定义规则
		function picker2rule(ele){
			if(md == ""){
				WdatePicker({el:ele,minDate:'#F{$dp.$D(\'datepicker1\')}',maxDate:'%y-%M-%d %H:%m:%s',dateFmt:'yyyy-MM-dd HH:mm:ss'});
			}else{
				WdatePicker({el:ele,minDate:'#F{$dp.$D(\'datepicker1\')}',maxDate:md,dateFmt:'yyyy-MM-dd HH:mm:ss'});
			}
		}
		/*my97时间选择控件--结束*/

	</script>

	<script type="text/javascript"> 
	// 实时轨迹demo。  轨迹回放功能。
	// 实际运用的话可能ajax实时读取后台数据，加载到地图上。

		//工具函数
		// 获取随机数

		//数据准备
		var points = [];

		var donePoints = [];//已经显示的点。
		var bPoints = [];//保存百度化的坐标组。用于重设地图的中心点和显示级别。
		var timerArr=[];//定时器
		var interval;
		var allPoints;//所有轨迹的点
		//地图操作开始
		var map = new BMap.Map("container"); 
		
		map.centerAndZoom(new BMap.Point(103.388611,35.563611), 5); //初始显示中国。

		map.enableScrollWheelZoom();//滚轮放大缩小 
		
		//根据时间选择。
		function loadTrackByTime(){
			//清除当前所有的定时器和地图上的覆盖物。
			//map.clearOverlays();
			for (var t = 0; t < timerArr.length; t++) {
				clearTimeout(timerArr[t]);
			};
			timerArr = [];
			clearInterval(interval);
			bPoints.length = 0;
			donePoints.length = 0;

			var dateBegin ="00:00:00";//document.getElementById('datepicker1').value;
			var dateEnd = $.trim($("#followDate").val())+" 23:59:59";//document.getElementById('datepicker2').value;
	
			//从原始数组中查询符合条件的坐标点。
			var pointsLen = points.length;
			var searchRes = [];//用来装符合条件的坐标信息。

			//满足条件的放上去。
			for (var i = 0; i < pointsLen; i++) {
				/* if(dateDiff(points[i].time,dateBegin)>0&&dateDiff(points[i].time,dateEnd)<0){
					searchRes.push(points[i]);
				} */
				searchRes.push(points[i]);
			};
			
			//trackTime(dateBegin);

			for (var j = 0; j < searchRes.length; j++) {
				//var wait = dateDiff(searchRes[j].time,dateBegin)*10;//等待时间。	
				
				var pointAg = [searchRes[j]],timer;//闭包
				
				var doneLen = donePoints.length;
				var linePoints = [];

				if(doneLen!=0){				
					linePoints.push(donePoints[doneLen-1]);
				}
				linePoints.push(pointAg[0]);
				donePoints.push(pointAg[0]);
				addLine(linePoints); //把原始数据的轨迹线添加到地图上。
				
				addMarker(pointAg); 

				bPoints.push(new BMap.Point(pointAg[0].lng,pointAg[0].lat));
				setZoom(bPoints); 
				timerArr.push(timer);
				 /* (function() {

					var pointAg = [searchRes[j]],timer;//闭包
					timer = setTimeout(function(){

						var doneLen = donePoints.length;
						var linePoints = [];

						if(doneLen!=0){				
							linePoints.push(donePoints[doneLen-1]);
						}
						linePoints.push(pointAg[0]);
						donePoints.push(pointAg[0]);
						addLine(linePoints); //把原始数据的轨迹线添加到地图上。
						
						addMarker(pointAg); 

						bPoints.push(new BMap.Point(pointAg[0].lng,pointAg[0].lat));
						setZoom(bPoints); 

					},10);
					timerArr.push(timer);
				})(); */

			};

		}


		function getRandom(n){
			return Math.floor(Math.random()*n+1)
		}

		//根据点信息实时更新地图显示范围，让轨迹完整显示。设置新的中心点和显示级别
		function setZoom(bPoints){
			var view = map.getViewport(eval(bPoints));
			var mapZoom = view.zoom; 
			var centerPoint = view.center; 
			map.centerAndZoom(centerPoint,mapZoom);
		}

		//在轨迹点上创建图标，并添加点击事件，显示轨迹点信息。points,数组。
		function addMarker(points){
			var pointsLen = points.length;
			if(pointsLen == 0){
				return;
			}
			var myIcon = new BMap.Icon("static/xiaolu/baidu/bigtrack.ico", new BMap.Size(10, 10), {
				offset: new BMap.Size(10, 10) 
			});

			// 创建标注对象并添加到地图   
			for(var i = 0;i <pointsLen;i++){
				var point = new BMap.Point(points[i].lng,points[i].lat);
				var marker = new BMap.Marker(point, {icon: myIcon});
				map.addOverlay(marker); 
				(function() {
					var thePoint = points[i];
					marker.addEventListener("click",function(){
						showInfo(this,thePoint);
					});
				})();
			}
		}    

		//点击轨迹点后显示信息窗口
		function showInfo(thisMaker,point){
			var sContent =
			"<ul style='margin:0 0 5px 0;padding:0.2em 0'>"
			+"<li style='line-height: 26px;font-size: 15px;'>"
			+"<span style='width: 50px;display: inline-block;'>地址：</span>" + point.address + "</li>"
			+"<li style='line-height: 26px;font-size: 15px;'><span style='width: 50px;display: inline-block;'>时间：</span>"+point.time +"</li>"
			+"</ul>";
			var opts = {
					enableMessage:false
			}
			var infoWindow = new BMap.InfoWindow(sContent,opts);  // 创建信息窗口对象
	   		thisMaker.openInfoWindow(infoWindow);   //图片加载完毕重绘infowindow
	   	}

		//添加线
		function addLine(points){
			var linePoints = [];
			var pointsLen = points.length;
			if(pointsLen == 0){
				return;
			}
			// 创建标注对象并添加到地图   
			for(var i = 0;i <pointsLen;i++){
				linePoints.push(new BMap.Point(points[i].lng,points[i].lat));
			}
			var polyline = new BMap.Polyline(linePoints, {strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});   //创建折线
			map.addOverlay(polyline);   //增加折线
		}
		//显示轨迹运行的时间
		function trackTime(beginTime){
			var beginTimestamp = Date.parse(new Date(beginTime));
			interval = setInterval(function(){

				var time =  getDate(beginTimestamp).time;
				document.getElementById('realTime').innerHTML = "回放时间"+time;
				beginTimestamp = beginTimestamp + 1000;

			},1000)

		}

		//根据时间戳（毫秒），返回处理过后的时间。
		function getDate(ms){
			var res;
			if(ms!=undefined){
				var today = new Date()
				today.setTime(ms);
			}else{
				var today = new Date();
			}

			var year,month,day,hour,minute,second;
			year = today.getFullYear();
			month = today.getMonth() + 1;
			if(month<10){
				month = '0'+month;
			}
			day = today.getDate();
			if(day<10){
				day = '0'+day;
			}
			hour = today.getHours();
			if(hour<10){
				hour = '0'+hour;
			}
			minute = today.getMinutes();
			if(minute<10){
				minute = '0'+minute;
			}
			second = today.getSeconds();
			if(second<10){
				second = '0'+second;
			}
			res={
				'y':year,
				'M':month,
				'd':day,
				'h':hour,
				"m":minute,
				"s":second,
				"time":year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second,
				"date":year+"-"+month+"-"+day
			}
			return res;
		}

		//求时间差的方法
		function dateDiff(date1, date2){ 
			var type1 = typeof date1, type2 = typeof date2; 
			if(type1 == 'string') 
				date1 = stringToTime(date1); 
			else if(date1.getTime) 
				date1 = date1.getTime(); 
			if(type2 == 'string') 
				date2 = stringToTime(date2); 
			else if(date2.getTime) 
				date2 = date2.getTime(); 
		    return (date1 - date2) / 1000;//结果是秒 
		}

		//字符串转成Time(dateDiff)所需方法 
		function stringToTime(string){ 
			var f = string.split(' ', 2); 
			var d = (f[0] ? f[0] : '').split('-', 3); 
			var t = (f[1] ? f[1] : '').split(':', 3); 
			return (new Date( 
				parseInt(d[0], 10) || null, 
				(parseInt(d[1], 10) || 1)-1, 
				parseInt(d[2], 10) || null, 
				parseInt(t[0], 10) || null, 
				parseInt(t[1], 10) || null, 
				parseInt(t[2], 10) || null 
				)).getTime();

		}

		function search(){
			var followDate = $.trim($("#followDate").val());
			if(followDate==null || followDate==''){
				alert("请选择日期！");
				return;
			}
			var doctor_id = '${pd.doctor_id}';
			$.ajax({
				type: "POST",
				url: '<%=basePath%>MedFollowLnglat/getMedFollow.do',
		    	data: {followDate:followDate,doctor_id:doctor_id},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
							map.clearOverlays();//清除地图轨迹
							var medFollowList =  data.medFollowList;
							allPoints = data.pd;
							if(medFollowList.length==0){
								alert("今天没随防!");
								return;
							}
							for(var i=0;i< medFollowList.length;i++){
								points = medFollowList[i];
								loadTrackByTime();
							}
							
					 }else{
						alert("失败！");
					 }
				}
			});
		}
		
		function findUserLine(fId){
			var searchRes = [];
			if(fId==""){
				return;
			}
			bPoints.length = 0;
			searchRes= allPoints[fId];
			for (var j = 0; j < searchRes.length; j++) {
				var pointAg = [searchRes[j]],timer;//闭包
				bPoints.push(new BMap.Point(pointAg[0].lng,pointAg[0].lat));
				setZoom(bPoints);
			}
			
		}
	</script>  
	<script type="text/javascript">
		
	 	function findDate(searchDate,doctor_id){
	 		$.ajax({
				type: "POST",
				url: '<%=basePath%>MedFollowLnglat/userOption.do',
		    	data: {searchDate:searchDate,doctor_id:doctor_id},
				dataType:'json',
				cache: false,
				success: function(data){
					 var select = document.getElementById("user_id");
					 	select.options.length=0; 
					 	$("#user_id").append("<option value='' select>请选择</option>");
					 	$.each(data.list, function(i,user){
				        	$("#user_id").append("<option value='"+user.id+"'>"+user.user_namezs+"</option>");
						 });
					}
			});
	 		search();
	 		
	 	}
		
		
	 	
		$(top.hangge());

	</script>	
	</body>
</html>

