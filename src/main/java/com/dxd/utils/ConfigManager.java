package com.dxd.utils;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
/**
 * 资源文件类！
 * @author Administrator
 *
 */
public class ConfigManager {
	private static Properties properties = null;
	
	//静态代码块！类被加载的时候加载这段代码！
	static {
		InputStream is = ConfigManager.class.getClassLoader().getResourceAsStream(
                "database.properties");
		//判断InputStream是否为空！
		if(is == null) {
			throw new RuntimeException("找不到数据库参数配置文件！");
		}
		properties = new Properties();
		try {
			properties.load(is);
		} catch (IOException e) {
			throw new RuntimeException("数据库配置参数加载错误！", e);
		}finally {
            try {
            	//最后关闭资源！！
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
		}
	}
	
	/**
	 * 通过键找到资源文件里面放的值！
	 * @param key
	 * @return
	 */
	public static String getProperty(String key) {
		return properties.getProperty(key);
	}
}
