<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>运动量记录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>运动量记录</h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<p>记录日期：${sportInfo.date }</p>
			</div>
			<c:if test="${sportInfo.beforebreakfasttime!=0 && sportInfo.beforebreakfasttype!=null}">
				<fieldset data-role="controlgroup">
					<legend>早餐前</legend>
					<div data-role="fieldcontain">
						<label>运动类型：${sportInfo.beforebreakfasttype }</label>
						<p>运动时间：${sportInfo.beforebreakfasttime }分钟</p>
					</div>
				</fieldset>
			</c:if>
			<c:if test="${sportInfo.afterbreakfasttime!=0 && sportInfo.afterbreakfasttype!=null}">
			<fieldset data-role="controlgroup">
				<legend>早餐后</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.afterbreakfasttype }</label>
					<p>运动时间：${sportInfo.afterbreakfasttime }分钟</p>
				</div>
			</fieldset>
			</c:if>
			<c:if test="${sportInfo.beforelaunchtime!=0 && sportInfo.beforelaunchtype!=null}">
			<fieldset data-role="controlgroup">
				<legend>午餐前</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.beforelaunchtype }</label>
					<p>运动时间：${sportInfo.beforelaunchtime }分钟</p>
				</div>
			</fieldset>
			</c:if>
			<c:if test="${sportInfo.afterlaunchtime!=0 && sportInfo.afterlaunchtype!=null}">
			<fieldset data-role="controlgroup">
				<legend>午餐后</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.afterlaunchtype }</label>
					<p>运动时间：${sportInfo.afterlaunchtime }分钟</p>
				</div>
			</fieldset>
			</c:if>
			<c:if test="${sportInfo.beforedinnertime!=0 && sportInfo.beforedinnertype!=null}">
			<fieldset data-role="controlgroup">
				<legend>晚餐前</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.beforedinnertype }</label>
					<p>运动时间：${sportInfo.beforedinnertime }分钟</p>
				</div>
			</fieldset>
			</c:if>
			<c:if test="${sportInfo.afterdinnertime!=0 && sportInfo.afterdinnertype!=null}">
			<fieldset data-role="controlgroup">
				<legend>晚餐后</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.afterdinnertype }</label>
					<p>运动时间：${sportInfo.afterdinnertime }分钟</p>
				</div>
			</fieldset>
			</c:if>
			<c:if test="${sportInfo.beforesleeptime!=0 && sportInfo.beforesleeptype!=null}">
			<fieldset data-role="controlgroup">
				<legend>睡前</legend>
				<div data-role="fieldcontain">
					<label>运动类型：${sportInfo.beforesleeptype }</label>
					<p>运动时间：${sportInfo.beforesleeptime }分钟</p>
				</div>
			</fieldset>
			</c:if>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
</script>
</html>
