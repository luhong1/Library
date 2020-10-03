package com.library.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.Note;
import com.library.bean.Remark;
import com.library.bean.User;

public interface noteDao {
	
	//增加笔记
	String addSpeech(Book book, User user,String noteContent) throws SQLException;
	
	//删除笔记
	String delSpeech(Book book, User user)throws SQLException;
	
	ArrayList<Note> select(String bId,String aId)throws SQLException;
	
	
	

}
