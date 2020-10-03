package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import com.library.bean.Book;
import com.library.bean.History;
import com.library.bean.Remark;
import com.library.bean.User;
import com.library.utils.dbUtil;

public class remarkDaoImpl implements remarkDao {

	@Override
	public String addSpeech(Book book, User user, String remarkContent) throws SQLException {
		// TODO Auto-generated method stub
		// 设置日期
		Calendar c = Calendar.getInstance();

		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		int h = c.get(Calendar.HOUR_OF_DAY);
		int mi = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		int month1 = month + 1;
		
		//发表评论时间
		String remarkTime =  ""+year+"-"+month+"-"+day+" "+h+":"+mi+":"+s;
		
		//插入数据库语句
		Connection conn = dbUtil.getConnection();
		String sql= "insert into Remark(aId,loginName,trueName,niceName,bId,bookNo,bookName,remarkTime,remarkContent)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, user.getaId());
		pre.setString(2, user.getLoginName());
		pre.setString(3, user.getTrueName());
		pre.setString(4, user.getNiceName());
		pre.setString(5, book.getbId());
		pre.setString(6, book.getBookNo());
		pre.setString(7, book.getBookName());
		pre.setString(8, remarkTime);
		pre.setString(9, remarkContent);
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
		
		String sql = "delete from Remark where bId = '"+bId+"' and aId = '"+aId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		
		return "删除评论成功";
	}

	@Override
	public 	ArrayList<Remark> select(String bId, String bookName) throws SQLException {
		ArrayList<Remark> list  = new ArrayList<Remark>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Remark where bId = '"+bId+"' and bookName = '"+bookName+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			Remark remark = new Remark();
	        remark.setaId(rs.getString("aId"));
	        remark.setbId(rs.getString("bId"));
	        remark.setBookName(rs.getString("bookName"));
	        remark.setBookNo(rs.getString("bookNo"));
	        remark.setLoginName(rs.getString("loginName"));
	        remark.setNiceName(rs.getString("niceName"));
	        remark.setRemarkContent(rs.getString("remarkContent"));
	        remark.setRemarkTime(rs.getString("remarkTime"));
	        remark.setTrueName(rs.getString("trueName"));
			list.add(remark);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}
	}
