/**
 * 窗体加载事件！
 * 
 * @returns
 */
$(document).ready(function() {
	/**
	 * 登陆按钮点击事件！
	 */
	$("#log_btn").click(function() {
		loginCheck();
	});

	/**
	 * 回车键点击事件！
	 */
	$('form').on('keypress', function(event) {
		if (event.keyCode == 13) {
			loginCheck();
		}
	});

	/**
	 * 登录验证！
	 */
	function loginCheck() {
		var name = $(".l_user").val();
		var pwd = $(".l_pwd").val();
		if (name == "" || name == null) {
			mizhu.alert('操作提醒', "用户名不能为空!");
			return;
		} else if (pwd == "" || pwd == null) {
			mizhu.alert('操作提醒', "密码不能为空!");
			return;
		} else {
			$.ajax({
				url : contextPath + "/spring/user/loginBtn",
				method : "post",
				data : {
					"name" : name,
					"pwd" : pwd
				},
				success : function(jsonStr) {
					var result = eval("(" + jsonStr + ")");
					if (result.status == 1) {
						// 登录成功！跳转登录界面！！
						location.href = contextPath + "/pre/Index.jsp";
					} else {
						mizhu.alert('操作提醒', result.message);
					}
				}
			});
		}
	}
	
});

