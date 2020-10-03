package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import com.library.bean.Book;
import com.library.bean.Note;
import com.library.bean.Remark;
import com.library.bean.User;
import com.library.utils.dbUtil;

public class noteDaoImpl implements noteDao {

	@Override
	public String addSpeech(Book book, User user, String noteContent) throws SQLException {
		// TODO Auto-generated method stub
		// 设置日期
		Calendar c = Calendar.getInstance();

		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		int h = c.get(Calendar.HOUR_OF_DAY);
		int mi = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		
		//发表评论时间
		String noteTime =  ""+year+"-"+month+"-"+day+" "+h+":"+mi+":"+s;
		
		//插入数据库语句
		Connection conn = dbUtil.getConnection();
		String sql= "insert into Note(aId,loginName,trueName,niceName,bId,bookNo,bookName,note,noteTime)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, user.getaId());
		pre.setString(2, user.getLoginName());
		pre.setString(3, user.getTrueName());
		pre.setString(4, user.getNiceName());
		pre.setString(5, book.getbId());
		pre.setString(6, book.getBookNo());
		pre.setString(7, book.getBookName());
		pre.setString(8, noteContent);
		pre.setString(9, noteTime);
		pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		return "1";
		
		
	}

	@Override
	public String delSpeech(Book book, User user) throws SQLException {
		// TODO Auto-generated method stub
		
		String aId = user.getaId();
		String bId = book.getbId();
		
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from Note where bId = '"+bId+"' and aId = '"+aId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		
		return "删除笔记成功";
	}

	@Override
	public ArrayList<Note> select(String bId, String aId) throws SQLException {
		ArrayList<Note> list  = new ArrayList<Note>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Note where bId = '"+bId+"' and aId = '"+aId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			Note note = new Note();
			note.setaId(rs.getString("aId"));
			note.setbId(rs.getString("bId"));
			note.setBookName(rs.getString("bookName"));
			note.setBookNo(rs.getString("bookNo"));
			note.setLoginName(rs.getString("loginName"));
	        note.setNiceName(rs.getString("niceName"));
	        note.setNoteContent(rs.getString("note"));
	        note.setTrueName(rs.getString("trueName"));
	        note.setNoteTime(rs.getString("noteTime"));
			list.add(note);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}

}
