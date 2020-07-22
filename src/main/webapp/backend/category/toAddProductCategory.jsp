<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<table border="0" class="add_tab" style="width: 930px;" cellspacing="0"
	cellpadding="0">
	<tr>
		<td width="135" align="right">分类级别</td>
		<td colspan="3" style="font-family: '宋体';"><select class="jj"
			name="type" style="background-color: #f6f6f6;" id="type"
			onchange="selectProductCategoryLevel(this);"
			<c:if test="${productCategory.id!=null}">disabled="disabled"</c:if>>
				<option value="" selected="selected">请选择...</option>
				<c:if test="${productCategory.type==1}">
					<option value="1" selected="selected">一级分类</option>
				</c:if>
				<c:if test="${productCategory.type!=1}">
					<option value="1">一级分类</option>
				</c:if>
				<c:if test="${productCategory.type==2}">
					<option value="2" selected="selected">二级分类
                </option>
				</c:if>
				<c:if test="${productCategory.type!=2}">
					<option value="2">二级分类
                </option>
				</c:if>
				<c:if test="${productCategory.type==3}">
					<option value="3" selected="selected">三级分类</option>
				</c:if>
				<c:if test="${productCategory.type!=3}">
					<option value="3">三级分类</option>
				</c:if>
		</select></td>
	</tr>
	<tr
		<c:if test="${productCategory.type==1||productCategory==null}">style="display:none"</c:if>>
		<td width="135" align="right">一级分类</td>
		<td colspan="3" style="font-family: '宋体';"><select class="jj"
			name="productCategoryLevel1" style="background-color: #f6f6f6;"
			id="productCategoryLevel1" onchange="queryProductCategoryList(this);">

				<c:forEach items="${productCategoryList1}" var="temp">
					<c:choose>
						<c:when
							test="${productCategory.id==temp.id || productCategory.parentId==temp.id||parentProductCategory.parentId==temp.id }">
							<option value="${temp.id}" selected="selected">${temp.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${temp.id}">${temp.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${productCategory.id!=null}">
						<option value="0">请选择...</option>
					</c:when>
					<c:otherwise>
						<option value="0" selected="selected">请选择...</option>
					</c:otherwise>
				</c:choose>
		</select></td>
	</tr>
	<tr <c:if test="${productCategory.type!=3}">style="display:none"</c:if>>
		<td width="135" align="right">二级分类</td>
		<td><select class="jj" name="productCategoryLevel2"
			style="background-color: #f6f6f6;" id="productCategoryLevel2">

				<c:forEach items="${productCategoryList2}" var="temp">
					<c:choose>
						<c:when
							test="${productCategory.id==temp.id || productCategory.parentId==temp.id ||parentProductCategory.id==temp.id}">
							<option value="${temp.id}" selected="selected">${temp.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${temp.id}">${temp.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${productCategory.id!=null}">
						<option value="0">请选择...</option>
					</c:when>
					<c:otherwise>
						<option value="0" selected="selected">请选择...</option>
					</c:otherwise>
				</c:choose>
		</select></td>
	</tr>
	<tr>
		<td align="right">分类名称</td>
		<td style="font-family: '宋体';"><input type="text"
			value="${productCategory.name}" class="add_ipt" id="name"  maxlength="18"/>（必填） <input
			type="hidden" name="id" value="${productCategory.id}" id="id">
		</td>
	</tr>
</table>
<p align="right">
	<br>
	<!-- 隐藏域 记录在哪一页记录 -->
	<input type="hidden" name="currentPage" id="currentPage" value="${requestScope.currentPage }"/>
	<c:choose>
		<c:when test="${productCategory.id!=null}">
			<a href="javascript:void(0);" onclick="saveOrUpdate();" class="add_b">确认修改</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0);" onclick="saveinsert();" class="add_b">添加分类</a>
		</c:otherwise>
	</c:choose>


</p>