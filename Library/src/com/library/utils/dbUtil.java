package com.library.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;

import com.library.bean.Book;
import com.library.bean.User;
import com.mysql.cj.xdevapi.PreparableStatement;

/**
 * 
 * @author LENOVO 数据库工具类
 */
public class dbUtil {

	private static String url;// 数据库连接地址ַ
	private static String user; // 用户名
	private static String pass; // 密码
	private static String driver;// 驱动

	static {
		// 启动驱动

		Properties p = new Properties();

		try {
			p.load(dbUtil.class.getResourceAsStream("db.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String host = p.getProperty("host");
		String port = p.getProperty("port");
		String database = p.getProperty("database");

		url = "jdbc:mysql://" + host + ":" + port + "/" + database
				+ "?useUnicode=true&characterEncoding=UTF8&serverTimezone=GMT%2B8&useSSL=true";
		user = p.getProperty("user");
		pass = p.getProperty("pass");
		driver = p.getProperty("driver");

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 连接数据库
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url,user,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

	/**
	 * 关闭数据库
	 * 
	 * @param conn
	 */
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 测试
	public static void main(String[] args) {
		System.out.println(getConnection());
	}

	// 增加
	public static void Add(String sql, Connection conn) throws SQLException {
		Statement state;

		state = conn.createStatement();
		state.executeUpdate(sql);
		state.close();
		close(conn);
		System.out.println("添加成功！");
	}

	// 删除
	public static void Del(String sql, Connection conn) throws SQLException {
		Statement state;

		state = conn.createStatement();
		state.executeUpdate(sql);
		state.close();
		close(conn);
		System.out.println("删除成功！");
	}

	// 修改
	public static void Update(String sql, Connection conn) throws SQLException {
		Statement state;

		state = conn.createStatement();
		int re = state.executeUpdate(sql);
		if (re > 0) {
			System.out.println("更新成功!");
		} else {
			System.out.println("更新失败!");
		}
		state.close();
		close(conn);
	}
}
