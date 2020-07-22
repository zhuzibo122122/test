function addCart(userId,flag) {
	var entityId = $("input[name='entityId']").val();  //商品id
	var quantity = $("input[name='quantity']").val();	//商品数量
	// 添加到购物车
	addCartByParam(entityId, quantity,userId,flag);
}
/**
 * 商品列表页添加到购物车
 * 
 * @param entityId
 * @param quantity
 */
function addCartByParam(entityId, quantity,userId,flag) {
	//alert(userId);
	//判断用户是否登录,
	if(userId != ""){  //已登录
		// 添加到购物车
		$.ajax({
			url : contextPath + "/spring/add",
			method : "post",
			data : {
				productId : entityId,
				num : quantity,
				userId: userId,
				flag  : flag
			},
			success : function(jsonStr) {
				var result = eval("(" + jsonStr + ")");
				// 状态判断
				if (result.status == 1) {
					mizhu.alert('操作提醒', "添加成功！");
					//刷新购物车
					refreshCart(userId,flag);
				} else {
					if(result.message!="商品数量不足"){
						mizhu.confirm('温馨提醒', result.message, '去登录', '先逛逛', function(
								flag) {
							if (flag) {
								location.href = contextPath+ "/pre/Login.jsp";
							}
						});
					}else{
						mizhu.alert('操作提醒',result.message);
					}
					

				}
			}
		});
	}else{  //未登录
		mizhu.toast("您还未登录!",1200);
	}
	
}

/**
 * 刷新购物车 searchBar DIV
 */
function refreshCart(userId,flag) {
	//alert(flag);
	$.ajax({
		url : contextPath + "/spring/refreshCart",
		method : "post",
		data : {
			userId : userId,
			flag   : flag
		},
		success : function(jsonStr) {
			$("#searchBar").html(jsonStr);
		}
	})
}

/**
 * 结算 加载购物车列表
 */
function settlement1(userId,flag) {
	$.ajax({
		url : contextPath + "/spring/settlement1",
		method : "post",
		success : function(jsonStr) {
			refreshCart(userId,flag);
			$("#settlement").html(jsonStr);
		}
	});
}

/**
 * 结算 形成预备订单
 */
function settlement2(userId) {
	$.ajax({
		url : contextPath + "/spring/settlement2",
		method : "post",
		data : {
			userId:userId
		},
		success : function(jsonStr) {
			$("#settlement").html(jsonStr);
		}
	});
}
/**
 * 结算 订单支付提醒
 */
function settlement3() {
	// 判断地址
	var addressId = $("input[name='selectAddress']:checked").val();
	var newAddress = $("input[name='address']").val();
	var newRemark = $("input[name='remark']").val();
	if (addressId == "" || addressId == null) {
		mizhu.alert('操作提醒',"请选择收货地址");
		return;
	} else if (addressId == "-1") {
		if (newAddress == "" || newAddress == null) {
			mizhu.alert('操作提醒',"请填写新的收货地址");
			return;
		} else if (newAddress.length <= 2 || newAddress.length >= 50) {
			mizhu.alert('操作提醒',"收货地址为3-50个字符");
			return;
		}
	}
	var item = {
		"addressId" : addressId,
		"newAddress" : newAddress,
		"newRemark" : newRemark
	};
	$.post(contextPath + "/spring/settlement3", item, function(jsonStr) {
		if (jsonStr.substr(0, 1) == "{") {
			var result = eval("(" + jsonStr + ")");
			mizhu.alert('操作提醒',result.message);
		} else {
			$("#settlement").html(jsonStr);
		}
	});
}
/**
 * 商品详情页的 数量加
 * 
 * @param obj
 * @param entityId
 */
function addQuantity(quantity,index,userId,productId) {
	//使用ajax
	$.ajax({
		url 		:		contextPath+"/spring/addNum",
		method		:		"post",
		data		:		{
			index : index,
			quantity :	quantity,
			userId: userId,
			productId:productId
		},
		success		:	function(data){
			//如果为-1,则继续购物
			var json = eval('('+data+')');
			//alert(json.status);
			settlement1(userId,json.status);
		}
	});
}
/**
 * 减去 数量减
 * 
 * @param obj
 * @param entityId
 */
