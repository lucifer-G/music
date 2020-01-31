package com.music.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class DBUtils {
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	private static BasicDataSource bds;//数据源对象
	private static String initial;
	private static String max;
	static {
		Properties pro = new Properties();
		InputStream is = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			pro.load(is);
			driver = pro.getProperty("driver");
			url = pro.getProperty("url");
			username = pro.getProperty("username");
			password = pro.getProperty("password");
			initial = pro.getProperty("initial");
			max = pro.getProperty("max");
			
			/*连接池*/
			bds = new BasicDataSource();
			//设置数据库连接信息
			bds.setDriverClassName(driver);
			bds.setUrl(url);
			bds.setUsername(username);
			bds.setPassword(password);
			//管理参数
			bds.setInitialSize(Integer.parseInt(initial));//初始化连接数量
			bds.setMaxActive(Integer.parseInt(max));//最大连接数量
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//获取连接
	public static Connection getConn() throws Exception {
		return bds.getConnection();//获取连接对象
		
	}

	//关闭资源
	public static void getClose(Connection conn,Statement stat,ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(stat!=null) {
				stat.close();
			}
			if(conn!=null) {
				conn.setAutoCommit(true);//归还之前打开自动提交
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
