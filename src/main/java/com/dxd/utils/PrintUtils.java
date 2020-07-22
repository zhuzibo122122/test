package com.dxd.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

/**
 * 转发json格式工具类
 * @author 99266
 *
 */
public class PrintUtils {
	public static void getJsonString(HttpServletResponse response,Object result) {
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		String json = JSONObject.toJSONString(result);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			out.flush();
			out.close();
		}
	}
}
