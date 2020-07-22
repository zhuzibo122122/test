<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>阿里巴巴集团|易买网忘记密码</title>
<link type="text/css" href="${ctx}/statics/css/css.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/common/pre/header.jsp" %>

	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br />
						<strong>填写账户名</strong>
					</div>
					<div class="liutext">
						<em>2</em><br />
						<strong>验证身份</strong>
					</div>
					<div class="liutext">
						<em>3</em><br />
						<strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>4</em><br />
						<strong>完成</strong>
					</div>
				</div>
			</div>

			<form action="javascript:;" method="get" class="forget-pwd">
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input type="text" id="loginName" style="text-indent: 5px"/>
						<span style="display: none;margin-left: 10px" id="spanParent">
							<span style="display: inline-block;" id="span">
								<span style="display: inline-block;margin-left: 25px;" id="error"></span>
							</span>
						</span>
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>验证码：</dt>
					<dd>
						<input type="text" id ="input" style="text-indent: 5px"/>
						<div class="yanzma">
						<input type = "button" id="code" onclick="createCode()" style="width: 100px;border: 1px solid #ccc"/>
						</div>
					</dd>	
					<div class="clears"></div>
				</dl>
				<div class="subtijiao">
					<input type="button" value="提交" id="bbbttnn"/>
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
	</div>
	<!--Begin Footer Begin -->
    <%@ include file="/common/pre/footer.jsp" %>
    <!--End Footer End -->   
<script type="text/javascript" src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/pre/toUpdatePwd.js"></script>
<script type="text/javascript">
var code ; //在全局定义验证码   
//产生验证码  
window.onload = createCode();
</script>
</body>
</html>