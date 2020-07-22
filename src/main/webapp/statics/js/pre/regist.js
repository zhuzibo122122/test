$(document)
	.ready(
		function() {

			// **********************昵称******************//
			$('#luser')
				.on(
					{
						'input propertychange' : function() {
							if (!checkNamea()) {
								$("#errName").slideDown(50);
							}
						},
						blur : function() {
							if (checkNamea()) {
								$("#errName").slideUp(50);
								$("#luser").css("border", "1px solid #cccccc");
							} else {
								$("#luser").css("border", "1px solid red");
								$("#errName").slideDown(50);
							}
						},
						focus : function() {

							if (checkNamea()) {
								$("#errName").slideUp(50);
								$("#errNullName")
									.css("background",
										"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
							}

							$("#luser").css("border",
								"1px solid #cccccc");
						}
					});
			/**
			 * 验证用户名是否存在
			 */
			function checkNamea() {
				// 获取用户输入的用户名！
				var name = $("#luser").val();
				var reg = /\s/;
				if (name == "" || name == null) {
					// 用户名为空事件！
					$("#errNullName")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					$("#errNullName").children().html("用户名不能为空");
					return false;
				} else if (reg.test(name)) {
					// 用户名包含空格事件！
					$("#errNullName")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					$("#errNullName").children().html("用户名不能包含空格");
					return false;
				} else {
					var check_res = false;
					// 获取用户输入的用户名！
					var name = $("#luser").val();
					// 拼接参数！
					var item = {
						"action" : "loginNameCount",
						"name" : name
					};
					// 异步请求！
					$.ajax({
							async : false,
							url : contextPath
								+ "/EasybuyUserServlet",
							data : item,
							type : "POST",
							success : function(jsonStr) {
								var count = eval("(" + jsonStr
									+ ")");
								if (count.status != 1) {
									// 用户名存在事件！
									$("#errNullName")
										.css("background",
											"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");

									$("#errNullName").children()
										.html(count.message);

									check_res = false;
								} else {
									// 用户名可用事件！
									$("#errNullName")
										.css("background",
											"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
									$("#errNullName").children()
										.html("用户名可用!");
									check_res = true;
								}
							}
						});
					return check_res;
				}
			}
			// ********************昵称end******************//

			// **********************密码******************//
			/**
			 * 验证密码
			 */
			$("#pwd").on({
				'input propertychange' : function() {
					var pwd = $("#pwd").val();
					checkLen(pwd);
					checkNull(pwd);
				},
				blur : function() {
					var pwd = $("#pwd").val();
					if (checkNull(pwd)) {
						$("#err").slideUp(50);
					}
					if (checkLen(pwd)) {
						$("#err1").slideUp(50);
					}
				},
				focus : function() {
					$("#err1").slideDown(50);
					$("#err").slideDown(50);
					$("#pwd").css("border", "1px solid #cccccc");
				}
			});
			/**
			 * 验证字符串中是否包含空格！
			 */
			function checkNull(pwd) {
				var reg = /\s/;
				if (reg.test(pwd)) { // 验证字符串中是否包含空格！
					$("#lengt")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					$("#pwd").css("border", "1px solid red");
					return false;
				} else {
					$("#lengt")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$("#pwd").css("border", "1px solid #cccccc");
					return true;
				}
			}
			/**
			 * 验证密码长度
			 */
			function checkLen(pwd) {
				if (pwd.length < 6) { // 验证密码长度
					$("#leng")
						.css("background",
							"url(/EasyBuy/statics/images/info.png) no-repeat left 5px");
					$("#pwd").css("border", "1px solid red");
					return false;
				} else {
					$("#leng")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$("#pwd").css("border", "1px solid #cccccc");
					return true;
				}
			}
			/**
			 * 验证两次输入密码是否一致
			 */
			function eqPwd() {
				var pwd = $("#pwd").val();
				var passworded = $("#l_pwd").val();
				if (passworded == null || passworded == ""
					|| pwd == null || pwd == "") {
					$("#errEqPwd").children().html("请输入密码！");
					$("#errEqPwd")
						.css("background",
							"url(/EasyBuy/statics/images/info.png) no-repeat left 5px");
					return false;
				}
				if (pwd == passworded) {
					$("#errEqPwd")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$("#l_pwd").css("border", "1px solid #cccccc");
					return true;
				} else {
					$("#errEqPwd")
						.css("background",
							"url(/EasyBuy/statics/images/info.png) no-repeat left 5px");
					$("#errEqPwd").children().html("两次输入密码一致");
					return false;
				}
			}
			$("#l_pwd").on({
				'input propertychange' : function() {
					eqPwd();
				},
				blur : function() {
					if (eqPwd()) {
						$("#errPwd").slideUp(50);
					} else {
						$("#l_pwd").css("border", "1px solid red");
					}
				},
				focus : function() {
					eqPwd();
					$("#errPwd").slideDown(50);
					$("#l_pwd").css("border", "1px solid #cccccc");
				}
			});

			// **********************密码******************//
			// **********************真实姓名******************//
			function checkNumName(name) {
				if (name == null || name == "") {
					$("#errNullNum")
						.css("background",
							"url(/EasyBuy/statics/images/info.png) no-repeat left 5px");
					$(".l_num").css("border", "1px solid red");

					return false;
				} else {
					$("#errNullNum")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$(".l_num").css("border", "1px solid #cccccc");
					return true;
				}
			}
			$(".l_num").blur(function() {
				var numName = $(".l_num").val();
				if (checkNumName(numName)) {
					$("#errNum").slideUp(50);
				} else {
					$("#errNum").slideDown(50);
				}
			});
			$(".l_num").focus(function() {
				$("#errNum").slideDown(50);
				$(".l_num").css("border", "1px solid #cccccc");
			});
			$(".l_num").on('input propertychange', function() {
				var numName = $(".l_num").val();
				checkNumName(numName);
			});

			// ********************真实姓名end******************//
			// ********************身份证******************//
			$(".l_mem").on({
				'input propertychange' : function() {
					var mem = $(".l_mem").val();
					checkLenMem(mem);

				},
				blur : function() {
					var mem = $(".l_mem").val();
					if (checkLenMem(mem)) {

						$("#errMem").slideUp(50);
					} else {
						$(".l_mem").css("border", "1px solid red");
					}
				},
				focus : function() {
					$("#errMem").slideDown(50);
					$(".l_mem").css("border", "1px solid #cccccc");
				}
			});

			function checkLenMem(mem) {
				if (mem.length != 18 || !checkIdentityCode(mem)) { // 验证身份证长度
					$("#errNullMem1")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					return false;
				} else {
					$("#errNullMem1")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$(".l_mem").css("border", "1px solid #cccccc");
					return true;
				}
			}
			;

			// ********************身份证end******************//
			// ********************邮箱******************//
			$(".l_email").on({
				'input propertychange' : function() {
					var mem = $(".l_email").val();
					checkNullEmail(mem);

				},
				blur : function() {
					var mem = $(".l_email").val();
					if (checkNullEmail(mem)) {

						$("#errEmail").slideUp(50);
					} else {
						$(".l_email").css("border", "1px solid red");
					}
				},
				focus : function() {
					$("#errEmail").slideDown(50);
					$(".l_email").css("border", "1px solid #cccccc");
				}
			});

			function checkNullEmail(mem) {
				if (mem == null || mem == "" || !checkEamil(mem)) { // 验证邮箱格式
					$("#errNullEmail")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					return false;
				} else {
					$("#errNullEmail")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$(".l_email").css("border", "1px solid #cccccc");
					return true;
				}
			}
			;

			// ********************邮箱end******************//
			// ********************手机******************//
			$(".l_tel").on({
				'input propertychange' : function() {
					var mem = $(".l_tel").val();
					checkNullTel(mem);

				},
				blur : function() {
					var mem = $(".l_tel").val();
					if (checkNullTel(mem)) {

						$("#errTel").slideUp(50);
					} else {
						$(".l_tel").css("border", "1px solid red");
					}
				},
				focus : function() {
					$("#errTel").slideDown(50);
					$(".l_tel").css("border", "1px solid #cccccc");
				}
			});

			function checkNullTel(mem) {
				if (mem == null || mem == "" || !checkMobile(mem)) { // 验证手机格式
					$("#errNullTel")
						.css("background",
							"url(/EasyBuy/statics/images/errorpwd.png) no-repeat left 5px");
					return false;
				} else {
					$("#errNullTel")
						.css("background",
							"url(/EasyBuy/statics/images/green.png) no-repeat left 5px");
					$(".l_tel").css("border", "1px solid #cccccc");
					return true;
				}
			}
			;

			// ********************手机end******************//
			/**
			 * 回车键点击事件！
			 */
			$('form').on('keypress', function(event) {
				if (event.keyCode == 13) {
					regst();
				}
			});
			/**
			 * 立即注册按钮点击事件！
			 */
			$("#Reg_btn").click(function() {
				regst();
			});
			function regst() {
				// 获取用户需要注册的数据！
				var name = $(".l_user").val();
				var pwd = $("#pwd").val();
				var passworded = $("#l_pwd").val();
				var numName = $(".l_num").val();
				var sex = $("input[name='ra']:checked").val();
				var mem = $(".l_mem").val();
				var email = $(".l_email").val();
				var phone = $(".l_tel").val();
				/* 非空验证 */
				if (!checkNamea()) {
					$("#errName").slideDown(50);
					return;
				} else if (!checkNull(pwd)) {
					$("#err").slideDown(50);
					return;
				} else if (!checkLen(pwd)) {
					$("#err1").slideDown(50);
					return;
				} else if (!eqPwd()) {
					$("#errPwd").slideDown(50);
					$("#l_pwd").css("border", "1px solid red");
					return;
				} else if (!checkNumName(numName)) {
					$("#errNum").slideDown(50);
					return;
				} else if (!checkLenMem(mem)) {
					$("#errMem").slideDown(50);
					return;
				} else if (!checkNullEmail(email)) {
					$("#errEmail").slideDown(50);
					return;
				} else if (!checkNullTel(phone)) {
					$("#errTel").slideDown(50);
					return;
				} else {

					// 判断验证码是否输入！
					if (validate()) {
						var item = {
							"action" : "addUser",
							"name" : name,
							"password" : pwd,
							"numName" : numName,
							"sex" : sex,
							"mem" : mem,
							"email" : email,
							"phone" : phone,
						};
						$
							.post(
								contextPath
								+ "/EasybuyUserServlet",
								item,
								function(jsonStr) {
									var result = eval("("
										+ jsonStr + ")");
									mizhu.toast(result.message,
										1000);
									if (result.status == 1) {
										// 注册成功！跳转登录界面！！
										var time = setTimeout(
											function() {
												location.href = contextPath
													+ "/pre/Login.jsp";
											}, 1200);
									}
								});
					}

				}
			}

			/**
			 * 验证邮箱正则表达式！
			 */
			function checkEamil(eamil) {
				var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if (reg.test(eamil)) {

					return true;
				} else {
					return false;
				}
			}

			/**
			 * 验证手机号码正则表达式！
			 */
			function checkMobile(phone) {
				var reg = /^\d{5,11}$/;
				if (reg.test(phone)) {
					return true;
				} else {
					return false;
				}
			}

			/**
			 * 验证身份证号码正则表达式！
			 */
			function checkIdentityCode(mem) {
				var reg = /^\w{18}$/;
				if (reg.test(mem)) {
					return true;
				} else {
					return false;
				}
			}
         //选中时触发
			$("#txt")
				.click(
					function() {
						if (this.checked) {
							$("#Reg_btn")
								.css("background",
									"url(../statics/images/btn_log.gif) repeat-x center top");
							$("#Reg_btn")
								.removeAttr("disabled");
						} else {
							$("#Reg_btn")
								.css("background",
									"url(../statics/images/s_line.gif) repeat-x center top");
							$("#Reg_btn").attr("disabled",
								"disabled");
						}
					});

		});

/**
 * 获取验证码！
 * 
 * @returns
 */
function createCode() {
	code = "";
	var codeLength = 4; // 验证码的长度
	var checkCode = document.getElementById("code");
	var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D',
		'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); // 随机数
	for (var i = 0; i < codeLength; i++) { // 循环操作
		var index = Math.floor(Math.random() * 36); // 取得随机数的索引（0~35）
		code += random[index]; // 根据索引取得随机数加到code上
	}
	checkCode.value = code; // 把code值赋给验证码
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
		createCode(); // 刷新验证码
		document.getElementById("input").value = ""; // 清空文本框
		return false;
	}
	return true;
}