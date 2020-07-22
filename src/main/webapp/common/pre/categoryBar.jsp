<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<div class="nav">
	<div class="nav_t">全部商品分类</div>

	<div class="leftNav none" style="display: none;">
		<ul>
			<!-- 判断用户是否登录 -->
			<c:choose>
				<c:when test="${not empty sessionScope.easybuyUserLogin}">
					<c:set var="flag" value="${sessionScope.easybuyUserLogin.id}" scope="page"/>
				</c:when>
				<c:otherwise>
					<c:set var="flag" value="" scope="page"/>
				</c:otherwise>
			</c:choose>
			<c:forEach var="list" items="${list}" varStatus="index">
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
												<a href="${ctx}/spring/product/queryProductList3?category=${list3.id}">${list3.name }</a>|
													</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="zj_r">
							<a href="#"><img src="${ctx}/statics/images/n_img1.jpg"
								width="236" height="200" /></a> <a href="#"><img
								src="${ctx}/statics/images/n_img2.jpg" width="236" height="200" /></a>
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
	<c:forEach items="${list}" var="temp" varStatus="index">
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
<script type="text/javascript" src="${ctx}/statics/js/pre/bianse.js"></script>