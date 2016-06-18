<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>医生信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="viewport" content="width=device-width"/>
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<div data-role="page" id="pageone">
	<div data-role="header">
		<h1>医生信息</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain">
			<label for="name">姓名：</label><span>${doctor.name}</span>
		</div>
		<div data-role="fieldcontain">
			<label for="office">科室：</label>
			<c:forEach var="dict" items="${dictList}" varStatus="s">
			<c:if test="${dict.id==doctor.office}">
			<span>${dict.name }</span> 
			</c:if>
		</c:forEach>
		</div>
		<div data-role="fieldcontain">
			<label for="phone">手机号码：</label> <span>${doctor.phone}</span>
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="返回" onclick="window.location.href='user_index'">
		</div>
	</div>
	<div data-role="footer">
		<h1>&nbsp;</h1>
	</div>
</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
</html>
