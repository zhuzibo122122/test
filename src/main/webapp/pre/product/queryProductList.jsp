<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="/common/pre/header.jsp" %>
    <script type="text/javascript" src="${ctx}/statics/js/common/n_nav.js"></script>
    <script src="${ctx}/statics/js/cart/cart.js"></script>
    <title>易买网</title>
</head>
<body>
<!--Begin Header Begin-->
<div id="searchBar">
    <%@ include file="/common/pre/searchBar.jsp" %>
</div>
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <%@ include file="/common/pre/categoryBar.jsp" %>
        <!--End 商品分类详情 End-->
    </div>
</div>
<!--End Menu End-->
<div class="i_bg">
    <!--Begin 筛选条件 Begin-->
    <!--End 筛选条件 End-->
    <div class="content mar_20">
        <div id="favoriteList">
        </div>
        <div class="l_list">
            <div class="list_t">
                <span class="fr">共发现${total}件</span>
            </div>
            <div class="list_c">
                <ul class="cate_list">
                    <c:forEach items="${productList}" var="productList">
                        <li>
                             <div class="img">
                                <a href="javascript:void(0);" target="_blank" onclick="clickimg('${productList.id}')">
                                    <img src="${ctx}/files/${productList.fileName}" width="210" height="185"/>
                                </a>
                             </div>
                            <div class="price">
                                <font>￥<span>${productList.price}</span></font>
                            </div>
                            <div class="name"><a href="${ctx}/spring/product/queryProductDeatil?id=${productList.id}">${productList.name}</a></div>
                            <div class="carbg">
                              <c:forEach items="${listCollect}" var="listCollect">
                            	<c:if test="${listCollect.productId==productList.id }">
                              	<c:set var="flag" value="${productList.id }" />
                              	</c:if>
                              </c:forEach>
                            <c:choose>
                            <c:when test="${flag!=productList.id }">
                             <a href="javascript:void(0);" class="ss" onclick="addFavorite(this,'${productList.id}','${sessionScope.easybuyUserLogin.id }')">收藏</a>
                            </c:when>
                            <c:otherwise>
                            <a href="javascript:void(0);" class="ss" style="background-image: url(${ctx}/statics/images/heart_h.png)" onclick="delFavorite(this,'${productList.id}','${sessionScope.easybuyUserLogin.id }',0)">收藏</a>
                            </c:otherwise>
                            </c:choose>                  
                                <a href="javascript:void(0);" class="j_car" onclick="addCartByParam('${productList.id}',1,'${sessionScope.easybuyUserLogin==null?'':sessionScope.easybuyUserLogin.id}',1);">加入购物车</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%@ include file="/common/backend/pagerBar.jsp" %>
            </div>
        </div>
    </div>
    <%@ include file="/common/pre/footer.jsp" %>
</div>
<script type="text/javascript">
function clickimg(id) {
	location.href = contextPath+"/spring/product/queryProductDeatil?id="+id+"&userId=${sessionScope.easybuyUserLogin.id}";
}
</script>
</body>
</html>
