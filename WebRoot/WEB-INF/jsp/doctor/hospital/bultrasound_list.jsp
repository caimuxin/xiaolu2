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
	<%@ include file="../../system/admin/top.jsp"%> 
	<link rel="stylesheet" href="static/css/bultrasound.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	</head> 
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">

<div class="big_box">
<!--导航-->
   <ul class="table">
        <li <c:choose><c:when test="${tabId ==1 }">class="l_yuanjiao this"</c:when><c:otherwise>class="l_yuanjiao"</c:otherwise></c:choose> >
        	<a href="antanetalExam/listAntanetalExam.do">门诊预约</a>
        </li>
        <li <c:choose><c:when test="${tabId ==2 }">class="this"</c:when><c:otherwise></c:otherwise></c:choose>>
        	<a href="bUltrasound/listBUltrasound.do">B超预约</a>
        </li>
        <li <c:choose><c:when test="${tabId ==3 }">class="no_border this"</c:when><c:otherwise>class="no_border"</c:otherwise></c:choose>>胎心预约</li>
        <li <c:choose><c:when test="${tabId ==4 }">class="r_yuanjiao this"</c:when><c:otherwise>class="r_yuanjiao"</c:otherwise></c:choose>>唐氏筛查预约</li>
        <div  class="clearfix"></div>
	</ul>
    
<!--一周-->
	<c:choose>
		<c:when test="${tabId == 1}">
			<%@ include file="antanetal_list.jsp"%>
		</c:when>
		<c:when test="${tabId == 2}">
			<!-- b超 -->
			<div class="yizhou">
        
        <ul class="xuanze">
            <li>B超科室：</li>
            <li>
                <select id="selectOffice" onchange ="findSourceInfo(this.options[this.options.selectedIndex].value);">
              	<c:forEach items="${officeList}" var="office">
					<option value="${office.officeId }" name="selecedOfficeId" <c:if test="${office.officeId== officeId}">selected</c:if>>${office.officeName}</option>
				</c:forEach>
                </select>
            </li>
        <div  class="clearfix"></div>
        </ul>
        
        <div class="time">
<!-- 左边固定表start -->
        <table border="1" bordercolor="#dedede" cellspacing="0">
            <tr class="tital">
                <td colspan="2" width="96" height="40">预约时段</td>
                
            </tr>
            <tr >
                <td rowspan="4" width="96" height="24">上午</td>
                <td width="96" height="24" >8:00-8:59</td>
            </tr>
            <tr>
                
                <td height="24" >9:00-9:59</td>
            </tr>
            <tr >
               
                <td height="24" >10:00-10:59</td>
            </tr>
            <tr >
                
                <td height="24" >11:00-11:59</td>
            </tr>
            <tr>
                <td rowspan="4"  >下午</td>
                <td height="24" >14:00-14:59</td>
            </tr>
            <tr >
                
                <td height="24" >15:00-15:59</td>
            </tr>
            <tr >
               
                <td height="24" >16:00-16:59</td>
            </tr>
            <tr >
                
                <td height="24">17:00-17:59</td>
            </tr>

        </table>
<!-- 左边固定表start -->

<!-- 中间数据表end -->            
        <table border="1" bordercolor="#dedede" cellspacing="0">
        	<!-- 表头 -->
            <tr class="tital">
            	
            	<c:forEach items = "${weekInfo}" var = "ds">
            	
            		<td width="100" height="40" <c:if test="${ds.cuDay ==1 }">class="dangri"</c:if> >${ds.weekDay }<br><span>（${ds.bDate}）</span></td>
            	
            	</c:forEach>
            </tr>
            <!-- 表头 -->
            <!-- 数据 start-->
            <c:forEach items = "${mainList}" var = "ds2">
            	<tr >
            		<c:set var="forOrder"  value="0"/>
            		<c:forEach begin="0" end = "6"  varStatus = "vs">
            			<c:choose>
	            			<c:when test="${ds2.timeS[forOrder].dayOrder ==vs.index}">
	            				<td height="24">${ds2.timeS[forOrder].tSourceUsing}/${ds2.timeS[forOrder].tSource }</td>
	            				 <c:set value="${forOrder+1}"  var="forOrder" />
	            			</c:when>
	            			<c:otherwise>
	            				<td height="24"><div class="wu"></div></td>
	            			</c:otherwise>
	            		</c:choose>
            		</c:forEach>
            	</tr >
            </c:forEach>
			<!-- 数据end -->

        </table>
