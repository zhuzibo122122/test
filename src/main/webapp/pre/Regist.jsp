<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
<style type="text/css">  
            #code  
            {  
                font-family:Arial;  
                font-style:italic;  
                font-weight:bold;  
                border:0;  
                letter-spacing:10px;  
                color:blue; 
                font-size: 18px;
                margin-left: 20px; 
            }  
</style> 
</head>
<body>
	<!--Begin Header Begin-->
	<%@ include file="/common/pre/header.jsp" %>
	<!--End Header End-->
	
	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<a href="Index.jsp"><img src="${ctx}/statics/images/logo.png" /></a>
			</div>
		</div>
		<div class="regist">
			<div class="log_img">
				<img src="${ctx}/statics/images/l_img.png" width="611" height="425" />
			</div>
			<div class="reg_c">
				<form action="javascript:;" method="post">
					<table border="0"
						style="width: 420px; font-size: 14px; margin-top: 20px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="95">&nbsp;</td>
							<td><span class="fl" style="font-size: 24px;">注册</span> <span
								class="fr">已有商城账号，<a href="Login.jsp"
									style="color: #ff4e00;">我要登录</a></span></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;用户名&nbsp;</td>
							<td><input type="text" value="" id="luser" class="l_user" maxlength="16" placeholder="用户名就是是用来登陆得账号"/></td>
						</tr>
						<tr id="errName" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/green.png) no-repeat left 5px" id="errNullName">
							<span style="margin-left: 26px"></span>
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;密码
								&nbsp;</td>
							<td><input type="password" value="" class="l_pwd" id="pwd" maxlength="18" placeholder="6~16位字符，区分大小写"/></td>
						</tr>
						<tr id="err" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/green.png) no-repeat left 5px" id="lengt">
							<span style="margin-left: 26px">不能包括空格</span><br/>
							
							</td>
						</tr>
						<tr id="err1" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="leng">
							<span style="margin-left: 26px">长度为6-16个字符</span><br/>
							</td>	
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码
								&nbsp;</td>
							<td><input type="password" value="" class="l_pwd" id="l_pwd" maxlength="16" placeholder="确认密码"/></td>
						</tr>
						<tr id="errPwd" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errEqPwd">
							<span style="margin-left: 26px"></span><br/>
							</td>	
						</tr>
						
						
						
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;真实姓名
								&nbsp;</td>
							<td><input type="text" value="" class="l_num" maxlength="16" placeholder="输入您得姓名"/></td>
						</tr>
						<tr id="errNum" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errNullNum">
							<span style="margin-left: 26px">真实姓名不能为空！</span><br/>
							</td>	
						</tr>
						<tr>
							<td align="right"><font color="#ff4e00">*</font>性别 &nbsp;</td>
							<td><input type="radio" value="1" name="ra" checked/>男&nbsp;
							<input type="radio" value="2" name="ra"/>女</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>身份证号 &nbsp;</td>
							<td><input type="text" value="" class="l_mem" maxlength="18" placeholder="输入您得身份证号码"/></td>
						</tr>
						<tr id="errMem" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errNullMem1">
							<span style="margin-left: 26px" >请输入正确的18位身份证号！</span><br/>
							</td>	
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>&nbsp;邮箱
								&nbsp;</td>
							<td><input type="text" value="" class="l_email" maxlength="16" placeholder="请输入您的常用邮箱"/></td>
						</tr>
						<tr id="errEmail" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errNullEmail">
							<span style="margin-left: 26px">输入正确的email！</span><br/>
							</td>	
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>&nbsp;手机
								&nbsp;</td>
							<td><input type="text" value="" class="l_tel" maxlength="11" placeholder="手机号码"/></td>
						</tr>
						<tr id="errTel" style="display: none">
							<td>&nbsp;</td>
							<td style="background: url(/EasyBuy/statics/images/info.png) no-repeat left 5px" id="errNullTel">
							<span style="margin-left: 26px">输入正确的手机号码！</span><br/>
							</td>	
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>&nbsp;验证码&nbsp;</td>
							<td>
								<input type = "text" id = "input" style="width:180px;height:34px;border: 1px solid #cccccc;" placeholder="  请输入验证码"/>
								<input type = "button" id="code" onclick="createCode()" style="width:110px;height:40px;"/>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="font-size: 12px; padding-top: 20px;"><span
								style="font-family: '宋体';" class="fl"> <label
									class="r_rad"><input type="checkbox" id="txt"/></label><label
									class="r_txt">我已阅读并接受《用户协议》</label>
							</span></td>
						</tr>
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="button" value="立即注册" class="log_btn" id="Reg_btn" disabled="disabled"/></td>
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
<script type="text/javascript" src="${ctx}/statics/js/pre/regist.js"></script>
<script type="text/javascript">
	var code ; //在全局定义验证码   
	//产生验证码  
	window.onload = createCode();
</script> 
</body>
</html>