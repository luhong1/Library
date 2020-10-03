package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.Note;
import com.library.bean.User;

public interface noteService {
	
	//增加发言
	String addSpeech(Book book, User user,String noteContent) throws SQLException;
	
	//删除发言
	String delSpeech(Book book, User user)throws SQLException;
    
	ArrayList<Note> select(String bId,String aId)throws SQLException;
}
