/**
 * 绑定商品分类删除点击事件！
 */
 function delCategory(type,id,currentPage) {
	 mizhu.confirm('温馨提醒', '要删除该分类吗？',"确定","取消", function(flag) {
			if(flag) {
				$.ajax({
					"url" : contextPath + "/spring/delCategory",
					"data" : {
						"type":type,
						"id" : id
					},
					"method" : "post",
					"success" : function(data) {
						var result = eval("(" + data + ")");
						// 删除成功与否弹出信息！
						mizhu.alert('操作提醒', result.message);
						if (result.status == 1) {
							//alert(currentPage);
							var ise={"currentPage":currentPage};
							$(".m_right").load(contextPath+"/spring/category .m_right>*",ise);
						}
					}
				});
				
			}
		});
	
};

/**
 * 添加分类
 * 
 * @returns
 */
function toAddProductCategory(currentPage) {
	$("#AddProductCategory").load(contextPath + "/spring/AddProductCategory","currentPage="+currentPage);
}
/**
 * 分类级别change事件！
 */
function selectProductCategoryLevel(odd) {
	var ood = $(odd).val();
	if (ood == 3) {
		$("#productCategoryLevel2").parent().parent().show();
		$("#productCategoryLevel1").parent().parent().show();
	} else if (ood == 2) {
		$("#productCategoryLevel2").parent().parent().hide();
		$("#productCategoryLevel1").parent().parent().show();
	} else {
		$("#productCategoryLevel1").parent().parent().hide();
		$("#productCategoryLevel2").parent().parent().hide();
	}
}
/**
 * 显示二级分类！
 */
function queryProductCategoryList(onedd) {
	var ood = $(onedd).val();

	var item = {
		"parentId" : ood
	};
	$("#productCategoryLevel2").load(contextPath+ "/spring/addCategoryLevel2 #productCategoryLevel2>*",item);
}

/**
 * 新增！
 * @returns
 */
function saveinsert() {
	var type = $("#type").val();
	var parentId = 0;
	var name = $("#name").val();
	if (name == "") {
		mizhu.alert('操作提醒', "请输入分类名称！");
		return;
	}

	if (type == 1) {
		parentId = 0;

	} else if (type == 2) {
		parentId = $("#productCategoryLevel1").val();
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择父分类！");
			return;
		}
	} else if (type == 3) {

		parentId = $("#productCategoryLevel2").val();
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择父分类！");
			return;
		}
	}else{
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择分类级别！");
			return;
		}
	}
	var item = {
		"name" : name,
		"parentId" : parentId,
		"type" : type
	};
	$.post(contextPath + "/spring/addCategory", item, function(data) {
		var result = eval("(" + data + ")");
		// 添加成功与否弹出信息！
		mizhu.alert('操作提醒', result.message);
		if (result.status == 1) {
			var currentPage=$("#currentPage").val();
			var ise={"currentPage":currentPage};
			$(".m_right").load(contextPath+"/spring/category .m_right>*",ise);
		}
	});
}
/**
 * 更新！
 * @returns
 */
function saveOrUpdate() {
	//alert($("#currentPage").val());
	var id=$("#id").val();
	var type = $("#type").val();
	var parentId = 0;
	var name = $("#name").val();
	if (name == "") {
		mizhu.alert('操作提醒',"请输入分类名称！");
		return;
	}

	if (type == 1) {
		parentId = 0;

	} else if (type == 2) {
		parentId = $("#productCategoryLevel1").val();
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择父分类！");
			return;
		}
	} else if (type == 3) {

		parentId = $("#productCategoryLevel2").val();
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择父分类！");
			return;
		}
	}else{
		if (parentId == 0) {
			mizhu.alert('操作提醒',"请选择分类级别！");
			return;
		}
	}
	var item = {
			"id":id,
			"name" : name,
			"parentId" : parentId,
			"type" : type
		};
	$.post(contextPath + "/spring/insertCategory", item, function(data) {
		var result = eval("(" + data + ")");
		// 更新成功与否弹出信息！
		mizhu.alert('操作提醒',result.message);
		if (result.status == 1) {
			var currentPage=$("#currentPage").val();
			var ise={"id":id,"currentPage":currentPage};	
			$(".m_right").load(contextPath+"/spring/category .m_right>*",ise);
		}

	});
	
}

/**
 * 根据Id修改商品信息！！
 * @param tid
 * @returns
 */
function update(tid,currentPage) {
	var item={"id":tid,"currentPage":currentPage};
	$("#AddProductCategory").load(contextPath + "/spring/upProductCategory",item);
} 

