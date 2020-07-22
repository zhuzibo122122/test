<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<div class="pages">
	<c:if test="${pager.pageCount>1}">
		<c:if test="${pager.currentPage!=1}">
			<a href="javascript:void(0);" class="p_pre"
				onclick="clicks('${pager.url}','1')">首页</a>
		</c:if>
		<c:if test="${pager.currentPage>1}">
			<a href="javascript:void(0);" class="p_pre"
				onclick="clicks('${pager.url}','${pager.currentPage-1}')">上一页</a>
		</c:if>
		<c:forEach var="temp"
			begin="${pager.currentPage>3?pager.currentPage-3:1}"
			end="${pager.pageCount-pager.currentPage>3?pager.currentPage+3:pager.pageCount}"
			step="1">
			<c:if test="${pager.currentPage==temp}">
				<a href="javascript:void(0);" class="cur"
					onclick="clicks('${pager.url}','${temp}')">${temp}</a>
			</c:if>
			<c:if test="${pager.currentPage!=temp}">
				<a href="javascript:void(0);"
					onclick="clicks('${pager.url}','${temp}')">${temp}</a>
			</c:if>
		</c:forEach>
		<c:if test="${pager.currentPage<pager.pageCount}">
			<a href="javascript:void(0);" class="p_pre"
				onclick="clicks('${pager.url}','${pager.currentPage+1}')">下一页</a>
		</c:if>
		<c:if test="${pager.currentPage!=pager.pageCount}">
			<a href="javascript:void(0);" class="p_pre"
				onclick="clicks('${pager.url}','${pager.pageCount}')">尾页</a>
		</c:if>
	</c:if>
	<input type="hidden" name="currentPage" value="${pager.currentPage}"
		id="thisCurrentPage">
	<c:if test="${pager.pageCount==0}">
        暂无记录
    </c:if>
</div>

