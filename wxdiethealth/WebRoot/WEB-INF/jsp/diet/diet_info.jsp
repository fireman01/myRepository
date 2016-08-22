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

		<div data-role="content">
		<c:forEach var="diet" items="${dietList}" varStatus="s">
		<h3 style="text-align:center;">${diet.type }&nbsp;&nbsp;&nbsp;总能量：${diet.energy}(kal)</h3>
			 <div class="ui-grid-e" id="detailtable"> 
				<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食物名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;能量&nbsp;&nbsp;</div>
				<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;蛋白质&nbsp;</div>
					<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;铁&nbsp;&nbsp;</div>
				<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-f"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;钙&nbsp;&nbsp;</div>
					</div> 
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${mainfood.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${mainfood.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${mainfood.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${mainfood.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${mainfood.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${mainfood.calcium }</div>
				</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${meat.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${meat.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${meat.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${meat.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${meat.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${meat.calcium }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${vegetables.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${vegetables.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${vegetables.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${vegetables.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${vegetables.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${vegetables.calcium }</div>
				</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${drink.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${drink.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${drink.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${drink.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${drink.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${drink.calcium }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${nut.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${nut.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${nut.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${nut.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${nut.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${nut.calcium }</div>
				</div>
				</c:forEach>
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${fruits.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:13.2%;border-style:none ridge ridge none;">${fruits.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:16%;border-style:none ridge ridge none;">${fruits.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:9%;border-style:none ridge ridge none;">${fruits.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:18.6%;border-style:none ridge ridge none;">${fruits.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${fruits.calcium }</div>
				</div>
				</c:forEach>
				<div data-role="fieldcontain">
			</div>
						<div class="ui-grid-e" id="detailtable1"> 
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食物名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;&nbsp;脂肪&nbsp;&nbsp;&nbsp;</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;&nbsp;锌&nbsp;&nbsp;&nbsp;</div>
						<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;胡萝卜素&nbsp;</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;border-style:none none none none;"></div>
					<div class="ui-block-f"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">碳水化合物</div>
					
			</div> 
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${mainfood.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${mainfood.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${mainfood.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${mainfood.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${mainfood.carbohydrate }</div>
				</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
								<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${meat.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${meat.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${meat.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${meat.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${meat.carbohydrate }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${vegetables.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${vegetables.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${vegetables.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${vegetables.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${vegetables.carbohydrate }</div>
				</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${drink.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${drink.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${drink.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${drink.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${drink.carbohydrate }</div>
				</div>
				</c:forEach>
				
				 <c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${nut.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${nut.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${nut.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${nut.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${nut.carbohydrate }</div>
				</div>
				</c:forEach> 
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:29%;border-style:none ridge ridge ridge;">${fruits.name }</div>
					<div class="ui-block-b" style="border: 1px solid black;text-align:center;width:15.4%;border-style:none ridge ridge none;">${fruits.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:11%;border-style:none ridge ridge none;">${fruits.zinc }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:20.4%;border-style:none ridge ridge none;">${fruits.carotene }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:24.2%;border-style:none ridge ridge none;">${fruits.carbohydrate }</div>
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
