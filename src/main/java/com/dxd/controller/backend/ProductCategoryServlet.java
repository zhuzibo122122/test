package com.dxd.controller.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.dxd.pojo.EasybuyProductCategory;
import com.dxd.service.product.ProductCategoryService;
import com.dxd.utils.Pager;
import com.dxd.utils.PrintUtils;
import com.dxd.utils.ReturnResult;

/**
 * 商品管理控制层！ Servlet implementation class ProductCategoryService
 */
@Controller
public class ProductCategoryServlet{
	@Autowired
	private ProductCategoryService pcsi;
	/**
	 * 获取所有分类信息！
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@RequestMapping(value="category")
	public String category(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int currentPage = 1; //默认显示第一页
		//判断是否有参数currentPage
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowCount = pcsi.getTotalCount(); //获得总记录数
		//创建pager对象
		Pager pager = new Pager(rowCount,10,currentPage);
		//设置url
		pager.setUrl("spring/category");
		//得到所以分类集合
		List<EasybuyProductCategory> list = pcsi.getEasybuyProductCategoryAll(pager);
		EasybuyProductCategory pro = null;
		//循环遍历分类集合,给对象添加父分类名
		for(int i=0;i<list.size();i++){
			pro = list.get(i);
			//判断是否是一级分类
			if(pro.getParentId() != 0){
				pro.setParentName(pcsi.getParentName(pro.getParentId()));
			}
		}
		//存储到request中
		request.setAttribute("listCategory",list);
		request.setAttribute("pager", pager);
		return "/backend/user/Member_Money";
	}

	/**
	 * 删除/修改成功后返回分类列表！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="ac")
	public String ac(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/user/Member_Money";
	}

	/**
	 * 删除分类信息！
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@RequestMapping(value="delCategory",method = RequestMethod.POST)
	public void delCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id")); //需要删除分类的id
		ReturnResult result = new ReturnResult();
		//判断该分类下是否存在子分类
		int count = pcsi.checkCategorybyChild(id);
		if(count > 0){  //存在子分类,
			result.returnFail("该分类下存在子分类,不能删除!");
		}else{//不存在子分类
			//判断该分类下是否存在商品
			int count2 = pcsi.checkProductByCategoryId(id);
			if(count2 > 0){
				result.returnFail("该分类下存在商品,不能删除!");
			}else{//不存在商品
				//执行删除
				int count3 = pcsi.deleteEasybuyProductCategoryById(id);
				if(count3 > 0){
					result.returnSuccess("删除分类成功!");
				}else{
					result.returnFail("删除分类失败!");
				}
			}
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 添加分类！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="AddProductCategory")
	public String AddProductCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//显示所有一级分类
		List<EasybuyProductCategory> proList1 = pcsi.getProductCategoryListOne();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		request.setAttribute("productCategoryList1", proList1);
		request.setAttribute("currentPage",currentPage);
		return "/backend/category/toAddProductCategory";
	}

	/**
	 * 显示二级分类！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addCategoryLevel2")
	public String addCategoryLevel2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int parentId = Integer.parseInt(request.getParameter("parentId"));  //一级分类id
		//查询该一级分类下的所有二级分类
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListByparentId(2, parentId);
		request.setAttribute("productCategoryList2", list2);
		return "/backend/category/toAddProductCategory";
	}

	/**
	 * 添加分类根据一级分类获取二级分类信息！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="getProductCategoryTwo")
	public String getProductCategoryTwo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//父类id
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int type = 2; //二级分类
		//得到二级分类
		List<EasybuyProductCategory> list = pcsi.getProductCategoryListByparentId(type, parentId);
		request.setAttribute("listTwo", list);
		return "/backend/product/toAddProduct";
	}

	/**
	 * 添加分类根据二级分类获取三级分类信息！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="getProductCategoryThree")
	public String getProductCategoryThree(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//父类id
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int type = 3; //三级分类
		//得到三级分类
		List<EasybuyProductCategory> list = pcsi.getProductCategoryListByparentId(type, parentId);
		request.setAttribute("listThree", list);
		return "/backend/product/toAddProduct";
	}
	/**
	 * 添加新的分类
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addCategory",method = RequestMethod.POST)
	public void addCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int type = Integer.parseInt(request.getParameter("type"));
		//创建分类对象
		EasybuyProductCategory pro = new EasybuyProductCategory();
		pro.setName(name);
		pro.setParentId(parentId);
		pro.setType(type);
		//判断该分类名是否重复
		int count = pcsi.checkCategoryName(name);
		ReturnResult result = new ReturnResult();
		if(count > 0){ //存在重复
			result.returnFail("该分类名已经存在!");
		}else{
			//添加分类
			int count2 = pcsi.addNewCategory(pro);
			if(count2 > 0){
				result.returnSuccess("添加分类成功!");
			}else{
				result.returnFail("添加分类失败!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}
	/**
	 * 修改分类信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="insertCategory",method = RequestMethod.POST)
	public void insertCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));  //需要修改的分类id
		String name = request.getParameter("name"); //分类名
		int parentId = Integer.parseInt(request.getParameter("parentId")); //父类id
		int type = Integer.parseInt(request.getParameter("type"));  //类型
		//创建分类对象
		EasybuyProductCategory pro = new EasybuyProductCategory();
		pro.setId(id);
		pro.setName(name);
		pro.setParentId(parentId);
		pro.setType(type);
		ReturnResult result = new ReturnResult();
		//判断用户是否未修改分类名
		EasybuyProductCategory proOld = pcsi.getProductCategoryById(id); //得到当前未修改的商品信息
		//判断该分类名是否重复
		int count1 = pcsi.checkCategoryName(name);
		if(count1 > 0 && !proOld.getName().equals(name)){
			result.returnFail("该分类名已经存在!");
		}else{
			int count = pcsi.insertEasybuyProductCategory(pro);
			if(count > 0){
				result.returnSuccess("修改分类成功!");
			}else{
				result.returnFail("修改分类失败!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 修改商品分类！
	 * @param reuest
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="upProductCategory")
	public String upProductCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id")); //分类id
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//得到指定分类信息
		EasybuyProductCategory pro = pcsi.getProductCategoryById(id);
		//查询所有一级分类
		List<EasybuyProductCategory> proList1 = pcsi.getProductCategoryListOne();
		//当修改分类为3级时,得到当前三级分类的二级父节点
		List<EasybuyProductCategory> proList2 = new ArrayList<>();
		proList2.add(pcsi.getProductCategoryById(pro.getParentId()));
		
		request.setAttribute("productCategoryList1", proList1);
		request.setAttribute("productCategoryList2", proList2);
		request.setAttribute("productCategory", pro);
		request.setAttribute("currentPage", currentPage);
		return "/backend/category/toAddProductCategory";

	}
}
