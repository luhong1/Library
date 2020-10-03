package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;
import com.library.bean.Book;
import com.library.bean.History;
import com.library.bean.User;
import com.library.dao.bookDao;
import com.library.dao.bookDaoImpl;

public class bookServiceImpl implements bookService {

	bookDao book = new bookDaoImpl();

	@Override
	public ArrayList<Book> getAllBookInfo() throws SQLException {
		// TODO Auto-generated method stub
		return book.getAllBookInfo();
	}

	@Override
	public Book getBookInfo(int bId) throws SQLException {
		// TODO Auto-generated method stub
		return book.getBookInfo(bId);
	}

	@Override
	public ArrayList<History> getAllHistory(int Status, String aId) throws SQLException {
		// TODO Auto-generated method stub
		return book.getAllHistory(Status, aId);
	}

	@Override
	public ArrayList<Book> getBookName(String bookName) throws SQLException {
		// TODO Auto-generated method stub
		return book.getBookName(bookName);
	}

	@Override
	public ArrayList<History> getAllHistory2() throws SQLException {
		// TODO Auto-generated method stub
		return book.getAllHistory2();
	}

	@Override
	public String addBook(String bookNo, String bookName, String bookSort, String Author, String Press,
			String bookPrice, String type, int bookNum) throws SQLException {
		// TODO Auto-generated method stub
		return book.addBook(bookNo, bookName, bookSort, Author, Press, bookPrice, type, bookNum);
	}

	@Override
	public String delBookByNo(int bId) throws SQLException {
		// TODO Auto-generated method stub
		return book.delBookByNo(bId);
	}

	@Override
	public String updateBook(int bId, String bookNo, String bookName, String bookSort, String Author, String Press,
			String bookPrice, String type, int bookNum) throws SQLException {
		// TODO Auto-generated method stub
		return book.updateBook(bId, bookNo, bookName, bookSort, Author, Press, bookPrice, type, bookNum);
	}

	@Override
	public String borrowBook(int bId, User user) throws SQLException {
		// TODO Auto-generated method stub
		return book.borrowBook(bId, user);
	}

	@Override
	public String returnBook(int hId) throws SQLException {
		// TODO Auto-generated method stub
		return book.returnBook(hId);
	}

	@Override
	public ArrayList<Book> getBookName1(String bookName) throws SQLException {
		// TODO Auto-generated method stub
		return book.getBookName1(bookName);
	}

	@Override
	public History getHistoryInfo(int hId) throws SQLException {
		// TODO Auto-generated method stub
		return book.getHistoryInfo(hId);
	}
	
}
