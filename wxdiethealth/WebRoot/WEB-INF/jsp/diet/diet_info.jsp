<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>饮食记录</title>
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
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食记录</h1>
		</div>

		<div>
		<c:forEach var="diet" items="${dietList}" varStatus="s">
		<h3 style="text-align:center;">${diet.type }&nbsp;&nbsp;&nbsp;总能量：${diet.energy}(kal)</h3>
		<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
		<span>${mainfood.name }</span>
			 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
				<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${mainfood.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${mainfood.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${mainfood.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${mainfood.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${mainfood.calcium }</div>
				</div>
				<span>&nbsp;</span>
					<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
			<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${mainfood.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${mainfood.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${mainfood.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${mainfood.carbohydrate }</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
				<span>${meat.name  }</span>
				 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
					<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${meat.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${meat.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${meat.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${meat.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${meat.calcium }</div>
				</div>
				<span>&nbsp;</span>
				<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
					<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${meat.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${meat.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${meat.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${meat.carbohydrate }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
				<span>${vegetables.name  }</span>
				 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
					<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${vegetables.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${vegetables.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${vegetables.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${vegetables.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${vegetables.calcium }</div>
				</div>
				<span>&nbsp;</span>
					<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
			<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${vegetables.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${vegetables.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${vegetables.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${vegetables.carbohydrate }</div>
				</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
			<span>${drink.name  }</span>
				 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
				<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${drink.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${drink.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${drink.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${drink.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${drink.calcium }</div>
				</div>
				<span>&nbsp;</span>
					<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
				<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${drink.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${drink.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${drink.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${drink.carbohydrate }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
				<span>${nut.name  }</span>
				 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
					<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${nut.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${nut.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${nut.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${nut.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${nut.calcium }</div>
				</div>
				<span>&nbsp;</span>
					<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
				<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${nut.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${nut.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${nut.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${nut.carbohydrate }</div>
				</div>
				</c:forEach>
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<span>${fruits.name  }</span>
				 <div class="ui-grid-d" > 
				<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">能量</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">铁</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:23%;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;width:18.5%;border-style:ridge ridge ridge none;">钙</div>
					</div> 
					<div class="ui-grid-d">
					<div class="ui-block-a"style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${fruits.energy }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${fruits.protein }</div>
					<div class="ui-block-c" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${fruits.ferrum }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:23%;text-align:center;border-style:none ridge ridge none;">${fruits.cellulose }</div>
					<div class="ui-block-e" style="border: 1px solid black;width:18.5%;text-align:center;border-style:none ridge ridge none;">${fruits.calcium }</div>
				</div>
				<span>&nbsp;</span>
					<div class="ui-grid-c"> 
						<div class="ui-block-a"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;width:24%;border-style:ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;width:26%;border-style:ridge ridge ridge none;">碳水化合物</div>
			</div> 
			<div class="ui-grid-c">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:none ridge ridge ridge;">${fruits.fat }</div>
					<div class="ui-block-b" style="border: 1px solid black;width:24%;text-align:center;border-style:none ridge ridge none;">${fruits.zinc }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${fruits.carotene }</div>
					<div class="ui-block-d" style="border: 1px solid black;width:26%;text-align:center;border-style:none ridge ridge none;">${fruits.carbohydrate }</div>
				</div>
				</c:forEach>
					
				
				<div data-role="fieldcontain">
				<p>备注：${diet.remarks }</p>
			</div>
			</c:forEach>
			<div data-role="fieldcontain">
				<p>医生建议：${advice.content }</p>
			</div>
		</div>
	</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
</script>
</html>
