package com.dxd.controller.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dxd.pojo.EasybuyNews;
import com.dxd.service.news.NewsService;
import com.dxd.utils.Pager;


/**
 * 新闻资讯列表控制层！
 * Servlet implementation class AdminNewsServlet
 */
@Controller
public class AdminNewsServlet{
	
	@Autowired
	private NewsService nsi;
	/**
	 * 获取资讯列表信息！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="queryNewsList")
	public String queryNewsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int currentPage = 1;  //默认显示第一页
		//判断是否用户指定参数
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//得到总记录数
		int count = nsi.getTotalCount();
		//创建pager对象
		Pager pager = new Pager(count,10,currentPage);
		//设置url
		pager.setUrl("spring/queryNewsList");
		//得到所有咨询
		List<EasybuyNews> list = nsi.queryNewsList(pager);
		
		//存储到request中
		request.setAttribute("newsList", list);
		request.setAttribute("pager", pager);
		return "/backend/news/newsList";
	}
	
   
	
	/**
	 * 新闻详情！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="newsDeatil")
	public String newsDeatil(HttpServletRequest request,HttpServletResponse response)throws Exception{
		int id = Integer.parseInt(request.getParameter("newsId"));
		//得到当前新闻详情
		EasybuyNews news = nsi.findNewsById(id);
		//存储到request中
		request.setAttribute("news", news);
		return "/backend/news/newsDetail";
	}
}
