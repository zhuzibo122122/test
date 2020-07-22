<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/pre/header.jsp"%>
</head>
<body>
	<%@ include file="/common/backend/searchBar.jsp"%>
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="/common/backend/leftBar.jsp"%>
			<div class="m_right" id="content">
				<p></p>
				<div class="mem_tit">订单明细列表</div>
				<table border="0" class="order_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="20%">商品名称</td>
							<td width="20%">商品图片</td>
							<td width="25%">数量</td>
							<td width="25%">价格</td>
						</tr>
						<c:forEach items="${listOrderDetail}" var="listOrderDetail">
							<c:if test="${listOrderDetail.orderId==orderId }">
								<tr>
									<td>${listOrderDetail.name}</td>
									<td><a href="${ctx}/spring/product/queryProductDeatil?id=${listOrderDetail.id}"
										target="_blank"> <img src="${ctx}/files/${listOrderDetail.fileName}" width="50" height="50"></a></td>
									<td>${listOrderDetail.quantity}</td>
									<td>${listOrderDetail.cost}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="/common/pre/footer.jsp"%>
	</div>
</body>
</html>


