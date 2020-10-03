package com.library.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.Remark;
import com.library.bean.User;

public interface remarkDao {
	
	//增加发言
	String addSpeech(Book book, User user,String remarkContent) throws SQLException;
	
	//删除发言
	String delSpeech(Book book, User user)throws SQLException;
	
	ArrayList<Remark> select(String bId,String bookName)throws SQLException;
	
	
	

}
