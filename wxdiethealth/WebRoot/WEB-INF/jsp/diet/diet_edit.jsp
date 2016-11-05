<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String pId = session.getAttribute("pId").toString();
%>
<html>
<head>

<title>个人饮食录入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="<%=path%>/jquerymobile/jquery.mobile.structure-1.4.5.min.css" />

<script src="<%=path%>/js/search-select.js"></script>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script src="<%=path%>/js/jqm.autoComplete-1.5.2.js"></script>
<script src="<%=path%>/js/code.js"></script>
<!-- <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" /> -->
<style>
</style>
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食录入</h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<p style="text-align: center;">
					目标能量(kal)：<span id="targetenergy"></span>
				</p>
				<p style="text-align: center;">
					总能量(kal)：<span id="sumenergy">0</span>
				</p>
			</div>
			<div data-role="fieldcontain">
				<label for="diettype">餐饮类型：</label> <select name="diettype"
					id="diettype" required="true" onchange="setTargetEnergy()">
					<c:forEach var="diettype" items="${typeList}" varStatus="s">
						<option value="${diettype.value }">${diettype.name }</option>
					</c:forEach>
				</select>
			</div>
			<div data-role="collapsible">
				<h1>主食</h1>
				<div id="mainfood">
					<div name="mainfoodtype" id="mainfoodtype1">
						<p>
							<input type="search" id="searchField_mainfood1" placeholder="请输入并选择食物">
						    <ul id="suggestions_mainfood1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" id="mainfoodnums1" name="mainfoodnum">
						<label for="number">食量（克）：</label> <input type="range"
							id="mainfoodnum1" name="number" required="true" value="200"
							min="0" max="1000">
					</div>
					
					<div name="mainfoodtype" id="mainfoodtype2" style="display: none">
						<p>
							<input type="search" id="searchField_mainfood2" placeholder="请输入并选择食物">
						    <ul id="suggestions_mainfood2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnums2" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							id="mainfoodnum2" name="number" required="true" value="200"
							min="0" max="1000">
					</div>
					
					<div name="mainfoodtype" id="mainfoodtype3" style="display: none">
						<p>
							<input type="search" id="searchField_mainfood3" placeholder="请输入并选择食物">
						    <ul id="suggestions_mainfood3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" id="mainfoodnums3" name="mainfoodnum" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							id="mainfoodnum3" name="number" required="true" value="200"
							min="0" max="1000">
					</div>
					
					<div name="mainfoodtype" id="mainfoodtype4" style="display: none">
						<p>
							<input type="search" id="searchField_mainfood4" placeholder="请输入并选择食物">
						    <ul id="suggestions_mainfood4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" id="mainfoodnums4" name="mainfoodnum" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							id="mainfoodnum4" name="number" required="true" value="200"
							min="0" max="1000">
					</div>
					
					<div name="mainfoodtype" id="mainfoodtype5" style="display: none">
						<p>
							<input type="search" id="searchField_mainfood5" placeholder="请输入并选择食物">
						    <ul id="suggestions_mainfood5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" id="mainfoodnums5" name="mainfoodnum" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							id="mainfoodnum5" name="number" required="true" value="200"
							min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('mainfood');">新增</button>
					<button onclick="removefood('mainfood');">移除</button>
				</div>
			</div>
			
			<div data-role="collapsible">
				<h1>肉类</h1>
				<div id="meat">
					<div name="meattype" id="meattype1">
						<p>
							<input type="search" id="searchField_meat1" placeholder="请输入并选择食物">
						<ul id="suggestions_meat1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums1" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="meatnum1"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="meattype" id="meattype2" style="display: none">
						<p>
							<input type="search" id="searchField_meat2" placeholder="请输入并选择食物">
						<ul id="suggestions_meat2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums2" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="meatnum2"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="meattype" id="meattype3" style="display: none">
						<p>
							<input type="search" id="searchField_meat3" placeholder="请输入并选择食物">
						<ul id="suggestions_meat3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums3" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="meatnum3"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="meattype" id="meattype4" style="display: none">
						<p>
							<input type="search" id="searchField_meat4" placeholder="请输入并选择食物">
						<ul id="suggestions_meat4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums4" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="meatnum4"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="meattype" id="meattype5" style="display: none">
						<p>
							<input type="search" id="searchField_meat5" placeholder="请输入并选择食物">
						<ul id="suggestions_meat5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums5" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="meatnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('meat');">新增</button>
					<button onclick="removefood('meat');">移除</button>
				</div>
			</div>
			
			<div data-role="collapsible">
				<h1>蔬菜</h1>
				<div id="vegetables">
					<div name="vegetablestype" id="vegetablestype1">
						<p>
							<input type="search" id="searchField_vegetables1" placeholder="请输入并选择食物">
						<ul id="suggestions_vegetables1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnums1" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="vegetablesnum1"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="vegetablestype" id="vegetablestype2" style="display: none">
						<p>
							<input type="search" id="searchField_vegetables2" placeholder="请输入并选择食物">
						<ul id="suggestions_vegetables2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnums2" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="vegetablesnum2"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="vegetablestype" id="vegetablestype3" style="display: none">
						<p>
							<input type="search" id="searchField_vegetables3" placeholder="请输入并选择食物">
						<ul id="suggestions_vegetables3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnums3" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="vegetablesnum3"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="vegetablestype" id="vegetablestype4" style="display: none">
						<p>
							<input type="search" id="searchField_vegetables4" placeholder="请输入并选择食物">
						<ul id="suggestions_vegetables4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnums4" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="vegetablesnum4"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="vegetablestype" id="vegetablestype5" style="display: none">
						<p>
							<input type="search" id="searchField_vegetables5" placeholder="请输入并选择食物">
						<ul id="suggestions_vegetables5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnums5" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="vegetablesnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('vegetables');">新增</button>
					<button onclick="removefood('vegetables');">移除</button>
				</div>
			</div>
			
			<div data-role="collapsible">
				<h1>饮品</h1>
				<div id="drink">
					<div name="drinktype" id="drinktype1">
						<p>
							<input type="search" id="searchField_drink1" placeholder="请输入并选择食物">
						<ul id="suggestions_drink1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums1" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="drinknum1"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="drinktype" id="drinktype2" style="display: none">
						<p>
							<input type="search" id="searchField_drink2" placeholder="请输入并选择食物">
						<ul id="suggestions_drink2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums2" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="drinknum2"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="drinktype" id="drinktype3" style="display: none">
						<p>
							<input type="search" id="searchField_drink3" placeholder="请输入并选择食物">
						<ul id="suggestions_drink3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums3" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="drinknum3"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="drinktype" id="drinktype4" style="display: none">
						<p>
							<input type="search" id="searchField_drink4" placeholder="请输入并选择食物">
						<ul id="suggestions_drink4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums4" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="drinknum4"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="drinktype" id="drinktype5" style="display: none">
						<p>
							<input type="search" id="searchField_drink5" placeholder="请输入并选择食物">
						<ul id="suggestions_drink5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums5" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="drinknum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('drink');">新增</button>
					<button onclick="removefood('drink');">移除</button>
				</div>
			</div>
			
			<div data-role="collapsible">
				<h1>干果/油/零食</h1>
				<div id="nut">
					<div name="nuttype" id="nuttype1">
						<p>
							<input type="search" id="searchField_nut1" placeholder="请输入并选择食物">
						<ul id="suggestions_nut1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums1" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="nutnum1"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="nuttype" id="nuttype2" style="display: none">
						<p>
							<input type="search" id="searchField_nut2" placeholder="请输入并选择食物">
						<ul id="suggestions_nut2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums2" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="nutnum2"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="nuttype" id="nuttype3" style="display: none">
						<p>
							<input type="search" id="searchField_nut3" placeholder="请输入并选择食物">
						<ul id="suggestions_nut3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums3" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="nutnum3"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="nuttype" id="nuttype4" style="display: none">
						<p>
							<input type="search" id="searchField_nut4" placeholder="请输入并选择食物">
						<ul id="suggestions_nut4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums4" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="nutnum4"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="nuttype" id="nuttype5" style="display: none">
						<p>
							<input type="search" id="searchField_nut5" placeholder="请输入并选择食物">
						<ul id="suggestions_nut5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums5" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="nutnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('nut');">新增</button>
					<button onclick="removefood('nut');">移除</button>
				</div>
			</div>
			
			<div data-role="collapsible">
				<h1>水果</h1>
				<div id="fruits">
					<div name="fruitstype" id="fruitstype1">
						<p>
							<input type="search" id="searchField_fruits1" placeholder="请输入并选择食物">
						<ul id="suggestions_fruits1" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums1" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="fruitsnum1"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="fruitstype" id="fruitstype2" style="display: none">
						<p>
							<input type="search" id="searchField_fruits2" placeholder="请输入并选择食物">
						<ul id="suggestions_fruits2" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums2" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="fruitsnum2"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="fruitstype" id="fruitstype3" style="display: none">
						<p>
							<input type="search" id="searchField_fruits3" placeholder="请输入并选择食物">
						<ul id="suggestions_fruits3" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums3" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="fruitsnum3"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="fruitstype" id="fruitstype4" style="display: none">
						<p>
							<input type="search" id="searchField_fruits4" placeholder="请输入并选择食物">
						<ul id="suggestions_fruits4" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums4" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="fruitsnum4"
							required="true" value="200" min="0" max="1000">
					</div>
					
					<div name="fruitstype" id="fruitstype5" style="display: none">
						<p>
							<input type="search" id="searchField_fruits5" placeholder="请输入并选择食物">
						<ul id="suggestions_fruits5" data-role="listview" data-inset="true"></ul>
						</p>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums5" style="display: none" >
						<label for="number">食量（克）：</label> <input type="range"
							name="number" id="fruitsnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('fruits');">新增</button>
					<button onclick="removefood('fruits');">移除</button>
				</div>
			</div>

			<div data-role="fieldcontain">
				<label for="remarks">备注：</label>
				<textarea name="remarks" id="remarks"></textarea>
			</div>
		</div>
		<div id="detailcontent">
			<div class="ui-grid-c" id="detailtable">
				<div class="ui-block-a"
					style="border: 1px solid black; text-align: center; width: 31%; border-style: ridge ridge ridge ridge;">
					食物名称</div>
				<div class="ui-block-b"
					style="border: 1px solid black; text-align: center; width: 22.5%; border-style: ridge ridge ridge none;">能量</div>
				<div class="ui-block-c"
					style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
				<div class="ui-block-d"
					style="border: 1px solid black; text-align: center; width: 21.5%; border-style: ridge ridge ridge none;">脂肪</div>

			</div>

			<div data-role="fieldcontain">
				<input type="button" value="提交" onclick="onSubmit();">
			</div>
		</div>

		<div data-role="footer">
			<h1>&nbsp;</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/search-select.js"></script>
