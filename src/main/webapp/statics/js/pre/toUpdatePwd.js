$(document).ready(function(){
	

	/**
	 * 修改密码！
	 * @returns
	 */
	$("#bbbttnn").click(function(){
		if(checkName()){
			if(!validate()){
				return false;
			}else{
				var name = $("#loginName").val();
				// 拼接参数！
				location.href=contextPath+"/EasybuyUserServlet?action=findLoginNamePassword&name="+name;
			}
		} 
	});
	
	/**
	 * 用户名鼠标移开事件！
	 */
	$("#loginName").blur(function(){
		checkName();
		
	});
	
	/**
	 * 验证用户名！
	 */
	function checkName(){
		var name = $("#loginName").val();
		if(name==""||name==null){
			$("#spanParent").show("slow");
			$("#span").css("background","url(/EasyBuy/statics/images/info.png) no-repeat left 3px");
			$("#error").html("用户名不能为空！");
			return false;
		}else if(checkNullLoginName(name)){
			$("#spanParent").show("slow");
			$("#span").css("background","url(/EasyBuy/statics/images/info.png) no-repeat left 3px");
			$("#error").html("用户名不能包含空格！");
			return false;
		}else{
			// 拼接参数！
			var item = {"action" : "loginNameCount","name":name};
			// 异步请求！
			$.post(contextPath+"/EasybuyUserServlet",item,function(jsonStr){
				var count = eval("("+jsonStr+")");
				if(count.message!="该用户名已经存在"){
					$("#spanParent").show("slow");
					$("#span").css("background","url(/EasyBuy/statics/images/info.png) no-repeat left 3px");
					$("#error").html("该用户名还未注册！");
					return false;
				}else{
					$("#spanParent").show("slow");
					$("#span").css("background","url(/EasyBuy/statics/images/green.png) no-repeat left 3px");
					$("#error").html("OK！");
					return true;
				}
			});
		}
		return true;
	}
	/**
	 * 验证用户名包含空格！
	 */
	function checkNullLoginName(name){
		var reg = /\s/;
		if (reg.test(name)) {
			return true;
		} else {
			return false;
		}
	}
});
/**
 * 获取验证码！
 * 
 * @returns
 */
function createCode() {
	code = "";
	var codeLength = 4;// 验证码的长度
	var checkCode = document.getElementById("code");
	var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D',
			'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
			'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');// 随机数
	for (var i = 0; i < codeLength; i++) {// 循环操作
		var index = Math.floor(Math.random() * 36);// 取得随机数的索引（0~35）
		code += random[index];// 根据索引取得随机数加到code上
	}
	checkCode.value = code;// 把code值赋给验证码
}
/**
 * 校验验证码！
 * 
 * @returns
 */
function validate() {
	var inputCode = document.getElementById("input").value.toUpperCase(); // 取得输入的验证码并转化为大写
	var inputCod = document.getElementById("input");
	if (inputCode.length <= 0) { // 若输入的验证码长度为0
		
		return false;
	} else if (inputCode != code) { // 若输入的验证码与产生的验证码不一致时
		mizhu.alert("输入提示", "验证码输入错误！"); // 则弹出验证码输入错误
		createCode();// 刷新验证码
		document.getElementById("input").value = "";// 清空文本框
		return false;
	}
	return true;
}