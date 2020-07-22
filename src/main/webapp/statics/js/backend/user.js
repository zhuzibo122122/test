/**
 * 用户列表删除点击事件！
 */
function delUser(id,currentPage) {
	mizhu.confirm('温馨提醒', '要删除该用户吗？','确认', '取消', function(flag) {
		if (flag) {
			//alert(id + "\t" + currentPage);
			//使用ajax
			$.ajax({
				url			:		contextPath+"/spring/user/del",
				method		:		"post",
				data		:		{
					id	   : id,
					currentPage : currentPage   //在哪一页进行操作
				},
				success		:		function(data){
					var json = eval('('+data+')');
					//判断
					if(json.status == 1){
						mizhu.toast("操作成功!",1200);
						//重新加载用户显示页面
						$(".m_right").load(contextPath+"/spring/user/user .m_right>*","currentPage="+currentPage);
					}else{
						mizhu.toast(json.message,1200);
					}
				}
			});
		}
	})
}
/**
 * 点击修改
 * @param id
 * @returns
 */
function updateByUserId(id,currentPage) {
	var ise = {"id" : id,"currentPage":currentPage};
	$(".m_right").load(contextPath + "/spring/user/toUpdateUser .m_right>*",ise);
}
/**
 * 点击添加
 * @returns
 */
function addUser() {
	$(".m_right").load(contextPath + "/spring/user/add .m_right>*");
}