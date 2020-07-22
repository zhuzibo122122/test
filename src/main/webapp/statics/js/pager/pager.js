function clicks(url,currentPage) {
	$(".m_right").load(contextPath + "/"+url+" .m_right>*","currentPage="+currentPage);
}
function newsClick(url,tid) {
	$(".m_right").load(contextPath + "/"+url+" .m_right>*","id="+tid);
}