/**
 * 点击修改事件
 * @param id
 * @param currentPage
 * @returns
 */
function updateByProductId(id, currentPage) {
	$(".left_m ul>li>a").removeClass();
	var ise = {
		"id" : id,
		"currentPage" : currentPage
	};
	$(".m_right").load(contextPath + "/spring/product/getProduct .m_right>*", ise);
}

/**
 * 商品上架/修改商品 点击事件！
 * 
 * @returns
 */
function checkProduct() {
	// 获取ID判断用户是修改还是删除！
	var id = $("#id").val();
	// 获取用户需要上架的数据！
	var one = $("#productCategoryLevel1").val();
	var two = $("#productCategoryLevel2").val();
	var three = $("#productCategoryLevel3").val();
	// 获取图片路径名称！
	var img = $("#img").attr("src");

	var name = $("#name").val();
	var imgval = $("#fiel").val();
	var price = $("#price").val();
	var stock = $("#stock").val();
	var description = $("#description").val();
	/* 非空验证 */
	if (name == "" || name == null) {
		mizhu.alert('操作提醒', "商品名称不能为空！");
		return false;
	} else if (price == "" || price == null) {
		mizhu.alert('操作提醒', "请输入单价哎！！");
		return false;
	} else if (stock == "" || stock == null) {
		mizhu.alert('操作提醒', "请输入库存哎！！");
		return false;
	}else if(one==0){
		mizhu.alert('操作提醒', "请选择一级分类！");
		return false;
	}else if(two==0){
		mizhu.alert('操作提醒', "请选择二级分类！");
		return false;
	}else if(three==0){
		mizhu.alert('操作提醒', "请选择三级分类！");
		return false;
	}
	var formData = new FormData($("#productAdd")[0]);
	formData.append('file', $('#fiel')[0].files[0]);
	//添加商品
	if(id == ""){
		//判断是否上传文件
		var fileInput = $('#fiel').get(0).files[0];
		//console.info(fileInput);
		if(!fileInput){
			mizhu.alert('操作提醒', "请上传文件!");
			return false;
		}
	}else{ //修改
		//截取旧图片名字
		var filename = img.substring(16);
		var fileInput = $('#fiel').get(0).files[0]; 
		//判断是否上传新的文件
		if(!fileInput){//没上传新的文件,不修改图片
			formData.append("fileName", filename); //添加属性
		}else{//上传新的文件
			alert("已上传");
		}
	}
	//alert(formData.get("file"));
	//console.log($('#fiel')[0].files[0]);
	//console.log(formData.get("file"));
	//console.log(formData.get("name"));
	$.ajax({
		url : contextPath + "/spring/product/getImgs",
		method : "post",
		data : formData,
		contentType : false,
		processData : false,
		success : function(data) {
			var result = eval("(" + data + ")");
			//添加是否成功判断
			if(result.message=="添加成功!") { //添加成功!
				mizhu.toast("操作成功",1500);
				//返回商品显示列表
				$(".m_right").load(contextPath+"/spring/product/index .m_right>*");
			}else if(result.message=="修改成功!"){ //修改成功
				mizhu.toast("操作成功",1500);
				//得到在哪一个修改
				var currentPage = $("#currentPage").val();
				//返回商品显示列表
				$(".m_right").load(contextPath+"/spring/product/index&currentPage="+currentPage+" .m_right>*");
			}else{
				mizhu.alert('操作提醒', "文件格式错误!只允许.jpg类型");
			}
		}
	});
}

/**
 * 选中一级分类获得二级分类对应信息！
 * 
 * @param thisId
 * @returns
 */
function change1() {
	// 获取当前标签的商品ID！
	var Id = $("#productCategoryLevel1").val();
	var item = {
		"parentId" : Id
	};
	$("#productCategoryLevel2").load(contextPath + "/spring/getProductCategoryTwo #productCategoryLevel2>*",item, leve2);
}

/**
 * 二级分类！
 * @returns
 */
function change2() {
	leve2();
}
/**
 * 选中二级分类获得三级分类对应信息！
 * 
 * @param thisId
 * @returns
 */
function leve2() {
	// 获取当前标签的商品ID！
	var Id = $("#productCategoryLevel2").val();
	var item = {
		"parentId" : Id
	};
	$("#productCategoryLevel3").load(
			contextPath + "/spring/getProductCategoryThree #productCategoryLevel3>*",
			item);
}


