<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>易买网</title>
</head>
<body>

	<!--Begin Header Begin-->
	<!--End Header End-->
<%@ include file="/common/pre/header.jsp" %>

	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<a href="${ctx}/pre/Index.jsp"><img src="${ctx}/statics/images/logo.png" /></a>
			</div>
		</div>
		<div class="login">
			<div class="log_img">'
				<img src="${ctx}/statics/images/l_img.png" width="611" height="425" />
			</div>
			<div class="log_c">
				<form action="javascript:;" method="post">
					<table border="0"
						style="width: 370px; font-size: 14px; margin-top: 30px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="55">&nbsp;</td>
							<td><span class="fl" style="font-size: 24px;">登录</span> <span
								class="fr">还没有商城账号，<a href="${ctx}/pre/Regist.jsp"
									style="color: #ff4e00;">立即注册</a></span></td>
						</tr>
						<tr height="70">
							<td>用户名</td>
							<td><input type="text" value="" class="l_user" maxlength="18" placeholder="用户名"/></td>
						</tr>
						<tr height="70">
							<td>密&nbsp; &nbsp; 码</td>
							<td><input type="password" value="" class="l_pwd"  maxlength="16" placeholder="密码"/></td>
						</tr>
						
						<tr id="errPwd" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errEqPwd">
							<span style="margin-left: 26px"></span><br/>
							</td>	
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td style="font-size: 12px; padding-top: 20px;"><span
								style="font-family: '宋体';" class="fl"> <label
									class="r_rad"><input type="checkbox" checked="checked"/></label><label
									class="r_txt">请保存我这次的登录信息</label>
							</span> <span class="fr"><a href="${ctx}/backend/userPassWord/toUpdatePwd.jsp" style="color: #ff4e00;">忘记密码</a></span>
							</td>
						</tr>
						<tr height="60" >
							<td>&nbsp;</td>
							<td style="padding-bottom: 70px;padding-top: 8px;"><input type="button" value="登录" class="log_btn" id="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<!--Begin Footer Begin-->
	<div class="btmbg">
		<div class="btm">
			备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018
			尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
			<img src="${ctx}/statics/images/b_1.gif" width="98" height="33" /><img
				src="${ctx}/statics/images/b_2.gif" width="98" height="33" /><img
				src="${ctx}/statics/images/b_3.gif" width="98" height="33" /><img
				src="${ctx}/statics/images/b_4.gif" width="98" height="33" /><img
				src="${ctx}/statics/images/b_5.gif" width="98" height="33" /><img
				src="${ctx}/statics/images/b_6.gif" width="98" height="33" />
		</div>
	</div>
	<!--End Footer End -->	
<script type="text/javascript" src="${ctx}/statics/js/common/login.js"></script>


</body>
</html>