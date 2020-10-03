package com.library.dao;
/**
 * 
 * @author LENOVO
 * 图书类的数据层接口，用于连接数据库进行操作数据
 */

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.library.bean.Book;
import com.library.bean.History;
import com.library.bean.User;

public interface bookDao {
	// 查询全部图书
	ArrayList<Book> getAllBookInfo() throws SQLException;

	// 查询单个图书信息
	Book getBookInfo(int bId) throws SQLException;
	
	// 查询单个图书借阅历史信息
		History getHistoryInfo(int hId) throws SQLException;

	// 用户查询全部借书信息,Status表示搜索正在借阅的或者已经还书的信息,aid代表当前登录用户
	ArrayList<History> getAllHistory(int Status, String aId) throws SQLException;

	// 用户查找图书，依据是图书姓名
	ArrayList<Book> getBookName(String bookName)throws SQLException;
	
	
	//搜索功能，只需要包含那个字就可以把相关的书籍展示出来
	// 用户查找图书，依据是图书姓名
	ArrayList<Book> getBookName1(String bookName)throws SQLException;
		
	// 管理员查询全部借书信息,表示搜索正在借阅的或者已经还书的信息
	ArrayList<History> getAllHistory2() throws SQLException;
   
	//查询该用户的所有借书信息
	ArrayList<History> getAllHistory3(String aId) throws SQLException;
	
	// 增加图书信息
	String addBook(String bookNo, String bookName, String bookSort, String Author, String Press, String bookPrice,
			String type,int bookNum) throws SQLException;

	// 删除图书信息
	String delBookByNo(int bId) throws SQLException;

	// 修改图书信息
	String updateBook(int bId, String bookNo, String bookName, String bookSort, String Author, String Press, String bookPrice,
			String type,int bookNum) throws SQLException;
	
	// 用户借阅图书
	String borrowBook(int bId,User user)throws SQLException;
	
	// 用户归还图书
	String returnBook(int hId)throws SQLException;

}