function subQuantity(quantity,index,userId,productId) {
	//判断商品的数量是不是1,如果是1则不能减少
	if(quantity == "1"){
		mizhu.toast("商品数量不能少于1",1200);
	}else{
		//使用ajax
		$.ajax({
			url 		:		contextPath+"/spring/jianNum",
			method		:		"post",
			data		:		{
				index : index,
				quantity :	quantity,
				userId: userId,
				productId:productId
			},
			success		:	function(data){
				//如果为-1,则继续购物
				var json = eval('('+data+')');
				//alert(json.status);
				settlement1(userId,json.status);
			}
		});
	}
}
/**
 * 修改购物车列表
 * 
 * @param entityId
 * @param quantity
 */
function modifyCart(entityId, quantity, obj) {
	$.ajax({
		url : contextPath + "/spring/modCart",
		method : "post",
		data : {
			entityId : entityId,
			quantity : quantity
		},
		success : function(jsonStr) {
			var result = eval("(" + jsonStr + ")");
			// 状态判断
			if (result.status == 1) {
				obj.parent().find(".car_ipt").val(quantity);
				settlement1();
			} else {
				mizhu.alert('操作提醒',result.message);
			}
		}
	});
}
/**
 * 清空购物车
 */
function clearCart() {
	$.ajax({
		url : contextPath + "/spring/clearCart",
		method : "post",
		success : function(jsonStr) {
			$("#settlement").html(jsonStr);
			mizhu.alert('操作提醒',"操作成功");
		}
	});
}
/**
 * 删除购物车
 * 
 * @param entityId
 */
function removeCart(userId,productId,index) {
	$.ajax({
		url : contextPath + "/spring/modCart",
		method : "post",
		data : {
			index : index,
			userId:userId,
			productId:productId
		},
		success : function(jsonStr) {
			var result = eval("(" + jsonStr + ")");
			// 状态判断
			if (result.status == 1) {
				//刷新购物车
				settlement1(userId,1);
				//刷新页面
				location.reload();
			} else {
				mizhu.alert('操作提醒', result.message);
				
			}
		}
	});
}


/**
 * 收藏
 */
function addFavorite(th,id,a) {
	
	if(a == ""){
		mizhu.toast("您还没有登录!",1200);
	}else{
		var item = {
				"type" : 0,
				"id" : id,
				"userId" : a
			};
			$.post(contextPath + "/spring/addCollect", item, function(jsonStr) {
				var result = eval("(" + jsonStr + ")");
				if (result.status == 1) {
					//alert("收藏成功!");
					mizhu.alert('操作提醒', "收藏成功！");
					if(result.message=="收藏成功"){
						$(th).css("background-image", "url("+contextPath+"/statics/images/heart_h.png)");
						//location.reload();
					}else{
						$(th).css("background-image", "");
					}

				} else {
					if(result.message=="该商品已在收藏夹！"){
						mizhu.alert('操作提醒', result.message);
					}else{
						mizhu.confirm('温馨提醒', result.message, '去登录', '先逛逛', function(
								flag) {
							if (flag) {
								location.href = contextPath+ "/pre/Login.jsp";
							}
						});
					}
				}
			});
	}
}

/**
 * 删除收藏
 */
function delFavorite(th,id,a,flag) {
		var item = {
			"type" : 0,
			"id" : id,   //商品id
			"userId" : a   //用户id
		};
		$.post(contextPath + "/spring/delCollect", item, function(jsonStr) {
			var result = eval("(" + jsonStr + ")");
			if (result.status == 1) {
				//mizhu.toast(result.message, 1200);
				//mizhu.alert('操作提醒', "移除收藏成功！");
				if(result.message=="移除成功!"){
					$(th).css("background", "url("+contextPath+"/statics/images/heart.png) no-repeat left center");
					//重新加载用户收藏
					//判断是跳回收藏页还是详情页
					if(flag == 0){//收藏页
						//location.href=contextPath+"/ProductServlet?action=queryProductList4&userId="+a;
						location.reload();
					}else{//详情页
						location.href=contextPath+"/spring/product/queryProductDeatil?userId="+a+"&id="+id;
					}
					
					//location.reload();
				}else{
					$(th).css("background", "url("+contextPath+"/statics/images/heart_h.png) no-repeat left center");
				}
			}
		});
}