<script type="text/javascript">

var mainfoodCount = 1;
var meatCount = 1;
var vegetablesCount = 1;
var drinkCount = 1;
var nutCount = 1;
var fruitsCount = 1;
var targetsumenergy = parseInt(${energy});
var pId = ""; 
	function typechange(id,idnum,select){
		var num = $('#mainfoodnum1').val();
		var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
		+select[1]+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
		+num*select[2]/100
		+'</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
		+num*select[3]/100+'</div>'
		+'<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
		+num*select[4]/100
		+'</div>';
			if($('#detail'+id+idnum).html()==undefined){
				$('#detailtable').after("<div class='ui-grid-c' id='detail"+id+idnum+"'></div>");
				$('#detail'+id+idnum).append(html);
			}else{
					$('#detail'+id+idnum).html(html);
				}
			updateEnergy();
	}
	function numberchange(num,id,idnum,select){
		var sumenergy = parseInt($('#sumenergy').text());
		if(select != null){
			var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
				+select[1]+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
				+num*select[2]/100
				+'</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
				+num*select[3]/100+'</div>'
				+'<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
				+num*select[4]/100
				+'</div>';
			$('#detail'+id+idnum).html(html);
		}
		updateEnergy();
	}
	function removefood(id){
		var divId = $('#'+id);
		var len = countChange(id,false);
		if(len>0){
			$('#'+id+'type'+len).hide();
			$('#'+id+'nums'+len).hide();
			$('#detail'+id+len).remove();
			updateEnergy();
		}else{
			alert("不可移除!");
			countChange(id,true);
		}
		
	}
	function addfood(id){
		var divId = $('#'+id);
		var len = countChange(id,true);
		if(len<6){
			$('#'+id+'type'+len).show();
			$('#'+id+'nums'+len).show();
			var detailDiv = $('#detail'+id+(len-1)).clone(false);
			detailDiv.attr("id","detail"+id+len);
			$('#detail'+id+(len-1)).after(detailDiv);
			updateEnergy();
		}else{
			alert("已达上限！");
			countChange(id,false);
		}
		
	}
	
	function countChange(id,isAdd){
		if(isAdd){
			if("mainfood"==id){
				mainfoodCount++;
				return mainfoodCount;
			}else if("meat"==id){
				meatCount++;
				return meatCount;
			}else if("vegetables"==id){
				vegetablesCount++;
				return vegetablesCount;
			}else if("drink"==id){
				drinkCount++;
				return drinkCount;
			}else if("nut"==id){
				nutCount++;
				return nutCount;
			}else if("fruits"==id){
				fruitsCount++;
				return fruitsCount;
			}
		}else{
			if("mainfood"==id){
				mainfoodCount--;
				return mainfoodCount;
			}else if("meat"==id){
				meatCount--;
				return meatCount;
			}else if("vegetables"==id){
				vegetablesCount--;
				return vegetablesCount;
			}else if("drink"==id){
				drinkCount--;
				return drinkCount;
			}else if("nut"==id){
				nutCount--;
				return nutCount;
			}else if("fruits"==id){
				fruitsCount--;
				return fruitsCount;
			}
		}
	}
	
	function onSubmit(){
		var sumenergy = $('#sumenergy').text();
		var diettype = $('#diettype').find("option:selected").val();
		var mainfoodJson = parseFoodList("mainfood");
		var meatJson = parseFoodList("meat");
		var vegetablesJson = parseFoodList("vegetables");
		var drinkJson = parseFoodList("drink");
		var nutJson = parseFoodList("nut");
		var fruitsJson = parseFoodList("fruits");
		var remarks = $('#remarks').val();
		 $.post("../diet/saveDiet",{energy:sumenergy,type:diettype,pId:pId,mainfood:mainfoodJson.mainfood,
			 mainfoodNum:mainfoodJson.mainfoodNum,meat:meatJson.meat,meatNum:meatJson.meatNum,
			 vegetables:vegetablesJson.vegetables,vegetablesNum:vegetablesJson.vegetablesNum,
			 drink:drinkJson.drink,drinkNum:drinkJson.drinkNum,nut:nutJson.nut,nutNum:nutJson.nutNum,
			 fruits:fruitsJson.fruits,fruitsNum:fruitsJson.fruitsNum,remarks:remarks},function(text){
				if(text=="1"){
					alert("保存成功！");
					window.location.href="../user/user_index";
				}else{
					alert("保存失败！");
				}
			}); 
	}
	
	function parseFoodList(id){
		var nums = $('#'+id).find('div').filter("[name='"+id+"num']");
		var typevalues = "";
		var numvalues = "";
			if(id == "mainfood"){
				if(mainfood_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = mainfood_select1[0]+",";
				}
				if(mainfood_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += mainfood_select2[0]+",";
				}
				if(mainfood_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += mainfood_select3[0]+",";
				}
				if(mainfood_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += mainfood_select4[0]+",";
				}
				if(mainfood_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += mainfood_select5[0];
				}
				
				numvalues = $('#mainfoodnum1').val()+","+
							$('#mainfoodnum2').val()+","+
							$('#mainfoodnum3').val()+","+
							$('#mainfoodnum4').val()+","+
							$('#mainfoodnum5').val();
			}
			
			if(id == "meat"){
				if(meat_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = meat_select1[0]+",";
				}
				if(meat_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += meat_select2[0]+",";
				}
				if(meat_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += meat_select3[0]+",";
				}
				if(meat_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += meat_select4[0]+",";
				}
				if(meat_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += meat_select5[0];
				}
				
				numvalues = $('#meatnum1').val()+","+
				$('#meatnum2').val()+","+
				$('#meatnum3').val()+","+
				$('#meatnum4').val()+","+
				$('#meatnum5').val();
			}
			
			if(id == "vegetables"){
				if(vegetables_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = vegetables_select1[0]+",";
				}
				if(vegetables_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += vegetables_select2[0]+",";
				}
				if(vegetables_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += vegetables_select3[0]+",";
				}
				if(vegetables_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += vegetables_select4[0]+",";
				}
				if(vegetables_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += vegetables_select5[0];
				}
				
				numvalues = $('#vegetablesnum1').val()+","+
				$('#vegetablesnum2').val()+","+
				$('#vegetablesnum3').val()+","+
				$('#vegetablesnum4').val()+","+
				$('#vegetablesnum5').val();
			}
			
			if(id == "drink"){
				if(drink_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = drink_select1[0]+",";
				}
				if(drink_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += drink_select2[0]+",";
				}
				if(drink_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += drink_select3[0]+",";
				}
				if(drink_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += drink_select4[0]+",";
				}
				if(drink_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += drink_select5[0];
				}
				
				numvalues = $('#drinknum1').val()+","+
				$('#drinknum2').val()+","+
				$('#drinknum3').val()+","+
				$('#drinknum4').val()+","+
				$('#drinknum5').val();
			}
			
			if(id == "nut"){
				if(nut_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = nut_select1[0]+",";
				}
				if(nut_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += nut_select2[0]+",";
				}
				if(nut_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += nut_select3[0]+",";
				}
				if(nut_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += nut_select4[0]+",";
				}
				if(nut_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += nut_select5[0];
				}
				
				numvalues = $('#nutnum1').val()+","+
				$('#nutnum2').val()+","+
				$('#nutnum3').val()+","+
				$('#nutnum4').val()+","+
				$('#nutnum5').val();
			}
			
			if(id == "fruits"){
				if(fruits_select1.length == 0){
					typevalues = "0,";
				}else{
					typevalues = fruits_select1[0]+",";
				}
				if(fruits_select2.length == 0){
					typevalues += "0,";
				}else{
					typevalues += fruits_select2[0]+",";
				}
				if(fruits_select3.length == 0){
					typevalues += "0,";
				}else{
					typevalues += fruits_select3[0]+",";
				}
				if(fruits_select4.length == 0){
					typevalues += "0,";
				}else{
					typevalues += fruits_select4[0]+",";
				}
				if(fruits_select5.length == 0){
					typevalues += "0";
				}else{
					typevalues += fruits_select5[0];
				}
				
				numvalues = $('#fruitsnum1').val()+","+
				$('#fruitsnum2').val()+","+
				$('#fruitsnum3').val()+","+
				$('#fruitsnum4').val()+","+
				$('#fruitsnum5').val();
			}
		return eval("({'"+id+"':'"+typevalues+"','"+id+"Num"+"':'"+numvalues+"'})");
	}
	
	function updateEnergy(){
		var divs = $('#detailcontent').find('div.ui-block-b').filter("[name='energyinfo']");
		var energy = 0;
		for(var i=0; i<divs.length; i++){
			energy += parseInt(divs[i].innerText);
		}
		$('#sumenergy').text(energy);
		if(parseInt($('#targetenergy').text())<energy){
			$('#sumenergy').css("color","red");
		}
	}
	function setTargetEnergy(){
		var type = $('#diettype').val();
		var num = $('#diettype').find("option").length-3;
		var tmpEnergy = 0;
		if(type=="1"){
			tmpEnergy = parseInt(targetsumenergy*0.1+targetsumenergy*(3-num)/15);
		}else if(type=="2"||type=="3"){
			tmpEnergy = parseInt(targetsumenergy*0.3+targetsumenergy*(3-num)/60);
		}else if(type=="4"||type=="5"||type=="6"){
			tmpEnergy = parseInt(targetsumenergy*0.1);
		}
		$('#targetenergy').text(tmpEnergy);	
	}
	setTargetEnergy();
</script>
</html>
