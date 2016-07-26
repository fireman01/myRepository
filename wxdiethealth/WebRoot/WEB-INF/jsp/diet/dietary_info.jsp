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
	href="<%=path%>/jquerymobile/green.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/green.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/doctor_index'">主页</a>
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
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">碳水化合物</div>
					</div> 
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${mainfood.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${mainfood.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${mainfood.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${mainfood.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${mainfood.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${mainfood.carbohydrate }</div>
				</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${meat.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${meat.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${meat.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${meat.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${meat.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${meat.carbohydrate }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${vegetables.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${vegetables.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${vegetables.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${vegetables.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${vegetables.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${vegetables.carbohydrate }</div>
				</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${drink.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${drink.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${drink.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${drink.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${drink.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${drink.carbohydrate }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${nut.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${nut.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${nut.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${nut.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${nut.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${nut.carbohydrate }</div>
				</div>
				</c:forEach>
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${fruits.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${fruits.energy }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${fruits.protein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${fruits.ferrum }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${fruits.cellulose }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${fruits.carbohydrate }</div>
				</div>
				</c:forEach>
				<div data-role="fieldcontain">
			</div>
						<div class="ui-grid-e" id="detailtable1"> 
				<div class="ui-block-a" style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge ridge;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食物名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
						<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;脂肪&nbsp;&nbsp;</div>
						<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;叶黄素&nbsp;</div>
						<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;锌&nbsp;&nbsp;</div>
						<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-f"
					style="border: 1px solid black;text-align:center;border-style:ridge ridge ridge none;">&nbsp;&nbsp;钙&nbsp;&nbsp;</div>
			</div> 
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${mainfood.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${mainfood.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${mainfood.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${mainfood.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${mainfood.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${mainfood.calcium }</div>
				</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
								<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${meat.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${meat.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${meat.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${meat.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${meat.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${meat.calcium }</div>
				</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${vegetables.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${vegetables.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${vegetables.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${vegetables.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${vegetables.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${vegetables.calcium }</div>
				</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
				<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${drink.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${drink.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${drink.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${drink.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${drink.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${drink.calcium }</div>
				</div>
				</div>
				</c:forEach>
				
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${nut.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${nut.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${nut.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${nut.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${nut.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${nut.calcium }</div>
				</div>
				</c:forEach>
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-e">
					<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:26.5%;border-style:none ridge ridge ridge;">${diet.name }</div>
					<div class="ui-block-b"style="border: 1px solid black;text-align:center;width:12.4%;border-style:none ridge ridge none;">${diet.fat }</div>
					<div class="ui-block-c" style="border: 1px solid black;text-align:center;width:14.6%;border-style:none ridge ridge none;">${diet.lutein }</div>
					<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:8.1%;border-style:none ridge ridge none;">${diet.zinc }</div>
					<div class="ui-block-e" style="border: 1px solid black;text-align:center;width:17%;border-style:none ridge ridge none;">${diet.carotene }</div>
					<div class="ui-block-f" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">${diet.calcium }</div>
				</div>
				</c:forEach>
				<div data-role="fieldcontain">
				<p>备注：${diet.remarks }</p>
			</div>
			</c:forEach>
			
					<h3 style="text-align:center;">血糖记录</h3>
		<div class="ui-grid-d" id="bggrid">
				<div class="ui-block-a"
					style="border: 1px solid black;border-style:ridge ridge ridge ridge;text-align:center;font-size:10px;">
					日&nbsp;期
					<div class="ui-grid-a">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">&nbsp;</div>
					</div>
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black; border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					早餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-c"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					午餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-d"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					晚餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-e"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					睡前
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:none none none none;text-align:center;font-size:10px;">&nbsp;</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;">&nbsp;</div>
					</div>
				</div>
					<div class="ui-block-a"
						style="border: 1px solid black;border-style:none ridge ridge ridge;text-align:center;font-size:10px;">
						${bg.date }</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeBreakfast }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterBreakfast }</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeLunch }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterLunch }</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeDinner }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterDinner }</div>
						</div>
					</div>
					<div class="ui-block-e"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;"
						name="before">${bg.bloodGlucoseBeforeSleep }</div>
			</div>
			<h3 style="text-align:center;">运动量记录</h3>
				<c:forEach var="infoList" items="${sportInfo.sportList}" varStatus="s">
			<div data-role="fieldcontain">
				<p>运动类型：${infoList.type }</p>
			</div>
			<div data-role="fieldcontain">
				<p>运动时间：${infoList.num }</p>
			</div>
			</c:forEach>
			<div data-role="fieldcontain">
			<input type="hidden" value="${bg.p_id }" id="pId"> 
				<label for="content">建议：</label>
				<textarea name="content" id="content">${advice.content }</textarea>
			</div>
				<div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
   </div>
		</div>

	</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
function onSubmit(){
	var content = $('#content').val();
	var pId = $('#pId').val();
	 $.post("saveAdvice",{content:content,pId:pId},function(text){
			if(text=="1"){
				alert("保存成功！");
			}else{
				alert("保存失败！")
			}
		}); 
}

</script>
</html>
