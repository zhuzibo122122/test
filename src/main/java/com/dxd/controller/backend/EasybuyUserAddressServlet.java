package com.dxd.controller.backend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 地址信息控制类！
 * Servlet implementation class EasybuyUserAddressServlet
 */
@Controller
public class EasybuyUserAddressServlet{
       
	/**
	 * 获取地址信息|！
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="address")
	public String address(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/backend/user/Member_Address";
	}
}
