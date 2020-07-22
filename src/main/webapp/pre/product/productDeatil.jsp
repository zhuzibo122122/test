<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/pre/header.jsp"%>
<script type="text/javascript" src="${ctx}/statics/js/common/n_nav.js"></script>
<script src="${ctx}/statics/js/cart/cart.js"></script>
<title>易买网</title>
</head>
<body>
	<!--Begin Header Begin-->
	<div id="searchBar">
		<%@ include file="/common/pre/searchBar.jsp"%>
	</div>
	<!--Begin Header Begin-->
	<!--End Header End-->
	<!--Begin Menu Begin-->
	<div class="menu_bg">
		<div class="menu">
			<!--Begin 商品分类详情 Begin-->
			<%@ include file="/common/pre/categoryBar.jsp"%>
			<!--End 商品分类详情 End-->
		</div>
	</div>
	<!--End Menu End-->
	<div class="i_bg">
		<div class="postion"></div>
		<div class="content">
			<div id="tsShopContainer">
				<div id="tsImgS">
					<a href="${ctx}/files/${product.fileName}" title="Images"
						class="MagicZoom" id="MagicZoom"> <img
						src="${ctx}/files/${product.fileName}" width="390" height="390" />
					</a>
				</div>
			</div>
			<div class="pro_des">
				<div class="des_name">
					<input type="hidden" value="${product.id}" name="entityId"
						class="n_ipt" />
					<p>${product.name}</p>
					<c:choose>
						<c:when test="${!empty product.description}">
						 ${product.description }             				
                </c:when>
						<c:otherwise>
                 		暂无介绍！
                </c:otherwise>
					</c:choose>
				</div>
				<div class="des_price">
					本店价格：<b>￥${product.price}</b><br />
				</div>
				<c:choose>				
					<c:when test="${product.stock==0}">
						<div class="des_price">
							<b>工作小哥竟在进货，抱歉啦！！</b><br />
						</div>
					</c:when>
					<c:otherwise>
						<div class="des_price">
							库存：<b>${product.stock}件</b><br />
						</div>
					</c:otherwise>
				</c:choose>

				<div class="des_choice">
					<span class="fl">型号选择：</span>
					<ul>
						<li class="checked" onclick="bianliang(this)">001
							<div class="ch_img"></div>
							<li onclick="bianliang(this)">002
								<div class="ch_img"></div>
						</li>
							<li onclick="bianliang(this)">003
								<div class="ch_img"></div>
						</li>
					</ul>
				</div>
				<div class="des_choice">
					<span class="fl">套餐选择：</span>
					<ul>
						<li onclick="bianliang(this)">套餐1
							<div class="ch_img"></div>
						</li>
						<li class="checked" onclick="bianliang(this)">套餐2
							<div class="ch_img"></div>
						</li>
						<li onclick="bianliang(this)">套餐3
							<div class="ch_img"></div>
						</li>
					</ul>
				</div>

				<div class="des_share">
					<!-- 如果用户未登录或者登录状态收藏夹为空时 默认显示一种关注商品图标-->
					<c:if test="${empty requestScope.easybuyCollect}">
						<div class="d_care"
								style="background : url(${ctx}/statics/images/heart.png) no-repeat left center"
								onclick="addFavorite(this,'${product.id}','${sessionScope.easybuyUserLogin.id }')">
								<a href="javascript:void(0);">关注商品</a>
							</div>
					</c:if>
					<c:forEach items="${requestScope.easybuyCollect}" var="easybuyCollect">
					<c:choose>
						<c:when test="${easybuyCollect.productId==product.id }">
							<div class="d_care"
								style="background : url(${ctx}/statics/images/heart_h.png) no-repeat left center"
								onclick="addFavorite(this,'${product.id}','${sessionScope.easybuyUserLogin.id }')">
								<a href="javascript:void(0);">关注商品</a>
							</div>
						</c:when>
					</c:choose>
					</c:forEach>
				</div>
				<div class="des_join">
					<div class="j_nums">
						<input type="text" value="1" name="quantity" class="n_ipt" maxlength="3" />
						<input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" /> 
						<input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" /> 
						<input type="hidden" name="productStock" value="${product.stock}" />
					</div>
					<c:choose>
						<c:when test="${product.stock==0}">
							<a href="javascript:;">
								<span class="fl" style="display: inline-block;height: 45px;line-height:45px; width: 180px;text-align: center; font-size:18px;background-color: #FF3200;color: white; "><b>无货</b></span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="fl"> <img
								src="${ctx}/statics/images/j_car.png" onclick="addCart('${sessionScope.easybuyUserLogin==null?'':sessionScope.easybuyUserLogin.id}',1)" />
							</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="content mar_20">
			<div id="favoriteList"></div>
			<div class="l_list">
				<div class="des_border">
					<div class="des_tit">
						<ul>
							<li class="current"><a href="#p_attribute">商品属性</a></li>
							<li><a href="#p_details">商品详情</a></li>
						</ul>
					</div>
					<div class="des_con" id="p_attribute">
						<table border="0" align="center"
							style="width: 100%; font-family: '宋体'; margin: 10px auto;"
							cellspacing="0" cellpadding="0">
							<tr>
								<td>商品名称：${product.name}</td>
								<td>商品价格：${product.price}</td>
								<td>品牌： 迪奥（Dior）</td>
								<td>上架时间：2015-09-06 09:19:09</td>
							</tr>
							<tr>
								<td>商品毛重：160.00g</td>
								<td>商品产地：法国</td>
								<td>香调：果香调香型：淡香水/香露EDT</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>容量：1ml-15ml</td>
								<td>类型：女士香水，Q版香水，组合套装</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="des_border" id="p_details">
					<div class="des_t">商品详情</div>
					<div class="des_con">
						<table border="0" align="center"
							style="width: 745px; font-size: 14px; font-family: '宋体';"
							cellspacing="0" cellpadding="0">
							<tr>
								<td>${product.description}</td>
							</tr>
						</table>
						<p align="center">
							<img src="${ctx}/files/${product.fileName}" width="185"
								height="155">
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/common/pre/footer.jsp"%>
		<!--Begin 弹出层-加入购物车 Begin-->
	</div>
	<script type="text/javascript" src="${ctx}/statics/js/pre/addShu.js"></script>
</body>
</html>
