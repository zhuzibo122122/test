package com.dxd.controller.pre;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dxd.pojo.EasybuyUser;
import com.dxd.service.order.EasybuyOrderService;
import com.dxd.service.user.EasybuyUserService;
import com.dxd.utils.Pager;
import com.dxd.utils.PrintUtils;
import com.dxd.utils.ReturnResult;

/**
 * 用户信息控制层！ Servlet implementation class EasybuyUserServlet
 */
@Controller
@RequestMapping("user/")
public class EasybuyUserServlet{
	@Autowired
	private EasybuyUserService eusi;
	@Autowired
	private EasybuyOrderService eosi;
	
	
	/**
	 * 加载所有用户列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="user")
	public String user(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int currentPage = 1; //当前页
		//判断参数currentPage是否为空
		if(null != request.getParameter("currentPage")){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//获得所用用户条数
		int count = eusi.getTotalCount();
		//创建分页对象
		Pager pager = new Pager(count,10,currentPage);
		//设置pager  URL
		pager.setUrl("spring/user/user");
		//得到所有用户信息
		List<EasybuyUser> userList = eusi.getEasybuyUserAll(pager);
		//存到request中
		request.setAttribute("list", userList);
		request.setAttribute("pager", pager);
		return "/backend/user/Member_Packet";
	}

	/**
	 * 添加用户成功后调用方法
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="adduser")
	public String adduser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/user/Member_Packet";
	}

	/**
	 * 回显数据 到修改页面(添加页面)
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="toUpdateUser")
	public String toUpdateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//回显数据
		int id = Integer.parseInt(request.getParameter("id"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage")); //在哪一页进行修改
		EasybuyUser user = eusi.getEasybuyUserById(id);
		//存储到作用域中
		request.setAttribute("user", user);
		request.setAttribute("currentPage", currentPage);
		//存储当前修改用户的登录名
		request.setAttribute("oldloginName", user.getLoginName());
		return "/backend/user/toUpdateUser";
	}

	/**
	 * 修改用户信息/添加用户信息！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public void modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id"); //0添加  否则修改
		//添加的参数
		String loginName = request.getParameter("loginName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String identityCode = request.getParameter("identityCode");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String type = request.getParameter("type");
		
		//创建对象
		EasybuyUser user = new EasybuyUser();
		user.setUserName(userName);
		user.setLoginName(loginName);
		user.setPassword(password);
		user.setIdentityCode(identityCode);
		user.setSex(Integer.parseInt(sex));
		user.setEmail(email);
		user.setMobile(mobile);
		user.setType(Integer.parseInt(type));
		ReturnResult result = new ReturnResult();
		//判断是执行新增还是修改
		if(id.equals("0")){  //新增
			int count = eusi.addRegisterInfo(user);
			if(count > 0){
				result.returnSuccess("添加成功!");  //添加成功
			}else{
				result.returnFail("添加失败!");
			}
		}else{  //执行修改
			//在哪一页修改
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			user.setId(Integer.parseInt(id)); //存储需要修改的id
			int count2 = eusi.updateEasybuyUserById(user);
			if(count2 > 0){
				request.setAttribute("currentPage", currentPage);
				result.returnSuccess("更新成功!");
			}else{
				result.returnFail("更新失败!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 点击新增用户！   跳转至新增用户页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="add")
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/user/toUpdateUser";

	}

	/**
	 * 用户详情！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/user/Member_User";

	}

	/**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="loginBtn",method=RequestMethod.POST)
	public void loginBtn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReturnResult result = new ReturnResult();
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		EasybuyUser user = eusi.getEasybuyUserInfo(name); //得到该用户名查询到的用户信息
		//判断是否为空
		if(null == user){
			result.returnFail("用户名不存在!");
		}else{
			//用户名存在,判断密码是否正确
			if(user.getPassword().equals(pwd)){
				request.getSession().setAttribute("easybuyUserLogin", user);
				result.returnSuccess("登录成功!");
			}else{
				result.returnFail("密码错误!请核对后输入!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EasybuyUser ebu = new EasybuyUser();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String numName = request.getParameter("numName");
		int sex = Integer.parseInt(request.getParameter("sex"));
		String mem = request.getParameter("mem");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int type = 0;
		ebu.setLoginName(name);
		ebu.setPassword(password);
		ebu.setUserName(numName);
		ebu.setSex(sex);
		ebu.setIdentityCode(mem);
		ebu.setEmail(email);
		ebu.setMobile(phone);
		ebu.setType(type);
		ReturnResult result = new ReturnResult();
		int count = eusi.addRegisterInfo(ebu);
		if(count > 0){
			result.returnSuccess();
		}else{
			result.returnFail("注册失败!");
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="del",method=RequestMethod.POST)
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));  //用户id
		int currentPage = Integer.parseInt(request.getParameter("currentPage")); //在哪一页操作
		ReturnResult result = new ReturnResult();
		//判断该用户是否有订单
		int count = eusi.checkOrderByid(id);
		if(count > 0){  //有订单 无法删除
			result.returnFail("该用户下有未收货订单,无法删除!");
		}else{  //无订单/可以删除
			//先删除该用户所有收货地址
			eusi.delAddressByid(id);
			//删除该用户所有订单中的所有商品
			   //查询所有订单号
			List<Integer> list = eusi.getAllOrderIdByuserId(id);
			//循环遍历list
			for(int i=0;i<list.size();i++){
				//删除所有商品
				eosi.delOrderProductByOrderId(list.get(i));
			}
			//删除该用户所有已收货订单
			eosi.delOrderByUserId(id);
			//删除用户
			int count2 = eusi.removeEasybuyUserById(id);
			if(count2 > 0){
				result.returnSuccess(); //删除成功!
			}else{
				result.returnFail("删除失败!");
			}
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 查询是否相同用户名！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="loginNameCount",method=RequestMethod.POST)
	public void loginNameCount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name"); //用户名
		ReturnResult result = new ReturnResult();
		int count = eusi.getLoginNameByName(name);
		//判断是否存在
		if(count > 0){  //存在
			 result.returnFail("该用户名已存在");
		}else{//不存在
			result.returnSuccess("用户名可用!");
		}
		PrintUtils.getJsonString(response, result);
	}

	/// *************************
	/**
	 * 跳转至验证身份！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findLoginNamePassword")
	public String findLoginNamePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/userPassWord/forgetPwdTwo";
	}

	/**
	 * 查询邮箱或者手机输入是否输入正确！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ReturnResult loginNameBy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}

	/**
	 * 跳转至设置新密码！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("modifyPwd")
	public String modifyPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/userPassWord/forgetPwdThree";
	}
	/**
	 * 跳转至修改密码页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toUpdatePwd2")
	public String toUpdatePwd2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/backend/userPassWord/toUpdatePwd2";
	}
	/**
	 * 修改密码！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="modifyPassWord",method=RequestMethod.POST)
	public void modifyPassWord(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String loginName = request.getParameter("loginName"); //需要修改密码的用户名
		//System.out.println(loginName);
		String password = request.getParameter("password");  //新密码
		ReturnResult result = new ReturnResult();
		int count = eusi.modifyUserPasswordBy(loginName, password);
		if(count > 0){
			result.returnSuccess("修改密码成功!");
		}else{
			result.returnFail("修改密码失败!");
		}
		PrintUtils.getJsonString(response, result);
	}

	/**
	 * 跳转至设置修改成功页面！！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("forgetPwd")
	public String forgetPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//移除session中的登录对象,让用户重新登录
		request.getSession().removeAttribute("easybuyUserLogin");
		return "/backend/userPassWord/forgetPwdLast";
	}

	// ***********************

	/**
	 * 注销
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("remove")
	public String remove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//移除session中的登录对象
		request.getSession().removeAttribute("easybuyUserLogin");
		return "/pre/Login";
	}
}
