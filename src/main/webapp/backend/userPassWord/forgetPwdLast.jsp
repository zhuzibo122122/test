<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<title>忘记密码</title>
<link type="text/css" href="${ctx}/statics/css/css.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/common/pre/header.jsp"%>
	<div class="content">
		<div class="for-liucheng">
			<div class="liulist for-cur"></div>
			<div class="liulist for-cur"></div>
			<div class="liulist for-cur"></div>
			<div class="liulist for-cur"></div>
			<div class="liutextbox">
				<div class="liutext for-cur">
					<em>1</em><br />
					<strong>填写账户名</strong>
				</div>
				<div class="liutext for-cur">
					<em>2</em><br />
					<strong>验证身份</strong>
				</div>
				<div class="liutext for-cur">
					<em>3</em><br />
					<strong>设置新密码</strong>
				</div>
				<div class="liutext for-cur">
					<em>4</em><br />
					<strong>修改完成</strong>
				</div>
			</div>
		</div>
		<div class="successs">
			<h3>尊敬的 ${name } 用户！恭喜您，修改成功！</h3>
			<span style="font-size: 15px; color: green;"><span id="miao">5</span>秒后自动转跳登录页面...&nbsp;<a
				href="${ctx }/pre/Login.jsp">点击立即转跳</a></span>
		</div>
	</div>
	</div>
	<!--Begin Footer Begin -->
	<%@ include file="/common/pre/footer.jsp"%>
	<!--End Footer End -->
</body>
<script type="text/javascript"
	src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var miao = 4;
	var miaoTime = setInterval(function() {
		$("#miao").html(miao);
		miao--;
		if (miao == -1) {
			window.location = contextPath+"/pre/Login.jsp";
		}
	}, 1000);
</script>
</html>