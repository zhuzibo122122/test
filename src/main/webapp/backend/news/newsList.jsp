<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/pre/header.jsp"%>

</head>
<body>
	<%@ include file="/common/backend/searchBar.jsp"%>
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="/common/backend/leftBar.jsp"%>
			<div class="m_right">
				<p></p>
				<div class="mem_tit">资讯列表</div>
				<table border="0" class="order_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="20%">文章标题</td>
							<td width="25%">创建时间</td>
						</tr>
						<c:forEach items="${newsList}" var="temp" varStatus="index">
							<c:if test="${index.count<10 }">
								<tr>
									<td><a
										href="javascript:;" onclick="newsDetail('spring/newsDeatil','${temp.id}')">${temp.title}</a></td>
									<td>${temp.createTime}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pre/pagerBar.jsp"%>
			</div>
		</div>
		<%@ include file="/common/pre/footer.jsp"%>
	</div>
</body>

</html>
