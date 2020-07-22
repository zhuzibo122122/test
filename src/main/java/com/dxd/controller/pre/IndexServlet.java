package com.dxd.controller.pre;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dxd.pojo.EasybuyNews;
import com.dxd.pojo.EasybuyProduct;
import com.dxd.pojo.EasybuyProductCategory;
import com.dxd.service.news.NewsService;
import com.dxd.service.product.ProductCategoryService;
import com.dxd.service.product.ProductService;
import com.dxd.utils.Pager;


/**
 * Servlet implementation class IndexServlet
 */
@Controller
public class IndexServlet{
	@Autowired
	private ProductCategoryService pcsi;
	@Autowired
	private NewsService nsi;
	@Autowired
	private ProductService psi;
	/**
	 * 主页面加载
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toIndex")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//加载全部商品信息
		List<EasybuyProduct> productList = psi.getEasybuyProductList();
		//创建分页工具对象
		Pager pager = new Pager(nsi.getTotalCount(),5,1);
		List<EasybuyNews> newsList = nsi.queryNewsList(pager);
		//加载分类
		List<EasybuyProductCategory> list = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//存到request作用域中
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("newsList", newsList);
		request.setAttribute("productList", productList);
		
		return "/pre/Index";
	}
}
