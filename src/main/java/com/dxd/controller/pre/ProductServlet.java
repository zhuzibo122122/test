package com.dxd.controller.pre;

import java.io.IOException;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dxd.pojo.EasybuyCollect;
import com.dxd.pojo.EasybuyProduct;
import com.dxd.pojo.EasybuyProductCategory;
import com.dxd.pojo.EasybuyUser;
import com.dxd.service.order.CartService;
import com.dxd.service.product.ProductCategoryService;
import com.dxd.service.product.ProductService;
import com.dxd.utils.Pager;
import com.dxd.utils.PrintUtils;
import com.dxd.utils.ReturnResult;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * 商品信息控制层！
 * Servlet implementation class ProductServlet
 */
@Controller
@RequestMapping("product/")
public class ProductServlet{
	
	private static final long serialVersionUID = 1L;
	private static final String TMP_DIR_PATH = "D:\\tmp";
	private File tmpDir;
	private static final String DESTINATION_DIR_PATH = "/files";
	private File destinationDir;
	@Autowired
	private ProductService psi;
	@Autowired
	private CartService csi;
	@Autowired
	private ProductCategoryService pcsi;
	/**
	 * 查看商品列表  (后端)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int currentPage = 1; //默认第一页
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//获得所有商品条数
		int count = psi.getTotalCount();
		Pager pager = new Pager(count,10,currentPage);
		//设置pager URL
		pager.setUrl("spring/product/index");
		//得到所有商品
		List<EasybuyProduct> list = psi.getAllProduct(pager);
		//存储到request中
		request.setAttribute("productList", list);
		request.setAttribute("pager", pager);
		return "/backend/product/productList";
	}
	
	/**
	 * 修改商品信息！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateAndDel")
	public String updateAndDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/product/productList";
	}
	
	/**
	 * @param request
	 * @return
	 */
	private List<EasybuyCollect> getUserFromSession(HttpServletRequest request) {
		return null;
	}

