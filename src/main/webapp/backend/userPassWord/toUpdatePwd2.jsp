<%@page import="com.dxd.pojo.EasybuyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
</head>
<body>
	<script type="text/javascript" src="${ctx}/statics/js/pager/pager.js"></script>
	<!--Begin Header Begin-->
	<%@ include file="/common/pre/header.jsp"%>

	<%@ include file="/common/backend/searchBar.jsp"%>
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<!-- 左侧Begin -->
			<%@ include file="/common/backend/leftBar.jsp"%>
			<!-- 修改密码 -->
			<div class="m_right" id="content">
				<div class="mem_tit">修改密码</div>
				<!-- 隐藏域 记录登录用户密码和用户名-->
				<input type="hidden" name="loginPwd" id="loginPwd" value="${easybuyUserLogin.password }"/>
				<input type="hidden" name="loginName" id="loginName" value="${easybuyUserLogin.loginName }"/>
				<ul style="margin-left:380px;margin-top:80px">
					<span style="font-weight:bolder;font-size:14px">旧 密 码</span>
					<li><input type="text" name="oldpwd" id="oldpwd"/>&nbsp;&nbsp;&nbsp;<span class="tishi"></span></li>
					<span style="font-weight:bolder;font-size:14px">新 密 码</span>
					<li><input type="password" name="newpwd" id="newpwd"/>&nbsp;&nbsp;&nbsp;<span class="tishi"></span></li>
					<span style="font-weight:bolder;font-size:14px">确认密码</span>
					<li><input type="password" name="repwd" id="repwd"/>&nbsp;&nbsp;&nbsp;<span class="tishi"></span></li><br/>
					<li><input type="button" value="提交" class="s_btn" onclick="UpdatePwd()" style="width:60px;height:35px;margin-left:10px"></li>
					<li><input type="button" value="重置" class="s_btn" onclick="clearAll()" style="width:60px;height:35px;margin-left:30px"></li>
				</ul>
			</div>
		</div>
		<!--End 用户中心 End-->

		<!--Begin Footer Begin -->
		<%@ include file="/common/pre/footer.jsp"%>
		<!--End Footer End -->
	</div>
</body>
</html>