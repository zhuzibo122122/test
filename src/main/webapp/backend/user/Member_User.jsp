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

			<div class="m_right">
				<div class="m_des">
					<table border="0" style="width: 870px; line-height: 22px;"
						cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td width="115"><img src="${ctx}/statics/images/user.jpg"
								width="90" height="90" /></td>
							<td>
								<div class="m_user">${sessionScope.easybuyUserLogin.userName }</div>
								<p>
									等级：注册用户 <br /> <font color="#ff4e00">您还差 270 积分达到 分红100</font><br />
									上一次登录时间: 2015-09-28 18:19:47<br /> 您还没有通过邮件认证 <a href="#"
										style="color: #ff4e00;">点此发送认证邮件</a>
								</p>
								<div class="m_notice">用户中心公告！</div>
							</td>
						</tr>
					</table>
				</div>

				<div class="mem_t">资产信息</div>
				<table border="0" class="mon_tab"
					style="width: 870px; margin-bottom: 20px;" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="33%">用户等级：<span style="color: #555555;">普通会员</span></td>
						<td width="33%">消费金额：<span>￥200元</span></td>
						<td width="33%">返还积分：<span>99R</span></td>
					</tr>
					<tr>
						<td>账户余额：<span>￥200元</span></td>
						</td>
						<td>红包个数：<span style="color: #555555;">3个</span></td>
						</td>
						<td>红包价值：<span>￥50元</span></td>
						</td>
					</tr>
					<tr>
						<td colspan="3">订单提醒： <font style="font-family: '宋体';">待付款(<span>0</span>)
								&nbsp; &nbsp; &nbsp; &nbsp; 待收货(<span>2</span>) &nbsp; &nbsp;
								&nbsp; &nbsp; 待评论(<span>1</span>)
						</font>
						</td>
					</tr>
				</table>

				<!-- 账号信息Begin -->
				<div class="mem_t">账号信息</div>

				<table border="0" class="mon_tab"
					style="width: 870px; margin-bottom: 20px;" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="40%">用户ID：<span style="color: #555555;">${sessionScope.easybuyUserLogin.id }</span></td>
						<td width="60%">邀请人：<span style="color: #555555;">${sessionScope.easybuyUserLogin.userName }</span></td>
					</tr>
					<tr>
						<td>电&nbsp; &nbsp; 话：<span style="color: #555555;">${sessionScope.easybuyUserLogin.mobile }</span></td>
						<td>邮&nbsp; &nbsp; 箱：<span style="color: #555555;">${sessionScope.easybuyUserLogin.email }</span></td>
					</tr>
					<tr>
						<td>身份证号：<span style="color: #555555;">${sessionScope.easybuyUserLogin.identityCode }</span></td>
						<td>注册时间：<span style="color: #555555;">2015-10-10</span></td>

					</tr>
				</table>


			</div>


		</div>
		<!--End 用户中心 End-->

		<!--Begin Footer Begin -->
		<%@ include file="/common/pre/footer.jsp"%>
		<!--End Footer End -->
	</div>
</body>
</html>