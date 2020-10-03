package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.Book;
import com.library.bean.Note;
import com.library.bean.User;
import com.library.dao.noteDao;
import com.library.dao.noteDaoImpl;

public class noteServiceImpl implements noteService {

	noteDao note = new noteDaoImpl();
	
	@Override
	public String addSpeech(Book book, User user, String noteContent) throws SQLException {
		// TODO Auto-generated method stub
		return note.addSpeech(book, user, noteContent);
	}

	@Override
	public String delSpeech(Book book, User user) throws SQLException {
		// TODO Auto-generated method stub
		return note.delSpeech(book, user);
	}

	@Override
	public ArrayList<Note> select(String bId, String aId) throws SQLException {
		// TODO Auto-generated method stub
		return note.select(bId, aId);
	}

}
