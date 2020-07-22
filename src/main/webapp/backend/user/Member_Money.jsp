<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
</head>
<body>
	<!--Begin Header Begin-->
	<%@ include file="/common/pre/header.jsp"%>

	<%@ include file="/common/backend/searchBar.jsp"%>
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<!-- 左侧Begin -->
			<%@ include file="/common/backend/leftBar.jsp"%>
			
			<!-- 右侧动态加载Begin -->
			<div class="m_right">
				<p></p>
				<div class="mem_tit">
					<span class="fr"
						style="font-size: 12px; color: #55555; font-family: '宋体'; margin-top: 5px;"></span>分类列表
				</div>
				<p align="right">
					<a href="javascript:void(0);" onclick="toAddProductCategory(${pager.currentPage});"
						class="add_b">添加分类</a> <br>
				</p>
				<br>
				<table border="0" class="ma_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="40">选择</td>
						<td width="110">分类名称</td>
						<td width="110">分类级别</td>
						<td width="130">父级分类</td>
						<td width="140">操作</td>
					</tr>
					<c:forEach items="${listCategory }" var="list">

						<tr>
							<td><input type="radio" name="radio" value="${list.id }"
								onclick="update('${list.id }','${pager.currentPage }')"></td>
							<td>${list.name }</td>
							<td><c:if test="${list.type==1 }">一级分类</c:if> <c:if
									test="${list.type==2 }">二级分类</c:if> <c:if
									test="${list.type==3 }">三级分类</c:if></td>
							<td><c:choose>
									<c:when test="${list.parentId==0 }">无</c:when>
									<c:otherwise>
									${list.parentName }
									</c:otherwise>
								</c:choose></td>
							<td><a href="javascript:;" id="${list.id }"
								class="delCategory" onclick="delCategory('${list.type }','${list.id }','${pager.currentPage }')">删除</a></td>
						</tr>

					</c:forEach>
				</table>
				<%@ include file="/common/pre/pagerBar.jsp"%>
				<div id="AddProductCategory"></div>
			</div>
		</div>
		<!--End 用户中心 End-->


		<!--Begin Footer Begin -->
		<%@ include file="/common/pre/footer.jsp"%>
		<!--End Footer End -->
	</div>

</body>
</html>