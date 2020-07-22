function clicks(url,currentPage) {
	$(".list_c").load(contextPath + "/"+url+" .list_c>*","currentPage="+currentPage);
}