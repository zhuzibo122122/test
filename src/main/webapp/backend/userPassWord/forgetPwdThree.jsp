<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var contextPath = "${ctx}";
</script>
<link type="text/css" href="${ctx}/statics/css/css.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/common/pre/header.jsp" %>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div>
     <input type="hidden" value="${name }" id="logName"/>
     <form action="javascript:;" method="post" class="forget-pwd">
       <dl>
        <dt>新密码：</dt>
        <dd><input type="password" style="text-indent: 5px" id="password"/></dd>
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>确认密码：</dt>
        <dd><input type="password" style="text-indent: 5px" id="passwordTwo"/></dd>
        <div class="clears"></div>
       </dl> 
       <div class="subtijiao"><input type="button" value="提交" id="setPwd"/></div> 
      </form>
   </div>
  </div>
	<!--Begin Footer Begin -->
    <%@ include file="/common/pre/footer.jsp" %>
    <!--End Footer End -->    
<script type="text/javascript" src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#setPwd").click(function(){
		// 获取用户输入的数据！
		var name = $("#logName").val();
		var password = $("#password").val();
		var passwordTwo = $("#passwordTwo").val();
		if(password == "" || password == null){
			mizhu.alert('操作提醒',"请输入密码！");
		}else if(passwordTwo==""||passwordTwo==null){
			mizhu.alert('操作提醒',"请输入确认密码！");
		}else if(passwordTwo!=password){
			mizhu.alert('操作提醒',"两次密码输入不一致！");
		}else{
			// 异步请求！
			var item = {"action":"modifyPassWord","name":name,"password":password};
			$.post(contextPath+"/EasybuyUserServlet",item,function(jsonStr){
				 var count = eval("("+jsonStr+")");
				 if(count.status==1){
					// 跳转页面！
					 location.href=contextPath+"/EasybuyUserServlet?action=forgetPwd&name="+name;
				 }
			});
		}
	});
});
</script>
</body>
</html>