	/**
	 * 获取一级分类！(模糊查询)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryProductList")
	public String queryProductList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rowCount = 0; //总信息条数
		int category = 0;
		//是否根据分类查询商品信息
		//得到条数默认得到所有条数
		rowCount = psi.getProductRowCount(category);
		if(null != request.getParameter("category") && Integer.parseInt(request.getParameter("category"))!= 0){
			category = Integer.parseInt(request.getParameter("category"));
			//得到该分类所有商品条数
			rowCount = psi.getProductRowCount(category);
		}
		String proName = ""; //判断用户是否模糊查询
		if(null != request.getParameter("keyWord")){
			proName = request.getParameter("keyWord");
			//得到模糊查询条数
			rowCount = psi.getmohuCount(proName);
		}
		int currentPage = 1;
		//判断当前页是否为空
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		Pager pager = new Pager(rowCount,8,currentPage);
		//判断用户是否登录/登录加载用户收藏
		if(null != request.getParameter("userId") && "" != request.getParameter("userId")){
			int userId = Integer.parseInt(request.getParameter("userId"));
			List<EasybuyCollect> collectList = csi.selectByUserId(userId);
			//存储到request中
			request.setAttribute("listCollect", collectList);
			pager.setUrl("spring/product/queryProductList?category="+category+"&userId="+userId);
		}else{
			pager.setUrl("spring/product/queryProductList?category="+category);
		}
		//得到所有商品
		List<EasybuyProduct> list = psi.getEasybuyProductListByCategoryId(category, pager,proName);

		//加载分类
		List<EasybuyProductCategory> list1 = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//存到request作用域中
		request.setAttribute("list", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("productList", list);
		request.setAttribute("pager", pager);
		//存储用户需要搜索的值
		request.setAttribute("keyWord", proName);
		//存储商品格式
		request.setAttribute("total", rowCount);
		
		return "/pre/product/queryProductList";
	}
	
	@RequestMapping("queryLikeProductList")
	public String queryLikeProductList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/pre/product/queryProductList";
	}
	

	/**
	 * 获取二级分类！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryProductList2")
	public String queryProductList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		int currentPage = 1;
		//判断当前页是否为空
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		Pager pager = new Pager(psi.getProductRowCount(category),8,currentPage);
		pager.setUrl("spring/product/queryProductList2?category="+category);
		//获得二级分类商品
		List<EasybuyProduct> proList = psi.getEasybuyProductListByCategoryId2(category, pager);
		//加载分类
		List<EasybuyProductCategory> list1 = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//判断用户是否登录
		if(null != request.getSession().getAttribute("easybuyUserLogin")){  //已登录 加载用户收藏
			int userId = ((EasybuyUser)request.getSession().getAttribute("easybuyUserLogin")).getId();
			//加载收藏
			List<EasybuyCollect> list = csi.selectByUserId(userId);
			//存储到request中
			request.setAttribute("listCollect", list);
		}
		//存到request作用域中
		request.setAttribute("list", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("productList", proList);
		request.setAttribute("pager", pager);
		return "/pre/product/queryProductList";
	}

	/**
	 * 获取三级分类！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryProductList3")
	public String queryProductList3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));  //三级分类id
		int currentPage = 1;
		//判断当前页是否为空
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		Pager pager = new Pager(psi.getProductRowCount(category),4,currentPage);
		pager.setUrl("spring/product/queryProductList3?category="+category);
		//得到三级分类商品
		List<EasybuyProduct> proList = psi.getEasybuyProductListByCategoryId3(category, pager);
		//加载分类
		List<EasybuyProductCategory> list1 = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//判断用户是否登录
		if(null != request.getSession().getAttribute("easybuyUserLogin")){  //已登录 加载用户收藏
			int userId = ((EasybuyUser)request.getSession().getAttribute("easybuyUserLogin")).getId();
			//加载收藏
			List<EasybuyCollect> list = csi.selectByUserId(userId);
			//存储到request中
			request.setAttribute("listCollect", list);
		}
		//存到request作用域中
		request.setAttribute("list", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("productList", proList);
		request.setAttribute("pager", pager);
		return "/pre/product/queryProductList";
	}
	
	
	/**
	 * 获得收藏夹
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryProductList4")
	public String queryProductList4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<EasybuyCollect> list = csi.selectByUserId(userId);  //获得该用户所有收藏
		List<EasybuyProduct> proList = new ArrayList<>();
		EasybuyProduct ebp = null;
		EasybuyCollect ec = null;
		//得到用户收藏的商品信息
		for(int i=0;i<list.size();i++){
			ebp = new EasybuyProduct();
			ec = list.get(i);
			ebp = psi.findById(ec.getProductId());
			proList.add(ebp);
		}

		//加载分类
		List<EasybuyProductCategory> list1 = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//存储到request作用域中
		request.setAttribute("list", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("productList", proList);
		request.setAttribute("listCollect", list);
		request.setAttribute("total", proList.size());
		
		return "/pre/product/queryProductList";
	}

	/**
	 * 获得热门商品详细信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("queryProductDeatil")
	public String queryProductDeatil(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id")); //商品编号
		EasybuyProduct ebp = psi.findById(id); //得到商品对象
		if("" != request.getParameter("userId") && null != request.getParameter("userId")){ //如果不是空的则是登录状态 加载用户的收藏夹
			int userId = Integer.parseInt(request.getParameter("userId")); //该用户id
			List<EasybuyCollect> list = csi.selectByUserId(userId); //获得该用户所有的收藏
			request.setAttribute("easybuyCollect", list);
		}
		//加载分类
		List<EasybuyProductCategory> list1 = pcsi.getProductCategoryListOne();
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListTwo();
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListThree();
		//存到request作用域中
		request.setAttribute("list", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("product", ebp);
		
		return "/pre/product/productDeatil";
	}

	/**
	 * 根据id删除商品！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	public void deleteById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productId = Integer.parseInt(request.getParameter("id")); //商品id
		int count = psi.delEasybuyProductById(productId);
		ReturnResult result = new ReturnResult();
		if(count > 0){ //删除成功!
			result.returnSuccess();
		}else{
			result.returnFail("删除失败!");
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 修改或者上架操作！
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ReturnResult tomodify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}

	/**
	 * 商品上架！
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("toAddUpdate")
	public String toAddUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//加载第一级商品
		List<EasybuyProductCategory> list = pcsi.getProductCategoryListOne();
		request.setAttribute("listOne", list);
		
		return "/backend/product/toAddProduct";
	}

	/**
	 * 根据Id查询对应的商品信息传递到修改页面！(回显数据)
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getProduct")
	public String getProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));  //编号
		int currentPage =  Integer.parseInt(request.getParameter("currentPage")); //在哪一页修改
		EasybuyProduct pro = psi.getEasybuyProductById(id);
		//加载第一级商品
		List<EasybuyProductCategory> list = pcsi.getProductCategoryListOne();
		//加载第一级商品分类下的二级分类
		List<EasybuyProductCategory> list2 = pcsi.getProductCategoryListByparentId(2, pro.getCategoryLevel1());
		//加载第二季商品分类下的三级分类
		List<EasybuyProductCategory> list3 = pcsi.getProductCategoryListByparentId(3, pro.getCategoryLevel2());
		//得到该商品信息
		
		//存储到request中
		request.setAttribute("listOne", list);
		request.setAttribute("listTwo", list2);
		request.setAttribute("listThree", list3);
		request.setAttribute("easybuyProduct", pro);
		request.setAttribute("currentPage", currentPage);
		return "/backend/product/toAddProduct";
	}

	/**
	 * 商品三级分类！！
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public void getCategoryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	}

/**
 * 上传
 * @param request
 * @param response
 * @return
 * @throws Exception
 */
	@RequestMapping(value="getImgs",method=RequestMethod.POST)
	public void getImgs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getSession().getServletContext().getRealPath("/files"); //上传路径
		String fileUploadName = "";  //文件名
		String fileName = ""; //字段名
		String id = ""; //判断进行添加还是修改
		EasybuyProduct pro = new EasybuyProduct();//商品类对象
		boolean ismultiPart = ServletFileUpload.isMultipartContent(request); //判断是否为multiPart类型
		if(ismultiPart){
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> ito = items.iterator();
			while(ito.hasNext()){
				FileItem item = ito.next();
				if(item.isFormField()){  //普通字段
					fileName = item.getFieldName();
					if(fileName.equals("categoryLevel1Id")){
						pro.setCategoryLevel1(Integer.parseInt(item.getString("UTF-8")));
					}else if(fileName.equals("categoryLevel2Id")){
						pro.setCategoryLevel2(Integer.parseInt(item.getString("UTF-8")));
					}else if(fileName.equals("categoryLevel3Id")){
						pro.setCategoryLevel3(Integer.parseInt(item.getString("UTF-8")));
					}else if(fileName.equals("name")){
						pro.setName(item.getString("UTF-8"));
					}else if(fileName.equals("price")){
						pro.setPrice(Float.valueOf(item.getString("UTF-8")));
					}else if(fileName.equals("stock")){
						pro.setStock(Integer.parseInt(item.getString("UTF-8")));
					}else if(fileName.equals("description")){
						pro.setDescription(item.getString("UTF-8"));
					}else if(fileName.equals("id")){
						id = item.getString("UTF-8");
					}else if(fileName.equals("fileName")){
						pro.setFileName(item.getString("UTF-8"));
					}
				}else{  //文件类型
					fileUploadName = item.getName();
					System.out.println(fileUploadName);
					//文件格式限制
					List<String> list = Arrays.asList("jpg");
					String ex = fileUploadName.substring(fileUploadName.indexOf(".")+1);
					if(!list.contains(ex)){
						System.out.println("文件格式错误!");
					}else{ //允许上传
						File saveFile = new File(realPath,fileUploadName);
						pro.setFileName(fileUploadName); //存储文件名
						item.write(saveFile);
						//System.out.println("上传成功!文件名为:"+item.getName());
					}
				}
			}
		}
		//添加商品
		ReturnResult result = new ReturnResult();
		//判断是添加还是修改
		if(id.equals("")){  //添加
			pro.setIsDelete(0);
			int count = psi.addEasybuyProduct(pro);
			if(count > 0){  //成功
				result.returnSuccess("添加成功!");
			}else{//失败
				result.returnFail("添加失败!");
			}
		}else{ //修改
			pro.setId(Integer.parseInt(id));
			pro.setIsDelete(0);
			int count = psi.updateEasybuyProduct(pro);
			if(count > 0){
				result.returnSuccess("修改成功!");
			}else{
				result.returnFail("修改失败!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}
}
