<%@page import="com.dxd.pojo.EasybuyProductCategory"%>
<%@page import="com.dxd.pojo.EasybuyProduct"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="/common/backend/leftBar.jsp"%>
			<div class="m_right" id="content" style="font-weight: bolder;">
				<div class="mem_tit">
					<c:choose>
						<c:when test="${empty easybuyProduct.id || easybuyProduct.id==0}">商品上架</c:when>
						<c:otherwise>修改商品</c:otherwise>
					</c:choose>
				</div>
				<br>
				<form action="${ctx }/spring/product/getImgs" method="post" id="productAdd" name="form1">
					<table border="0" class="add_tab" style="width: 930px;"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="135" align="right">一级分类</td>
							<td colspan="3" style="font-family: '宋体'"><select
								name="categoryLevel1Id" style="background-color: #f6f6f6;"
								id="productCategoryLevel1" onchange="change1()">
									<c:forEach items="${listOne }" var="listOne">
										<c:if test="${easybuyProduct.categoryLevel1==listOne.id}">
											<option value="${listOne.id }" selected="selected">${listOne.name }</option>
										</c:if>
										<c:if test="${easybuyProduct.categoryLevel1!=listOne.id}">
											<option value="${listOne.id }">${listOne.name }</option>
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when
											test="${empty easybuyProduct.id || easybuyProduct.id==0}">
											<option value="0" selected="selected">请选择...</option>
										</c:when>
										<c:otherwise>
											<option value="0">请选择...</option>
										</c:otherwise>
									</c:choose>

							</select></td>
						</tr>
						<tr>
							<td width="135" align="right">二级分类</td>
							<td><select name="categoryLevel2Id"
								style="background-color: #f6f6f6;" id="productCategoryLevel2"
								onchange="change2()">

									<c:forEach items="${listTwo }" var="listTwo">
										<c:if test="${easybuyProduct.categoryLevel2==listTwo.id}">
											<option value="${listTwo.id }" selected="selected">${listTwo.name }</option>
										</c:if>
										<c:if test="${easybuyProduct.categoryLevel2!=listTwo.id}">
											<option value="${listTwo.id }">${listTwo.name }</option>
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when
											test="${empty easybuyProduct.id || easybuyProduct.id==0}">
											<option value="0" selected="selected">请选择...</option>
										</c:when>
										<c:otherwise>
											<option value="0">请选择...</option>
										</c:otherwise>
									</c:choose>
							</select></td>
						</tr>
						<tr>
							<td width="135" align="right">三级分类</td>
							<td><select name="categoryLevel3Id"
								style="background-color: #f6f6f6;" id="productCategoryLevel3">

									<c:forEach items="${listThree }" var="listThree">
										<c:if test="${easybuyProduct.categoryLevel3==listThree.id}">
											<option value="${listThree.id }" selected="selected">${listThree.name }</option>
										</c:if>
										<c:if test="${easybuyProduct.categoryLevel3!=listThree.id}">
											<option value="${listThree.id }">${listThree.name }</option>
										</c:if>

									</c:forEach>
									<c:choose>
										<c:when
											test="${empty easybuyProduct.id || easybuyProduct.id==0}">
											<option value="0" selected="selected">请选择...</option>
										</c:when>
										<c:otherwise>
											<option value="0">请选择...</option>
										</c:otherwise>
									</c:choose>
							</select></td>
						</tr>
						<tr>
							<input type="hidden" name="id" value="${easybuyProduct.id}"
								id="id">
							<td width="135" align="right">商品名称</td>
							<td><input type="text" value="${easybuyProduct.name}"
								class="add_ipt" name="name" id="name" maxlength="18" />（必填）</td>
						</tr>
						<tr>
							<td width="135" align="right">商品图片</td>
							<td><c:if test="${easybuyProduct.id != 0}">
									<img src="${ctx}/files/${easybuyProduct.fileName}" width="50" height="50" id="img" />
								</c:if><input type="file" class="text" id="fiel" /> <span></span></td>
						</tr>
						<tr>
							<td width="135" align="right">单价</td>
							<td><input type="number" value="${easybuyProduct.price}"
								class="add_ipt" name="price" id="price" maxlength="10" /></td>
						</tr>
						<tr>
							<td width="135" align="right">库存</td>
							<td><input type="number" value="${easybuyProduct.stock}"
								class="add_ipt" name="stock" id="stock" maxlength="10" /></td>
						</tr>
						<tr>
							<td width="135" align="right">描述</td>
							<td><textarea name="description" id="description"
									maxlength="255">${easybuyProduct.description}</textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><c:choose>
									<c:when
										test="${empty easybuyProduct.id || easybuyProduct.id==0}">
										<input type="button" value="商品上架" class="s_btn"
											onclick="checkProduct()">
									</c:when>
									<c:otherwise>
										<input type="button" value="修改商品" class="s_btn"
											onclick="checkProduct()">
										<input type="hidden" id="currentPage" value="${currentPage}">
										<input type="hidden" id="id" value="${easybuyProduct.id}">
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</form>

			</div>
		</div>

		<!--Begin Footer Begin -->
		<%@ include file="/common/pre/footer.jsp"%>
		<!--End Footer End -->
	</div>

</body>
</html>


