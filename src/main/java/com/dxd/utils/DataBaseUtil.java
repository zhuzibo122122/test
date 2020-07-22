package com.dxd.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * 工具类！
 * 
 * @author Administrator
 *
 */
public class DataBaseUtil {
	// 数据库驱动字符串！
	private static String driver = ConfigManager.getProperty("driver");
	// 连接URL字符串！
	private static String url = ConfigManager.getProperty("url");
	// 数据库用户名！！
	private static String user = ConfigManager.getProperty("user");
	// 用户密码！
	private static String password = ConfigManager.getProperty("password");

	// 静态代码块用于加载驱动类！
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
		}
	}

	/**
	 * 获取数据库连接对象！
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 返回连接对象！
		return conn;
	}
	
	/**
	 * 关闭数据库连接！
	 * @param rs ResultSet对象！
	 * @param pstmt PreparedStatement对象！
	 * @param conn Connection对象！
	 */
	public static void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		// 关闭ResultSet对象连接！
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		// 关闭PreparedStatement对象连接！
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		// 关闭Connection对象连接！
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}
}
