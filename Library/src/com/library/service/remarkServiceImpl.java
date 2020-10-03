package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.Remark;
import com.library.bean.User;
import com.library.dao.remarkDao;
import com.library.dao.remarkDaoImpl;

public class remarkServiceImpl implements remarkService {
	
	remarkDao remarkDao = new remarkDaoImpl();

	@Override
	public String addSpeech(Book book, User user, String remarkContent) throws SQLException {
		// TODO Auto-generated method stub
		return remarkDao.addSpeech(book, user, remarkContent);
	}

	@Override
	public String delSpeech(Book book, User user) throws SQLException {
		// TODO Auto-generated method stub
		return remarkDao.delSpeech(book, user);
	}

	@Override
	public ArrayList<Remark> select(String bId, String bookName) throws SQLException {
		// TODO Auto-generated method stub
		return remarkDao.select(bId, bookName);
	}

}
