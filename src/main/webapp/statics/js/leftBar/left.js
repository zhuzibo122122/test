/**
 * 点击左侧替换右侧M_rightDiV层！
 * @param thisBiao
 * @param url
 * @returns
 */
function clickLeft(thisBiao,url) {
	// 移除所有类样式！
	$(".left_m ul>li>a").removeClass();
	// 添加类样式！
	$(thisBiao).addClass("now");
	$(".m_right").load(contextPath + "/"+url+" .m_right>*");
}