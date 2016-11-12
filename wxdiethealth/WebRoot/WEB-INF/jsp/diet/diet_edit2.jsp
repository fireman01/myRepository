<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	//String pId = session.getAttribute("pId").toString();
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
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="<%=path%>/jquerymobile/jquery.mobile.structure-1.4.5.min.css" />
<!-- <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" /> -->
<style>
</style>
</head>

<body onload="Init()">
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
						<form name=frm data-role="none">
							<table>
								<tr>
									<td><input name="txt" style="width: 200px"
										onkeyup="SelectTip()" data-role="none"></td>
								</tr>
								<tr>
									<td><span id="mainfood1"><select data-role="none"
											name="mainfood" style="width: 200px" size=10
											onchange="txt.value=options[selectedIndex].text;typechange('mainfood','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="mainfood" items="${mainfoodList}"
													varStatus="s">
													<option value="${mainfood.id }"
														energy="${mainfood.energy }"
														protein="${mainfood.protein }" fat="${mainfood.fat }"
														carbohydrate="${mainfood.carbohydrate }"
														cellulose="${mainfood.cellulose }"
														calcium="${mainfood.calcium }"
														ferrum="${mainfood.ferrum }" zinc="${mainfood.zinc }"
														carotene="${mainfood.carotene }">${mainfood.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'mainfood','1')"
							required="true" value="200" min="0" max="1000">
					</div>



					<div data-role="fieldcontain" name="mainfoodtype"
						id="mainfoodtype2" style="display: none;">
						<form name=frm2>
							<table>
								<tr>
									<td><input data-role="none" name="txt2"
										style="width: 200px" onkeyup="SelectTip2()"></td>
								</tr>
								<tr>
									<td><span id="mainfood2"><select data-role="none"
											name="mainfood2" style="width: 200px" size=10
											onchange="txt2.value=options[selectedIndex].text;typechange('mainfood','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="mainfood" items="${mainfoodList}"
													varStatus="s">
													<option value="${mainfood.id }"
														energy="${mainfood.energy }"
														protein="${mainfood.protein }" fat="${mainfood.fat }"
														carbohydrate="${mainfood.carbohydrate }"
														cellulose="${mainfood.cellulose }"
														calcium="${mainfood.calcium }"
														ferrum="${mainfood.ferrum }" zinc="${mainfood.zinc }"
														carotene="${mainfood.carotene }">${mainfood.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum2"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'mainfood','2')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="mainfoodtype"
						id="mainfoodtype3" style="display: none;">
						<form name=frm3>
							<table>
								<tr>
									<td><input data-role="none" name="txt3"
										style="width: 200px" onkeyup="SelectTip3()"></td>
								</tr>
								<tr>
									<td><span id="mainfood3"><select data-role="none"
											name="mainfood3" style="width: 200px" size=10
											onchange="txt3.value=options[selectedIndex].text;typechange('mainfood','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="mainfood" items="${mainfoodList}"
													varStatus="s">
													<option value="${mainfood.id }"
														energy="${mainfood.energy }"
														protein="${mainfood.protein }" fat="${mainfood.fat }"
														carbohydrate="${mainfood.carbohydrate }"
														cellulose="${mainfood.cellulose }"
														calcium="${mainfood.calcium }"
														ferrum="${mainfood.ferrum }" zinc="${mainfood.zinc }"
														carotene="${mainfood.carotene }">${mainfood.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum3"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'mainfood','3')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="mainfoodtype"
						id="mainfoodtype4" style="display: none;">
						<form name=frm4>
							<table>
								<tr>
									<td><input data-role="none" name="txt4"
										style="width: 200px" onkeyup="SelectTip4()"></td>
								</tr>
								<tr>
									<td><span id="mainfood4"><select data-role="none"
											name="mainfood4" style="width: 200px" size=10
											onchange="txt4.value=options[selectedIndex].text;typechange('mainfood','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="mainfood" items="${mainfoodList}"
													varStatus="s">
													<option value="${mainfood.id }"
														energy="${mainfood.energy }"
														protein="${mainfood.protein }" fat="${mainfood.fat }"
														carbohydrate="${mainfood.carbohydrate }"
														cellulose="${mainfood.cellulose }"
														calcium="${mainfood.calcium }"
														ferrum="${mainfood.ferrum }" zinc="${mainfood.zinc }"
														carotene="${mainfood.carotene }">${mainfood.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum4"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'mainfood','4')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="mainfoodtype"
						id="mainfoodtype5" style="display: none;">
						<form name=frm5>
							<table>
								<tr>
									<td><input data-role="none" name="txt5"
										style="width: 200px" onkeyup="SelectTip5()"></td>
								</tr>
								<tr>
									<td><span id="mainfood5"><select data-role="none"
											name="mainfood5" style="width:200px" size=10
											onchange="txt5.value=options[selectedIndex].text;typechange('mainfood','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="mainfood" items="${mainfoodList}"
													varStatus="s">
													<option value="${mainfood.id }"
														energy="${mainfood.energy }"
														protein="${mainfood.protein }" fat="${mainfood.fat }"
														carbohydrate="${mainfood.carbohydrate }"
														cellulose="${mainfood.cellulose }"
														calcium="${mainfood.calcium }"
														ferrum="${mainfood.ferrum }" zinc="${mainfood.zinc }"
														carotene="${mainfood.carotene }">${mainfood.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum5"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'mainfood','5')"
							required="true" value="200" min="0" max="1000">
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
					<div data-role="fieldcontain" name="meattype" id="meattype1">

						<form name=frm_m1>
							<table>
								<tr>
									<td><input data-role="none" name="txt_m1"
										style="width: 200px" onkeyup="SelectTip_m1()"></td>
								</tr>
								<tr>
									<td><span id="meat1"><select data-role="none"
											name="meat1" style="width: 200px" size=10
											onchange="txt_m1.value=options[selectedIndex].text;typechange('meat','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="meat" items="${meatList}" varStatus="s">
													<option value="${meat.id }" energy="${meat.energy }"
														protein="${meat.protein }" fat="${meat.fat }"
														carbohydrate="${meat.carbohydrate }"
														cellulose="${meat.cellulose }" calcium="${meat.calcium }"
														ferrum="${meat.ferrum }" zinc="${meat.zinc }"
														carotene="${meat.carotene }">${meat.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'meat','1')"
							required="true" value="200" min="0" max="1000">
					</div>


					<div data-role="fieldcontain" name="meattype" id="meattype2"
						style="display: none;">
						<form name=frm_m2>
							<table>
								<tr>
									<td><input data-role="none" name="txt_m2"
										style="width: 200px" onkeyup="SelectTip_m2()"></td>
								</tr>
								<tr>
									<td><span id="meat2"><select data-role="none"
											name="meat2" style="width: 200px" size=10
											onchange="txt_m2.value=options[selectedIndex].text;typechange('meat','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="meat" items="${meatList}" varStatus="s">
													<option value="${meat.id }" energy="${meat.energy }"
														protein="${meat.protein }" fat="${meat.fat }"
														carbohydrate="${meat.carbohydrate }"
														cellulose="${meat.cellulose }" calcium="${meat.calcium }"
														ferrum="${meat.ferrum }" zinc="${meat.zinc }"
														carotene="${meat.carotene }">${meat.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnum2"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'meat','2')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="meattype" id="meattype3"
						style="display: none;">
						<form name=frm_m3>
							<table>
								<tr>
									<td><input data-role="none" name="txt_m3"
										style="width: 200px" onkeyup="SelectTip_m3()"></td>
								</tr>
								<tr>
									<td><span id="meat3"><select data-role="none"
											name="meat3" style="width: 200px" size=10
											onchange="txt_m3.value=options[selectedIndex].text;typechange('meat','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="meat" items="${meatList}" varStatus="s">
													<option value="${meat.id }" energy="${meat.energy }"
														protein="${meat.protein }" fat="${meat.fat }"
														carbohydrate="${meat.carbohydrate }"
														cellulose="${meat.cellulose }" calcium="${meat.calcium }"
														ferrum="${meat.ferrum }" zinc="${meat.zinc }"
														carotene="${meat.carotene }">${meat.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnum3"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'meat','3')"
							required="true" value="200" min="0" max="1000">
					</div>


					<div data-role="fieldcontain" name="meattype" id="meattype4"
						style="display: none;">
						<form name=frm_m4>
							<table>
								<tr>
									<td><input data-role="none" name="txt_m4"
										style="width: 200px" onkeyup="SelectTip_m4()"></td>
								</tr>
								<tr>
									<td><span id="meat4"><select data-role="none"
											name="meat4" style="width: 200px" size=10
											onchange="txt_m4.value=options[selectedIndex].text;typechange('meat','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="meat" items="${meatList}" varStatus="s">
													<option value="${meat.id }" energy="${meat.energy }"
														protein="${meat.protein }" fat="${meat.fat }"
														carbohydrate="${meat.carbohydrate }"
														cellulose="${meat.cellulose }" calcium="${meat.calcium }"
														ferrum="${meat.ferrum }" zinc="${meat.zinc }"
														carotene="${meat.carotene }">${meat.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnum4"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'meat','4')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="meattype" id="meattype5"
						style="display: none;">
						<form name=frm_m5>
							<table>
								<tr>
									<td><input data-role="none" name="txt_m5"
										style="width: 200px" onkeyup="SelectTip_m5()"></td>
								</tr>
								<tr>
									<td><span id="meat5"><select data-role="none"
											name="meat5" style="width: 200px" size=10
											onchange="txt_m5.value=options[selectedIndex].text;typechange('meat','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="meat" items="${meatList}" varStatus="s">
													<option value="${meat.id }" energy="${meat.energy }"
														protein="${meat.protein }" fat="${meat.fat }"
														carbohydrate="${meat.carbohydrate }"
														cellulose="${meat.cellulose }" calcium="${meat.calcium }"
														ferrum="${meat.ferrum }" zinc="${meat.zinc }"
														carotene="${meat.carotene }">${meat.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnum5"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'meat','5')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain">
						<button onclick="addfood('meat');">新增</button>
						<button onclick="removefood('meat');">移除</button>
					</div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>蔬菜</h1>
				<div id="vegetables">
					<div data-role="fieldcontain" name="vegetablestype"
						id="vegetablestype1">
						<form name=frm_v1>
							<table>
								<tr>
									<td><input data-role="none" name="txt_v1"
										style="width: 200px" onkeyup="SelectTip_v1()"></td>
								</tr>
								<tr>
									<td><span id="vegetables1"><select data-role="none"
											name="vegetables1" style="width: 200px" size=10
											onchange="txt_v1.value=options[selectedIndex].text;typechange('vegetables','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="vegetables" items="${vegetablesList}"
													varStatus="s">
													<option value="${vegetables.id }"
														energy="${vegetables.energy }"
														protein="${vegetables.protein }" fat="${vegetables.fat }"
														carbohydrate="${vegetables.carbohydrate }"
														cellulose="${vegetables.cellulose }"
														calcium="${vegetables.calcium }"
														ferrum="${vegetables.ferrum }" zinc="${vegetables.zinc }"
														carotene="${vegetables.carotene }">${vegetables.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number"
							onchange="numberchange(this.value,'vegetables','1')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="vegetablestype"
						id="vegetablestype2" style="display: none;">
						<form name=frm_v2>
							<table>
								<tr>
									<td><input data-role="none" name="txt_v2"
										style="width: 200px" onkeyup="SelectTip_v2()"></td>
								</tr>
								<tr>
									<td><span id="vegetables2"><select data-role="none"
											name="vegetables2" style="width: 200px" size=10
											onchange="txt_v2.value=options[selectedIndex].text;typechange('vegetables','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="vegetables" items="${vegetablesList}"
													varStatus="s">
													<option value="${vegetables.id }"
														energy="${vegetables.energy }"
														protein="${vegetables.protein }" fat="${vegetables.fat }"
														carbohydrate="${vegetables.carbohydrate }"
														cellulose="${vegetables.cellulose }"
														calcium="${vegetables.calcium }"
														ferrum="${vegetables.ferrum }" zinc="${vegetables.zinc }"
														carotene="${vegetables.carotene }">${vegetables.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnum2" style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number"
							onchange="numberchange(this.value,'vegetables','2')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="vegetablestype"
						id="vegetablestype3" style="display: none;">
						<form name=frm_v3>
							<table>
								<tr>
									<td><input data-role="none" name="txt_v3"
										style="width: 200px" onkeyup="SelectTip_v3()"></td>
								</tr>
								<tr>
									<td><span id="vegetables3"><select data-role="none"
											name="vegetables3" style="width: 200px" size=10
											onchange="txt_v3.value=options[selectedIndex].text;typechange('vegetables','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="vegetables" items="${vegetablesList}"
													varStatus="s">
													<option value="${vegetables.id }"
														energy="${vegetables.energy }"
														protein="${vegetables.protein }" fat="${vegetables.fat }"
														carbohydrate="${vegetables.carbohydrate }"
														cellulose="${vegetables.cellulose }"
														calcium="${vegetables.calcium }"
														ferrum="${vegetables.ferrum }" zinc="${vegetables.zinc }"
														carotene="${vegetables.carotene }">${vegetables.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnum3" style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number"
							onchange="numberchange(this.value,'vegetables','3')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="vegetablestype"
						id="vegetablestype4" style="display: none;">
						<form name=frm_v4>
							<table>
								<tr>
									<td><input data-role="none" name="txt_v4"
										style="width: 200px" onkeyup="SelectTip_v4()"></td>
								</tr>
								<tr>
									<td><span id="vegetables4"><select data-role="none"
											name="vegetables4" style="width: 200px" size=10
											onchange="txt_v4.value=options[selectedIndex].text;typechange('vegetables','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="vegetables" items="${vegetablesList}"
													varStatus="s">
													<option value="${vegetables.id }"
														energy="${vegetables.energy }"
														protein="${vegetables.protein }" fat="${vegetables.fat }"
														carbohydrate="${vegetables.carbohydrate }"
														cellulose="${vegetables.cellulose }"
														calcium="${vegetables.calcium }"
														ferrum="${vegetables.ferrum }" zinc="${vegetables.zinc }"
														carotene="${vegetables.carotene }">${vegetables.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnum4" style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number"
							onchange="numberchange(this.value,'vegetables','4')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="vegetablestype"
						id="vegetablestype5" style="display: none;">
						<form name=frm_v5>
							<table>
								<tr>
									<td><input data-role="none" name="txt_v5"
										style="width: 200px" onkeyup="SelectTip_v5()"></td>
								</tr>
								<tr>
									<td><span id="vegetables5"><select data-role="none"
											name="vegetables5" style="width: 200px" size=10
											onchange="txt_v5.value=options[selectedIndex].text;typechange('vegetables','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="vegetables" items="${vegetablesList}"
													varStatus="s">
													<option value="${vegetables.id }"
														energy="${vegetables.energy }"
														protein="${vegetables.protein }" fat="${vegetables.fat }"
														carbohydrate="${vegetables.carbohydrate }"
														cellulose="${vegetables.cellulose }"
														calcium="${vegetables.calcium }"
														ferrum="${vegetables.ferrum }" zinc="${vegetables.zinc }"
														carotene="${vegetables.carotene }">${vegetables.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnum5" style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number"
							onchange="numberchange(this.value,'vegetables','5')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain">
						<button onclick="addfood('vegetables');">新增</button>
						<button onclick="removefood('vegetables');">移除</button>
					</div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>饮品</h1>
				<div id="drink">
					<div data-role="fieldcontain" name="drinktype" id="drinktype1">
						<form name=frm_d1>
							<table>
								<tr>
									<td><input data-role="none" name="txt_d1"
										style="width: 200px" onkeyup="SelectTip_d1()"></td>
								</tr>
								<tr>
									<td><span id="drink1"><select data-role="none"
											name="drink1" style="width: 200px" size=10
											onchange="txt_d1.value=options[selectedIndex].text;typechange('drink','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="drink" items="${drinkList}" varStatus="s">
													<option value="${drink.id }" energy="${drink.energy }"
														protein="${drink.protein }" fat="${drink.fat }"
														carbohydrate="${drink.carbohydrate }"
														cellulose="${drink.cellulose }"
														calcium="${drink.calcium }" ferrum="${drink.ferrum }"
														zinc="${drink.zinc }" carotene="${drink.carotene }">${drink.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="dirnknum" id="drinknum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'drink','1')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="drinktype" id="drinktype2"
						style="display: none;">
						<form name=frm_d2>
							<table>
								<tr>
									<td><input data-role="none" name="txt_d2"
										style="width: 200px" onkeyup="SelectTip_d2()"></td>
								</tr>
								<tr>
									<td><span id="drink2"><select data-role="none"
											name="drink2" style="width: 200px" size=10
											onchange="txt_d2.value=options[selectedIndex].text;typechange('drink','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="drink" items="${drinkList}" varStatus="s">
													<option value="${drink.id }" energy="${drink.energy }"
														protein="${drink.protein }" fat="${drink.fat }"
														carbohydrate="${drink.carbohydrate }"
														cellulose="${drink.cellulose }"
														calcium="${drink.calcium }" ferrum="${drink.ferrum }"
														zinc="${drink.zinc }" carotene="${drink.carotene }">${drink.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="dirnknum" id="drinknum2"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'drink','2')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="drinktype" id="drinktype3"
						style="display: none;">
						<form name=frm_d3>
							<table>
								<tr>
									<td><input data-role="none" name="txt_d3"
										style="width: 200px" onkeyup="SelectTip_d3()"></td>
								</tr>
								<tr>
									<td><span id="drink3"><select data-role="none"
											name="drink3" style="width: 200px" size=10
											onchange="txt_d3.value=options[selectedIndex].text;typechange('drink','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="drink" items="${drinkList}" varStatus="s">
													<option value="${drink.id }" energy="${drink.energy }"
														protein="${drink.protein }" fat="${drink.fat }"
														carbohydrate="${drink.carbohydrate }"
														cellulose="${drink.cellulose }"
														calcium="${drink.calcium }" ferrum="${drink.ferrum }"
														zinc="${drink.zinc }" carotene="${drink.carotene }">${drink.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="dirnknum" id="drinknum3"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'drink','3')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="drinktype" id="drinktype4"
						style="display: none;">
						<form name=frm_d4>
							<table>
								<tr>
									<td><input data-role="none" name="txt_d4"
										style="width: 200px" onkeyup="SelectTip_d4()"></td>
								</tr>
								<tr>
									<td><span id="drink4"><select data-role="none"
											name="drink4" style="width: 200px" size=10
											onchange="txt_d4.value=options[selectedIndex].text;typechange('drink','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="drink" items="${drinkList}" varStatus="s">
													<option value="${drink.id }" energy="${drink.energy }"
														protein="${drink.protein }" fat="${drink.fat }"
														carbohydrate="${drink.carbohydrate }"
														cellulose="${drink.cellulose }"
														calcium="${drink.calcium }" ferrum="${drink.ferrum }"
														zinc="${drink.zinc }" carotene="${drink.carotene }">${drink.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="dirnknum" id="drinknum4"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'drink','4')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="drinktype" id="drinktype5"
						style="display: none;">
						<form name=frm_d5>
							<table>
								<tr>
									<td><input data-role="none" name="txt_d5"
										style="width: 200px" onkeyup="SelectTip_d5()"></td>
								</tr>
								<tr>
									<td><span id="drink5"><select data-role="none"
											name="drink5" style="width: 200px" size=10
											onchange="txt_d5.value=options[selectedIndex].text;typechange('drink','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="drink" items="${drinkList}" varStatus="s">
													<option value="${drink.id }" energy="${drink.energy }"
														protein="${drink.protein }" fat="${drink.fat }"
														carbohydrate="${drink.carbohydrate }"
														cellulose="${drink.cellulose }"
														calcium="${drink.calcium }" ferrum="${drink.ferrum }"
														zinc="${drink.zinc }" carotene="${drink.carotene }">${drink.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="dirnknum" id="drinknum5"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'drink','5')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain">
						<button onclick="addfood('drink');">新增</button>
						<button onclick="removefood('drink');">移除</button>
					</div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>干果/油/零食</h1>
				<div id="nut">
					<div data-role="fieldcontain" name="nuttype" id="nuttype1">
						<form name=frm_n1>
							<table>
								<tr>
									<td><input data-role="none" name="txt_n1"
										style="width: 200px" onkeyup="SelectTip_n1()"></td>
								</tr>
								<tr>
									<td><span id="nut1"><select data-role="none"
											name="nut1" style="width: 200px" size=10
											onchange="txt_n1.value=options[selectedIndex].text;typechange('nut','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="nut" items="${nutList}" varStatus="s">
													<option value="${nut.id }" energy="${nut.energy }"
														protein="${nut.protein }" fat="${nut.fat }"
														carbohydrate="${nut.carbohydrate }"
														cellulose="${nut.cellulose }" calcium="${nut.calcium }"
														ferrum="${nut.ferrum }" zinc="${nut.zinc }"
														carotene="${nut.carotene }">${nut.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'nut','1')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="nuttype" id="nuttype2"
						style="display: none;">
						<form name=frm_n2>
							<table>
								<tr>
									<td><input data-role="none" name="txt_n2"
										style="width: 200px" onkeyup="SelectTip_n2()"></td>
								</tr>
								<tr>
									<td><span id="nut2"><select data-role="none"
											name="nut2" style="width: 200px" size=10
											onchange="txt_n2.value=options[selectedIndex].text;typechange('nut','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="nut" items="${nutList}" varStatus="s">
													<option value="${nut.id }" energy="${nut.energy }"
														protein="${nut.protein }" fat="${nut.fat }"
														carbohydrate="${nut.carbohydrate }"
														cellulose="${nut.cellulose }" calcium="${nut.calcium }"
														ferrum="${nut.ferrum }" zinc="${nut.zinc }"
														carotene="${nut.carotene }">${nut.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnum2"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'nut','2')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="nuttype" id="nuttype3"
						style="display: none;">
						<form name=frm_n3>
							<table>
								<tr>
									<td><input data-role="none" name="txt_n3"
										style="width: 200px" onkeyup="SelectTip_n3()"></td>
								</tr>
								<tr>
									<td><span id="nut3"><select data-role="none"
											name="nut3" style="width: 200px" size=10
											onchange="txt_n3.value=options[selectedIndex].text;typechange('nut','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="nut" items="${nutList}" varStatus="s">
													<option value="${nut.id }" energy="${nut.energy }"
														protein="${nut.protein }" fat="${nut.fat }"
														carbohydrate="${nut.carbohydrate }"
														cellulose="${nut.cellulose }" calcium="${nut.calcium }"
														ferrum="${nut.ferrum }" zinc="${nut.zinc }"
														carotene="${nut.carotene }">${nut.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnum3"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'nut','3')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="nuttype" id="nuttype4"
						style="display: none;">
						<form name=frm_n4>
							<table>
								<tr>
									<td><input data-role="none" name="txt_n4"
										style="width: 200px" onkeyup="SelectTip_n4()"></td>
								</tr>
								<tr>
									<td><span id="nut4"><select data-role="none"
											name="nut4" style="width: 200px" size=10
											onchange="txt_n4.value=options[selectedIndex].text;typechange('nut','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="nut" items="${nutList}" varStatus="s">
													<option value="${nut.id }" energy="${nut.energy }"
														protein="${nut.protein }" fat="${nut.fat }"
														carbohydrate="${nut.carbohydrate }"
														cellulose="${nut.cellulose }" calcium="${nut.calcium }"
														ferrum="${nut.ferrum }" zinc="${nut.zinc }"
														carotene="${nut.carotene }">${nut.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnum4"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'nut','4')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain" name="nuttype" id="nuttype5"
						style="display: none;">
						<form name=frm_n5>
							<table>
								<tr>
									<td><input data-role="none" name="txt_n5"
										style="width: 200px" onkeyup="SelectTip_n5()"></td>
								</tr>
								<tr>
									<td><span id="nut5"><select data-role="none"
											name="nut5" style="width: 200px" size=10
											onchange="txt_n5.value=options[selectedIndex].text;typechange('nut','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="nut" items="${nutList}" varStatus="s">
													<option value="${nut.id }" energy="${nut.energy }"
														protein="${nut.protein }" fat="${nut.fat }"
														carbohydrate="${nut.carbohydrate }"
														cellulose="${nut.cellulose }" calcium="${nut.calcium }"
														ferrum="${nut.ferrum }" zinc="${nut.zinc }"
														carotene="${nut.carotene }">${nut.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnum5"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'nut','5')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain">
						<button onclick="addfood('nut');">新增</button>
						<button onclick="removefood('nut');">移除</button>
					</div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>水果</h1>
				<div id="fruits">
					<div data-role="fieldcontain" name="fruitstype" id="fruitstype1">
						<form name=frm_f1>
							<table>
								<tr>
									<td><input data-role="none" name="txt_f1"
										style="width: 200px" onkeyup="SelectTip_f1()"></td>
								</tr>
								<tr>
									<td><span id="fruits1"><select data-role="none"
											name="fruits1" style="width: 200px" size=10
											onchange="txt_f1.value=options[selectedIndex].text;typechange('fruits','1')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="fruits" items="${fruitsList}" varStatus="s">
													<option value="${fruits.id }" energy="${fruits.energy }"
														protein="${fruits.protein }" fat="${fruits.fat }"
														carbohydrate="${fruits.carbohydrate }"
														cellulose="${fruits.cellulose }"
														calcium="${fruits.calcium }" ferrum="${fruits.ferrum }"
														zinc="${fruits.zinc }" carotene="${fruits.carotene }">${fruits.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum1">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'fruits','1')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="fruitstype" id="fruitstype2"
						style="display: none;">
						<form name=frm_f2>
							<table>
								<tr>
									<td><input data-role="none" name="txt_f2"
										style="width: 200px" onkeyup="SelectTip_f2()"></td>
								</tr>
								<tr>
									<td><span id="fruits2"><select data-role="none"
											name="fruits2" style="width: 200px" size=10
											onchange="txt_f2.value=options[selectedIndex].text;typechange('fruits','2')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="fruits" items="${fruitsList}" varStatus="s">
													<option value="${fruits.id }" energy="${fruits.energy }"
														protein="${fruits.protein }" fat="${fruits.fat }"
														carbohydrate="${fruits.carbohydrate }"
														cellulose="${fruits.cellulose }"
														calcium="${fruits.calcium }" ferrum="${fruits.ferrum }"
														zinc="${fruits.zinc }" carotene="${fruits.carotene }">${fruits.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum2"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'fruits','2')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="fruitstype" id="fruitstype3"
						style="display: none;">
						<form name=frm_f3>
							<table>
								<tr>
									<td><input data-role="none" name="txt_f3"
										style="width: 200px" onkeyup="SelectTip_f3()"></td>
								</tr>
								<tr>
									<td><span id="fruits3"><select data-role="none"
											name="fruits3" style="width: 200px" size=10
											onchange="txt_f3.value=options[selectedIndex].text;typechange('fruits','3')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="fruits" items="${fruitsList}" varStatus="s">
													<option value="${fruits.id }" energy="${fruits.energy }"
														protein="${fruits.protein }" fat="${fruits.fat }"
														carbohydrate="${fruits.carbohydrate }"
														cellulose="${fruits.cellulose }"
														calcium="${fruits.calcium }" ferrum="${fruits.ferrum }"
														zinc="${fruits.zinc }" carotene="${fruits.carotene }">${fruits.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum3"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'fruits','3')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="fruitstype" id="fruitstype4"
						style="display: none;">
						<form name=frm_f4>
							<table>
								<tr>
									<td><input data-role="none" name="txt_f4"
										style="width: 200px" onkeyup="SelectTip_f4()"></td>
								</tr>
								<tr>
									<td><span id="fruits4"><select data-role="none"
											name="fruits4" style="width: 200px" size=10
											onchange="txt_f4.value=options[selectedIndex].text;typechange('fruits','4')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="fruits" items="${fruitsList}" varStatus="s">
													<option value="${fruits.id }" energy="${fruits.energy }"
														protein="${fruits.protein }" fat="${fruits.fat }"
														carbohydrate="${fruits.carbohydrate }"
														cellulose="${fruits.cellulose }"
														calcium="${fruits.calcium }" ferrum="${fruits.ferrum }"
														zinc="${fruits.zinc }" carotene="${fruits.carotene }">${fruits.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum4"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'fruits','4')"
							required="true" value="200" min="0" max="1000">
					</div>

					<div data-role="fieldcontain" name="fruitstype" id="fruitstype5"
						style="display: none;">
						<form name=frm_f5>
							<table>
								<tr>
									<td><input data-role="none" name="txt_f5"
										style="width: 200px" onkeyup="SelectTip_f5()"></td>
								</tr>
								<tr>
									<td><span id="fruits5"><select data-role="none"
											name="fruits5" style="width: 200px" size=10
											onchange="txt_f5.value=options[selectedIndex].text;typechange('fruits','5')">
												<option selected="selected" value="0" energy="0" protein="0" fat="0"
													carbohydrate="0" cellulose="0">请选择</option>
												<c:forEach var="fruits" items="${fruitsList}" varStatus="s">
													<option  value="${fruits.id }" energy="${fruits.energy }"
														protein="${fruits.protein }" fat="${fruits.fat }"
														carbohydrate="${fruits.carbohydrate }"
														cellulose="${fruits.cellulose }"
														calcium="${fruits.calcium }" ferrum="${fruits.ferrum }"
														zinc="${fruits.zinc }" carotene="${fruits.carotene }">${fruits.name }</option>
												</c:forEach>
										</select></span></td>
								</tr>
							</table>
						</form>
					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum5"
						style="display: none;">
						<label for="number">食量（克）：</label> <input type="range"
							name="number" onchange="numberchange(this.value,'fruits','5')"
							required="true" value="200" min="0" max="1000">
					</div>
					<div data-role="fieldcontain">
						<button onclick="addfood('fruits');">新增</button>
						<button onclick="removefood('fruits');">移除</button>
					</div>
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
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript">

var mainfoodCount = 1;
var meatCount = 1;
var vegetablesCount = 1;
var drinkCount = 1;
var nutCount = 1;
var fruitsCount = 1;
var targetsumenergy = parseInt(${energy});
	var pId = ""; 
	function typechange(id,idnum){
		var option = $('#'+id+"type"+idnum).find("select option:selected");
		var num = parseInt($('#'+id+"num"+idnum).find("input").val());
		var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
		+option.text()+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
		+parseFloat(num*parseFloat(option[0].attributes.energy.value)/100)
		+'</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
		+parseFloat(num*parseFloat(option[0].attributes.protein.value)/100)+'</div>'
		+'<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
		+parseFloat(num*parseFloat(option[0].attributes.fat.value)/100)
		+'</div>';
			if($('#detail'+id+idnum).html()==undefined){
			$('#detailtable').after("<div class='ui-grid-c' id='detail"+id+idnum+"'></div>");
			$('#detail'+id+idnum).append(html);
		}else{
			if(option.text()=="请选择"){
				$('#detail'+id+idnum).remove();
			}else{
				$('#detail'+id+idnum).html(html);
			}
		}
			updateEnergy();
	}
	function numberchange(num,id,idnum){
		var sumenergy = parseInt($('#sumenergy').text());
		var option = $('#'+id+"type"+idnum).find("select option:selected");
		if(option.val()!=0){
			var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
				+option.text()+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
				+parseFloat(num*parseFloat(option[0].attributes.energy.value)/100)
				+'</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
				+parseFloat(num*parseFloat(option[0].attributes.protein.value)/100)+'</div>'
				+'<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
				+parseFloat(num*parseFloat(option[0].attributes.fat.value)/100)
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
			$('#'+id+'num'+len).hide();
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
			$('#'+id+'num'+len).show();
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
		var len = $('#'+id).find('div').filter("[name='"+id+"type']").length;;
		var nums = $('#'+id).find('div').filter("[name='"+id+"num']");
		var typevalues = "";
		var numvalues = "";
		for(var i=1; i<len; i++){
			var option = $('#'+id+"type"+i).find("select option:selected");
			typevalues+=option.val()+",";
		}
		typevalues += $('#'+id+"type"+len).find("select option:selected").val();
		for(var i=1; i<len; i++){
			numvalues+=$('#'+id+"num"+i).find("input").val()+",";
		}
		numvalues += $('#'+id+"num"+len).find("input").val();
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
