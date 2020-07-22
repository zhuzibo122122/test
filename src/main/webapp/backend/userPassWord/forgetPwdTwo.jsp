<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="/common/pre/header.jsp" %>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form action="javascript:;" method="post" class="forget-pwd">
       <dl>
        <dt>验证方式：</dt>
        <dd>
         <select class="selyz">
          <option value="0">已验证手机</option>
          <option value="1">已验证邮箱</option>
         </select>
        </dd>
        <div class="clears"></div>
       </dl>
       <dl>
        <dt>用户名：</dt>
        <dd><input type="text" value="${name }" id="name" readonly style="color: buttonshadow;;;font-weight: bolder;font-size: 15px;text-indent: 5px"/></dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzsj">
        <dt>已验证手机：</dt>
        <dd><input type="text" value="" style="text-indent: 5px" id="mobile"/></dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzyx" style="display: none">
        <dt>已验证邮箱：</dt>
        <dd><input type="text" value="" style="text-indent: 5px" id="email"/></dd>
        <div class="clears"></div>
       </dl>
       <div class="subtijiao"><input type="button" value="提交" id="TiJi"/></div> 
      </form>
   </div>
  </div>
	<!--Begin Footer Begin -->
    <%@ include file="/common/pre/footer.jsp" %>
    <!--End Footer End -->  
<script type="text/javascript" src="${ctx}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
 //导航定位
 $(function(){
	// $(".nav li:eq(2) a:first").addClass("navCur")
	 //验证手机 邮箱 
	 $(".selyz").change(function(){
	   var selval=$(this).find("option:selected").val();
		 if(selval=="0"){
			 $(".sel-yzsj").show()
			 $(".sel-yzyx").hide()
			 }
		 else if(selval=="1"){
			 $(".sel-yzsj").hide()
			 $(".sel-yzyx").show()
			 }
		 })
	 });
 
 
 $("#TiJi").click(function(){
	 // 获取数据！
	 var name = $("#name").val(); 
	 // 获取下拉框！
	 var selyz = $(".selyz").val();
	 var moName=null;
	 var valu=null;
	 // 判断用户验证什么！
	 if(selyz==0){
		 // 获取手机号码！
		 valu = $("#mobile").val();
		 moName="mobile";
	 }else{
		 // 获取邮箱！
		 valu = $("#email").val();
		 moName="email";
	 }
 
	 // 拼接参数！
	 var item = {"action":"loginNameBy","name":name,"moName":moName,"valu":valu};
	 // 异步请求！
	 $.post(contextPath+"/EasybuyUserServlet",item,function(jsonStr){
		 var count = eval("("+jsonStr+")");
		 if(count.status==1){
			 // 跳转页面！
			 location.href=contextPath+"/EasybuyUserServlet?action=modifyPwd&name="+name;
		 }else{
			 mizhu.alert('操作提醒',count.message);
		 }
	 });
 });
</script>
</body>
</html>