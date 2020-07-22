<%@page import="com.dxd.pojo.EasybuyUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
</head>
<body>
	<!--Begin Header Begin-->
	<%@ include file="/common/pre/header.jsp"%>

	<%@ include file="/common/pre/searchBar.jsp"%>
	<!--End Header End-->
	<%	
		String path = request.getContextPath();
		//判断是否有数据
		if(null == request.getAttribute("list")){
			out.print("<script type=\"text/javascript\"> location.href=\""+path+"/spring/toIndex\" </script>");
		}
	 %>

	<!--Begin Menu Begin-->
	<div class="menu_bg">
		<div class="menu">
			<!--Begin 商品分类详情 Begin-->
			<div class="nav">
				<div class="nav_t">全部商品分类</div>
				<div class="leftNav">
					<!-- 判断用户是否登录 -->
					<c:choose>
						<c:when test="${not empty sessionScope.easybuyUserLogin}">
							<c:set var="flag" value="${sessionScope.easybuyUserLogin.id}" scope="page"/>
						</c:when>
						<c:otherwise>
							<c:set var="flag" value="" scope="page"/>
						</c:otherwise>
					</c:choose>
					<ul>
						<c:forEach var="list" items="${list }" varStatus="index">
							<li>
								<div class="fj" onclick="pros('${list.id }','${flag}')">
									<span class="n_img"><span></span><img
										src="${ctx}/statics/images/nav${index.count }.png" /></span> <span
										class="fl">${list.name }</span>
								</div>

								<div class="zj" style="top: -${index.index*40 }px;">
									<div class="zj_l">

										<c:forEach var="list2" items="${list2 }" varStatus="index2">
											<c:if test="${list2.parentId==list.id }">
												<div class="zj_l_c">
													<h2>${list2.name }</h2>
													<c:forEach var="list3" items="${list3 }" varStatus="index2">
														<c:if test="${list3.parentId==list2.id }">
															<a
																href="${ctx}/spring/product/queryProductList3?category=${list3.id}">${list3.name }</a>|
													</c:if>
													</c:forEach>
												</div>
											</c:if>
										</c:forEach>



									</div>
									<div class="zj_r">
										<a href="#"><img src="${ctx}/statics/images/n_img1.jpg"
											width="236" height="200" /></a> <a href="#"><img
											src="${ctx}/statics/images/n_img2.jpg" width="236"
											height="200" /></a>
									</div>
								</div>

							</li>
						</c:forEach>
					</ul>


				</div>


			</div>
			<!--End 商品分类详情 End-->
			<ul class="menu_r">
				<li><a href="${ctx }/pre/Index.jsp">首页</a></li>
				<c:forEach items="${list}" var="temp">
					<!-- 判断是否登录 -->
					<c:choose>
						<c:when test="${ not empty sessionScope.easybuyUserLogin }">
							<li><a href="${ctx}/spring/product/queryProductList?category=${temp.id}&menu=${temp.id}&userId=${sessionScope.easybuyUserLogin.id}" <c:if test="${menu==temp.id}"> class="now" </c:if>>${temp.name}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${ctx}/spring/product/queryProductList?category=${temp.id}&menu=${temp.id}" <c:if test="${menu==temp.id}"> class="now" </c:if>>${temp.name}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<div class="m_ad">中秋送好礼！</div>
		</div>
	</div>
	<!--End Menu End-->
	<div class="i_bg bg_color">
		<div class="i_ban_bg">
			<!--Begin Banner Begin-->
			<div class="banner">
				<div class="top_slide_wrap">
					<ul class="slide_box bxslider">
						<li><a href="${ctx}/spring/product/queryProductDeatil?id=771">
						<img src="${ctx}/statics/images/a1.jpg" width="740"
							height="401" /></a></li>
						<li><a href="${ctx}/spring/product/queryProductDeatil?id=772">
						<img src="${ctx}/statics/images/a2.jpg" width="740"
							height="401" /></a></li>
						<li><a href="${ctx}/spring/product/queryProductDeatil?id=773">
						<img src="${ctx}/statics/images/a3.jpg" width="740"
							height="401" /></a></li>
						<li><a href="${ctx}/spring/product/queryProductDeatil?id=774">						
						<img src="${ctx}/statics/images/a4.jpg" width="740"
							height="401" /></a></li>
					</ul>
					<div class="op_btns clearfix">
						<a href="#" class="op_btn op_prev"><span></span></a> <a href="#"
							class="op_btn op_next"><span></span></a>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				//var jq = jQuery.noConflict();
				(function() {
					$(".bxslider").bxSlider({
						auto : true,
						prevSelector : jq(".top_slide_wrap .op_prev")[0],
						nextSelector : jq(".top_slide_wrap .op_next")[0]
					});
				})();
			</script>
			<!--End Banner End-->
			<!-- 新闻 -->
			<div class="inews">
				<div class="news_t">
					<span class="fr"><a
						href="${ctx }/spring/queryNewsList">更多 ></a></span>新闻资讯
				</div>
				<ul>
					<c:forEach var="newsList" items="${newsList }"
						varStatus="newsIndex">
						<c:if test="${newsIndex.count<=5 }">
							<li><span> <c:if test="${newsIndex.count%2==1 }">[ 特惠 ]</c:if>
									<c:if test="${newsIndex.count%2==0 }">[ 公告 ]</c:if>
							</span> <a
								href="${ctx }/spring/newsDeatil&newsId=${newsList.id }">${newsList.title }</a></li>
						</c:if>

					</c:forEach>

				</ul>
				<div class="charge_t">
					话费充值
					<div class="ch_t_icon"></div>
				</div>
				<form>
					<table border="0" style="width: 205px; margin-top: 10px;"
						cellspacing="0" cellpadding="0">
						<tr height="35">
							<td width="33">号码</td>
							<td><input type="text" value="" class="c_ipt" /></td>
						</tr>
						<tr height="35">
							<td>面值</td>
							<td><select class="jj" name="city">
									<option value="0" selected="selected">100元</option>
									<option value="1">50元</option>
									<option value="2">30元</option>
									<option value="3">20元</option>
									<option value="4">10元</option>
							</select> <span style="color: #ff4e00; font-size: 14px;">￥99.5</span></td>
						</tr>
						<tr height="35">
							<td colspan="2"><input type="submit" value="立即充值"
								class="c_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 新闻 End -->
		</div>
		<!--Begin 热门商品 Begin-->
		<div class="content mar_10">
			<div class="h_l_img">
				<div class="img">
					<a href="${ctx}/spring/product/queryProductDeatil?id=740">
						<img src="${ctx}/files/40C3B76BA31246618E3CFC8723D33517.jpg"
						width="188" height="188" />
					</a>
				</div>
				<div class="pri_bg">
					<span class="price fl">￥158.00</span> <span class="fr">26R</span>
				</div>
			</div>
			<div class="hot_pro">
				<div id="featureContainer">
					<div id="feature">
						<div id="block">
							<div id="botton-scroll">
								<ul class="featureUL">
									<c:forEach var="productList" items="${productList }"
										varStatus="productIndex">
										<li class="featureBox">
											<div class="box">
												<div class="h_icon">
													<img src="${ctx}/statics/images/hot.png" width="50"
														height="50" />
												</div>
												<div class="imgbg">
													<a
														href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}&userId=${sessionScope.easybuyUserLogin == null?'':sessionScope.easybuyUserLogin.id}"><img
														src="${ctx}/files/${productList.fileName }" width="160"
														height="136" /></a>
												</div>
												<div class="name">
													<a
														href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}">
														<h2>${productList.name }</h2>
													</a>
												</div>
												<div class="price">
													<font>￥<span>${productList.price }</span></font> &nbsp; 26R
												</div>
											</div>
										</li>


									</c:forEach>


								</ul>
							</div>
						</div>
						<a class="h_prev" href="javascript:void();">Previous</a> <a
							class="h_next" href="javascript:void();">Next</a>
					</div>
				</div>
			</div>
		</div>

		<div class="content mar_20">
			<img src="${ctx}/statics/images/mban_1.jpg" width="1200" height="110" />
		</div>
		<!--Begin 进口 生鲜 Begin-->
		<c:forEach var="list" items="${list }" varStatus="index">
			<div class="i_t mar_10">
				<span class="floor_num">${index.count }F</span> <span class="fl">${list.name }</span><span
					class="i_mores fr"> <c:forEach var="list2" items="${list2 }"
						varStatus="index2">
						<c:if test="${list2.parentId==list.id }">
							<a
								href="${ctx}/spring/product/queryProductList2?category=${list2.id}">${list2.name }</a>
						</c:if>
					</c:forEach>
				</span>
			</div>
			<div class="content">
				<div class="fresh_left">
					<div class="fre_ban">
						<div id="imgPlay1">
							<ul class="imgs" id="actor${index.count }">
								<c:forEach var="productList" items="${productList }"
									varStatus="productIndex">
									<c:if test="${productList.categoryLevel1==list.id }">
										<li><a
											href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}"><img
												src="${ctx}/files/${productList.fileName }" width="211"
												height="286" /></a></li>
									</c:if>
								</c:forEach>

							</ul>
							<div class="prevf">上一张</div>
							<div class="nextf">下一张</div>
						</div>
					</div>
					<div class="fresh_txt">
						<div class="fresh_txt_c">
							<c:forEach var="list2" items="${list2 }" varStatus="index2">
								<c:if test="${list2.parentId==list.id }">
									<a
										href="${ctx}/spring/product/queryProductList2?category=${list2.id}">${list2.name }</a>
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="fresh_mid">
					<ul>
						<c:forEach var="productList" items="${productList }"
							varStatus="productIndex">
							<c:if test="${productList.categoryLevel1==list.id }">
								<li>
									<div class="name">
										<a
											href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}">${productList.name }</a>
									</div>
									<div class="price">
										<font>￥<span>${productList.price }</span></font> &nbsp; 26R
									</div>
									<div class="img">
										<a
											href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}"><img
											src="${ctx}/files/${productList.fileName }" width="185"
											height="155" /></a>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="fresh_right">
					<ul>
						<li><a href="#"><img
								src="${ctx}/statics/images/fre_b1.jpg" width="260" height="220" /></a></li>
						<li><a href="#"><img
								src="${ctx}/statics/images/fre_b2.jpg" width="260" height="220" /></a></li>
					</ul>
				</div>
			</div>
			<c:if test="${index.count==3 }">
				<div class="content mar_20">
					<img src="${ctx}/statics/images/mban_1.jpg" width="1200"
						height="110" />
				</div>
			</c:if>
		</c:forEach>
		<%@ include file="/common/pre/footer.jsp"%>
	</div>
</body>
</html>
