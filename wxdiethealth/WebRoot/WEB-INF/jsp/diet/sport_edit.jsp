<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>运动量录入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
		<a href="" data-role="button" onclick="window.location.href='../user/user_index'">主页</a>
			<h1>运动量录入</h1>
		</div>
		 <div data-role="fieldcontain" name="type">
		   <label for="sprotType">运动类型：</label>
		   <select name="sprotType1" id="sprotType1" required="false" >
		   <option value="0">请选择</option>
		     <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
		      <option value="${sprotType.id }">${sprotType.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		  <div data-role="fieldcontain" name="time"> 
		   <label for="time1">运动时间：</label>
		   <select name="time1" id="time1" required="false">
		   <option value="0">请选择</option>
		     <c:forEach var="sprotTime" items="${sportTimeList}" varStatus="s">
		      <option value="${sprotTime.id }">${sprotTime.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		   <div data-role="fieldcontain" style="display:none;" id="typediv1">
		   <label for="sprotType">运动类型：</label>
		   <select name="sprotType2" id="sprotType2" required="false" >
		   <option value="0">请选择</option>
		     <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
		      <option value="${sprotType.id }">${sprotType.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		  <div data-role="fieldcontain" style="display:none;" id="timediv1">
		   <label for="time2">运动时间：</label>
		   <select name="time2" id="time2" required="false" >
		   <option value="0">请选择</option>
		     <c:forEach var="sprotTime" items="${sportTimeList}" varStatus="s">
		      <option value="${sprotTime.id }">${sprotTime.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		   <div data-role="fieldcontain" style="display:none;" id="typediv2">
		   <label for="sprotType">运动类型：</label>
		   <select name="sprotType3" id="sprotType3" required="false">
		   <option value="0">请选择</option>
		     <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
		      <option value="${sprotType.id }">${sprotType.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		  <div data-role="fieldcontain" style="display:none;" id="timediv2">
		   <label for="time3">运动时间：</label>
		   <select name="time3" id="time3" required="false">
		   <option value="0">请选择</option>
		     <c:forEach var="sprotTime" items="${sportTimeList}" varStatus="s">
		      <option value="${sprotTime.id }">${sprotTime.name }</option>
		     </c:forEach>
		   </select>
		  </div>
		   <div data-role="fieldcontain">
			     <button onclick="addSport();">新增</button>
			     <button onclick="removeSport();">移除</button>
		   </div> 
		<div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
   </div>
		<div data-role="footer">
			<h1>&nbsp;</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
var num = 1;
function addSport(){
	if(num>=3){
		alert("已达上限！");
	}else{
		$("#typediv"+num).show();
		$("#timediv"+num).show();
		num++;
	}
}

function removeSport(){
	if(num<=1){
		alert("不可移除！");
	}else{
		num--;
		$("#typediv"+num).hide();
		$("#timediv"+num).hide();
	}
}

function onSubmit(){
	var sprotType1 = $('#sprotType1').val();
	var sprotType2 = $('#sprotType2').val();
	var sprotType3 = $('#sprotType3').val();
	var time1 = $('#time1').val();
	var time2 = $('#time2').val();
	var time3 = $('#time3').val();
	var time = "";
	var type = "";
	if(sprotType1!="0"){
		if(sprotType1==sprotType2||sprotType1==sprotType3){
			alert("运动类型重复！");
			return;
		}else{
			type+=sprotType1;
			time += time1;
		}
	}else{
		alert("请选择运动类型！");
	}
	if(sprotType2!="0"){
		if(sprotType2==sprotType3){
			alert("运动类型重复！");
			return;
		}else{
			type+=","+sprotType2;
			time +=","+ time2;
		}
	}
	if(sprotType3!="0"){
		type+=","+sprotType3;
		time +=","+ time3;
	}
	 $.post("../diet/saveSport",{type:type,num:time},function(text){
			if(text=="1"){
				alert("保存成功！");
				window.location.href="../user/user_index";
			}else{
				alert("保存失败！")
			}
		}); 
}

</script>
</html>
