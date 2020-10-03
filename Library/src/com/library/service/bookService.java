package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.History;
import com.library.bean.User;

public interface bookService {
	// 查询全部图书
	ArrayList<Book> getAllBookInfo() throws SQLException;

	// 查询单个图书信息
	Book getBookInfo(int bId) throws SQLException;

	// 查询单个图书借阅历史信息
		History getHistoryInfo(int hId) throws SQLException;
		
	// 用户查询全部借书信息,表示搜索正在借阅的或者已经还书的信息,aid代表当前登录用户
	ArrayList<History> getAllHistory(int Status, String aId) throws SQLException;

	// 用户查找图书，依据是图书姓名
	ArrayList<Book> getBookName(String bookName) throws SQLException;
  
	ArrayList<Book> getBookName1(String bookName) throws SQLException;
	// 管理员查询全部借书信息,表示搜索正在借阅的或者已经还书的信息
	ArrayList<History> getAllHistory2() throws SQLException;

	// 增加图书信息
	String addBook(String bookNo, String bookName, String bookSort, String Author, String Press,
			String bookPrice, String type, int bookNum) throws SQLException;

	// 删除图书信息
	String delBookByNo(int bId) throws SQLException;

	// 修改图书信息
	String updateBook(int bId, String bookNo, String bookName, String bookSort, String Author, String Press,
			String bookPrice, String type, int bookNum) throws SQLException;

	// 用户借阅图书
	String borrowBook(int bId, User user) throws SQLException;

	// 用户归还图书
	String returnBook(int hId) throws SQLException;

}
