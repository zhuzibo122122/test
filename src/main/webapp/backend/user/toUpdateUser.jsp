<%@page import="com.dxd.pojo.EasybuyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
			<div class="m_right" id="content">
				<div class="mem_tit">
					<c:choose>
						<c:when test="${empty user.id || user.id==0}">添加用户 </c:when>
						<c:otherwise>修改用户</c:otherwise>
					</c:choose>
				</div>
				<br />
				<form action="${ctx}/admin/user?action=updateUser" method="post" id="userAdd">
					<!-- 隐藏域存储原始登录名 -->
					<input type="hidden" value="${requestScope.oldloginName }" id="oldname"/>
					<table border="0" class="add_tab" style="width: 930px;"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="135" align="right">用户姓名</td>
							<td colspan="3" style="font-family: '宋体';"><input
								type="text" value="${user.loginName}" class="add_ipt"
								name="loginName" id="loginName" maxlength="18"/> <%--<input type="hidden" value="${user.id}" name="id"> --%>
							</td>
						</tr>
						<tr>
							<td width="135" align="right">真实姓名</td>
							<td><input type="text" value="${user.userName}"
								class="add_ipt" name="userName" id="userName" maxlength="18"/></td>
						</tr>
						<c:if test="${empty user.id ||  user.id==0}">
							<tr>
								<td width="135" align="right">密码</td>
								<td><input type="password" value="" class="add_ipt"
									name="password" id="password" maxlength="18" /></td>
							</tr>
							<tr>
								<td width="135" align="right">确认密码</td>
								<td><input type="password" value="" class="add_ipt"
									name="repPassword" id="repPassword" maxlength="18" /></td>
							</tr>
						</c:if>
						<tr>
							<td width="135" align="right">身份证号</td>
							<td><input type="text" value="${user.identityCode}"
								class="add_ipt" name="identityCode" id="identityCode" maxlength="18" /></td>
						</tr>

						<tr>
							<td width="135" align="right">性别</td>
							<td><input type="radio" value="1" name="ra" checked />男&nbsp;
								<input type="radio" value="2" name="ra" />女</td>
						</tr>
						<tr>
							<td width="135" align="right">电子邮箱</td>
							<td><input type="text" value="${user.email}" class="add_ipt"
								name="email" id="email" maxlength="18" /></td>
						</tr>
						<tr>
							<td width="135" align="right">手机</td>
							<td><input type="text" value="${user.mobile}"
								class="add_ipt" name="mobile" id="mobile"  maxlength="18"/></td>
						</tr>
						<tr>
							<td width="135" align="right">用户类型</td>
							<td><select name="type" id="user">
									<c:choose>
										<c:when test="${user.type == 0 }">
											<option value="1">管理员</option>
											<option value="0" selected="selected">普通用户</option>
										</c:when>
										<c:when test="${user.type == 1 }">
											<option value="1" selected="selected">管理员</option>
											<option value="0">普通用户</option>
										</c:when>
										<c:otherwise>
											<option value="1">管理员</option>
											<option value="0" selected="selected">普通用户</option>
										</c:otherwise>
									</c:choose>
									
							</select></td>
						</tr>
						<tr>
							<td></td>
							<td><c:choose>
									<c:when test="${empty user.id || user.id==0}">
										<input type="button" value="添加用户" class="s_btn" onclick="s_btn(0)">
									</c:when>
									<c:otherwise>
										<input type="hidden" value="${currentPage}" />
										<input type="button" value="修改信息" class="s_btn" id="${user.id }" onclick="s_btn('${user.id }','${requestScope.currentPage }')">
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