<!-- 中间数据表end -->        
        <table border="1" bordercolor="#dedede" cellspacing="0">
             <tr class="tital">
                 <td class="dangri" height="40" width="94">
              	    队列<br>
                  <span>(${dayOrder.cuDate })</span>
                 </td>
             </tr>
             <!-- 上午提示信息 -->
             <tr>
                <td   height="108">
                <c:choose>
                	<c:when test="${ statInfo.AM_PM==1}">
                		(${statInfo.amStat}/${statInfo.amStat})<br>
                	</c:when>
                	<c:otherwise>
                		(<a>${cuQueueList[0].QCurrentNum }</a>/${statInfo.amStat})<br>
                	</c:otherwise>
                </c:choose>
                
                <c:if test="${ statInfo.AM_PM==0}">
	                <c:forEach items="${cuQueueList }" var ="queue" varStatus = "qVar">
	                <c:if test="${queue.QCurrentNum == queue.qNum }"><a></c:if>
	               	${qVar.index+1 }：${queue.qNumUser }<br>
	               	<c:if test="${queue.QCurrentNum == queue.qNum }"></a></c:if>
	                </c:forEach>
				</c:if>
                </td>
             </tr>
             <!-- 下午提示信息 -->
             <tr >
                <td   height="108">
                 <c:choose>
                	<c:when test="${ statInfo.AM_PM==0}">
                		(0/${statInfo.pmStat})<br>
                	</c:when>
                	<c:otherwise>
                		(<a>${cuQueueList[0].QCurrentNum }</a>/${statInfo.pmStat})<br>
                	</c:otherwise>
                </c:choose>
                
                <c:if test="${ statInfo.AM_PM==1}">
	                <c:forEach items="${cuQueueList }" var ="queue" varStatus = "qVar">
	                <c:if test="${queue.QCurrentNum == queue.qNum }"><a></c:if>
	               	${qVar.index+1 }：${queue.qNumUser }<br>
	               	<c:if test="${queue.QCurrentNum == queue.qNum }"></a></c:if>
	                </c:forEach>
				</c:if>
                
                </td>
             </tr>
             
        </table>
        <div  class="clearfix"></div>
        </div>
      	<div  class="clearfix"></div>
    </div>
    
<!-- 号源统计start -->
	<div class="huizong">    
    <table border="1" bordercolor="e6e6e6" cellspacing="0">
        <tr class="dabiaoti">
            <td colspan="4" height="42">
            <span>${dayOrder.year }年第${dayOrder.weekOfYear }周</span><br>
            (${dayOrder.firstDayOfWeek }-${dayOrder.lastDayOfWeek })
            </td>

       </tr>
        <tr class="xiaobiaoti" height="32">
            <td width="112">科室</td>
            <td width="112">总号源</td>
            <td width="112">占用号源</td>
            <td width="112">有效号源</td>
        </tr>
        <c:forEach items="${ officeList}" var = "officeDay">
        <tr  height="24">
            <td >${ officeDay.officeName}</td>
            <td >${officeDay.dSource}</td>
            <td >${officeDay.dSourceUsing }</td>
            <td >${officeDay.haveSource }</td>
        </tr>
       </c:forEach>
		<tr class="zongji"  height="24">
            <td >总计</td>
            <td >${totalSource }</td>
            <td >${totalSourceUsing }</td>
            <td >${totalHaveSource }</td>
        </tr>
    </table>
<!-- 号源统计end --> 
<!-- 当天科室队列信息start -->      
        <table class="day" border="1" bordercolor="e6e6e6" cellspacing="0" >
        <tr class="dabiaoti">
            <td colspan="4"  height="42">
            <span>${ dayOrder.currentDay}</span><br>
            </td>

       </tr>
       <tr class="xiaobiaoti" height="32">
            <td width="112">科室</td>
            <td width="112">总人数</td>
            <td width="112">实时排号</td>
            <td width="112">就诊人</td>
        </tr>
       <c:forEach items= "${officeQueue }" var = "oq">
       	  <tr  height="24">
            <td >${oq.officeName }</td>
            <td >${oq.qSNum }</td>
            <td ><a>${oq.QCurrentNum }</a></td>
            <td ><a>${oq.qNumUser }</a></td>
        </tr>
       </c:forEach>
    </table>
<!-- 当天科室队列信息end --> 
    <div class="clearfix"></div>
    </div>
    
    
<div  class="clearfix"></div>
			
		</c:when>
	</c:choose>
   	
</div>

</div>
</div>
</div>
</div><!--/.fluid-container#main-container-->
		
	<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<!-- 引入 -->
		<script type="text/javascript">
			$(top.hangge());
			
			
		</script>
		<SCRIPT type="text/javascript">
		function findSourceInfo(officeId){
			var officeId
			window.location.href="bUltrasound/listBUltrasound.do?officeId="+officeId;
		};		
	
		
		$(document).ready(function(){
		});
	</SCRIPT>
		
</body>
</html>

