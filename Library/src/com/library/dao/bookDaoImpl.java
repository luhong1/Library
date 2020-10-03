package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.library.bean.Book;
import com.library.bean.History;
import com.library.bean.User;
import com.library.utils.dbUtil;

public class bookDaoImpl implements bookDao {

	@Override
	public ArrayList<Book> getAllBookInfo() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Book> list = new ArrayList<Book>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Book";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			Book book = new Book();
			book.setbId(rs.getString("bId"));
			book.setBookNo(rs.getString("bookNo"));
			book.setBookName(rs.getString("bookName"));
			book.setAuthor(rs.getString("Author"));
			book.setBookSort(rs.getString("bookSort"));
			book.setPress(rs.getString("Press"));
			book.setBookPrice(rs.getString("bookPrice"));
			book.setType(rs.getString("type"));
			book.setBookNum(rs.getInt("bookNum"));
			list.add(book);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}

	@Override
	public Book getBookInfo(int bId) throws SQLException {
		// TODO Auto-generated method stub
		Book book = new Book();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Book where bId = '"+bId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			book.setbId(rs.getString("bId"));
			book.setBookNo(rs.getString("bookNo"));
			book.setBookName(rs.getString("bookName"));
			book.setAuthor(rs.getString("Author"));
			book.setBookSort(rs.getString("bookSort"));
			book.setPress(rs.getString("Press"));
			book.setBookPrice(rs.getString("bookPrice"));
			book.setType(rs.getString("type"));
			book.setBookNum(rs.getInt("bookNum"));
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return book;
	}

	@Override
	public ArrayList<History> getAllHistory(int Status, String aId) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<History> list = new ArrayList<History>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from History where aId = '"+aId+"' and Status = '"+Status+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			History history = new History();
			history.sethId(rs.getInt("hId"));
			history.setaId(rs.getInt("aId"));
			history.setbId(rs.getInt("bId"));
			history.setBookNo(rs.getString("bookNo"));
			history.setBookName(rs.getString("bookName"));
			history.setLoginName(rs.getString("loginName"));
			history.setTrueName(rs.getString("trueName"));
			history.setBeginTime(rs.getString("beginTime"));
			history.setEndTime(rs.getString("endTime"));
			history.setEndTimemax(rs.getString("endTimemax"));
			history.setStatus(rs.getInt("Status"));
			list.add(history);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}

	@Override
	public ArrayList<Book> getBookName(String bookName) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Book> list = new ArrayList<Book>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Book where bookName = '"+bookName+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			Book book = new Book();
			book.setbId(rs.getString("bId"));
			book.setBookNo(rs.getString("bookNo"));
			book.setBookName(rs.getString("bookName"));
			book.setAuthor(rs.getString("Author"));
			book.setBookSort(rs.getString("bookSort"));
			book.setPress(rs.getString("Press"));
			book.setBookPrice(rs.getString("bookPrice"));
			book.setType(rs.getString("type"));
			book.setBookNum(rs.getInt("bookNum"));
			list.add(book);
		}
		
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}
	@Override
	public ArrayList<Book> getBookName1(String bookName) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Book> list = new ArrayList<Book>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from Book where bookName  LIKE '%"+bookName+"%' ";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			Book book = new Book();
			book.setbId(rs.getString("bId"));
			book.setBookNo(rs.getString("bookNo"));
			book.setBookName(rs.getString("bookName"));
			book.setAuthor(rs.getString("Author"));
			book.setBookSort(rs.getString("bookSort"));
			book.setPress(rs.getString("Press"));
			book.setBookPrice(rs.getString("bookPrice"));
			book.setType(rs.getString("type"));
			book.setBookNum(rs.getInt("bookNum"));
			list.add(book);
		}
		
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}
     
	@Override
	public ArrayList<History> getAllHistory2() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<History> list  = new ArrayList<History>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from History ";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			History history = new History();
			history.sethId(rs.getInt("hId"));
			history.setaId(rs.getInt("aId"));
			history.setbId(rs.getInt("bId"));
			history.setBookNo(rs.getString("bookNo"));
			history.setBookName(rs.getString("bookName"));
			history.setLoginName(rs.getString("loginName"));
			history.setTrueName(rs.getString("trueName"));
			history.setBeginTime(rs.getString("beginTime"));
			history.setEndTime(rs.getString("endTime"));
			history.setEndTimemax(rs.getString("endTimemax"));
			history.setStatus(rs.getInt("Status"));
			list.add(history);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}
	@Override
	public ArrayList<History> getAllHistory3(String aId) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<History> list  = new ArrayList<History>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from History where aId = '"+aId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			History history = new History();
			history.sethId(rs.getInt("hId"));
			history.setaId(rs.getInt("aId"));
			history.setbId(rs.getInt("bId"));
			history.setBookNo(rs.getString("bookNo"));
			history.setBookName(rs.getString("bookName"));
			history.setLoginName(rs.getString("loginName"));
			history.setTrueName(rs.getString("trueName"));
			history.setBeginTime(rs.getString("beginTime"));
			history.setEndTime(rs.getString("endTime"));
			history.setEndTimemax(rs.getString("endTimemax"));
			history.setStatus(rs.getInt("Status"));
			list.add(history);
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return list;
	}
	@Override
	public String addBook(String bookNo, String bookName, String bookSort, String Author, String Press, String bookPrice,
			String type,int bookNum) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "insert into Book(bookNo,bookName,bookSort,Author,Press,bookPrice,type,bookNum)"
				+ "value(?,?,?,?,?,?,?,?)";
		
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, bookNo);
		pre.setString(2, bookName);
		pre.setString(3, bookSort);
		pre.setString(4, Author);
		pre.setString(5, Press);
		pre.setString(6, bookPrice);
		pre.setString(7, type);
		pre.setInt(8, bookNum);
		
		pre.executeUpdate();
		
		pre.close();
		dbUtil.close(conn);
		return "1";
	}

	@Override
	public String delBookByNo(int bId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "delete from Book where bId = ?";
		
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setInt(1, bId);
		
		pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		return "删除成功";
	}

	@Override
	public String updateBook(int bId,String bookNo, String bookName, String bookSort, String Author, String Press,
			String bookPrice, String type,int bookNum) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE Book set bookNo = '"+bookNo+"',bookName = '"+bookName+"',bookSort = '"+bookSort+"',Author = '"+Author+"',Press = '"+Press+"',bookPrice = '"+bookPrice+
				"',type = '"+type+"',bookNum = '"+bookNum+"' where bId = '"+bId+"'";
	    Statement state = conn.createStatement();
		int flag = state.executeUpdate(sql);
        dbUtil.close(conn);
		if(flag == 1 ){
			System.out.print("修改成功!");
			return "1";
		}
		else {
			System.out.print("修改失败!");
			return "-1";
		}
	}

	@Override
	public String borrowBook(int bId, User user) throws SQLException {
		// TODO Auto-generated method stub
		//获取借书的信息
		Book book = new Book();
		book = this.getBookInfo(bId);
		
		//设置日期
		Calendar c = Calendar.getInstance();

		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;   
		int day = c.get(Calendar.DATE);
		int h=c.get(Calendar.HOUR_OF_DAY);
		int mi=c.get(Calendar.MINUTE); 
		int s=c.get(Calendar.SECOND); 
		int month1=month+1;
		//借书时间
		String beginTime =  ""+year+"-"+month+"-"+day+" "+h+":"+mi+":"+s;
		String endTime="";
		//还书时间
		String endTimemax = ""+year+"-"+month1+"-"+day+" "+h+":"+mi+":"+s;
		Connection conn = dbUtil.getConnection();
		String sql = "insert into History(aId,bId,bookNo,bookName,loginName,trueName,beginTime,endTime,Status,endTimemax) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, user.getaId());
		pre.setString(2, book.getbId());
		pre.setString(3, book.getBookNo());
		pre.setString(4, book.getBookName());
		pre.setString(5, user.getLoginName());
		pre.setString(6, user.getTrueName());
		pre.setString(7, beginTime);
		pre.setString(8, endTime);
		pre.setInt(9,1);
		pre.setString(10,endTimemax);
		pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		return "借书成功";
	}

	@Override
	public String returnBook(int hId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;   
		int day = c.get(Calendar.DATE);  
		int h=c.get(Calendar.HOUR_OF_DAY);
		int mi=c.get(Calendar.MINUTE); 
		int s=c.get(Calendar.SECOND); 
		String status="2"; 
		//还书时间
		String endTime = ""+year+"-"+month+"-"+day+" "+h+":"+mi+":"+s;
		String sql = "UPDATE History set endTime = '"+endTime+"',Status = '"+status+"' where hId = '"+hId+"'";
		    Statement state = conn.createStatement();
			int flag = state.executeUpdate(sql);
            dbUtil.close(conn);
			if(flag == 1 ){
				System.out.print("还书成功!");
				return "1";
			}
			else {
				System.out.print("还书失败!");
				return "-1";
			}
	}

	@Override
	public History getHistoryInfo(int hId) throws SQLException {
		History history = new History();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from History where hId = '"+hId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			history.sethId(rs.getInt("hId"));
			history.setaId(rs.getInt("aId"));
			history.setbId(rs.getInt("bId"));
			history.setBookNo(rs.getString("bookNo"));
			history.setBookName(rs.getString("bookName"));
			history.setLoginName(rs.getString("loginName"));
			history.setTrueName(rs.getString("trueName"));
			history.setBeginTime(rs.getString("beginTime"));
			history.setEndTime(rs.getString("endTime"));
			history.setEndTimemax(rs.getString("endTimemax"));
			history.setStatus(rs.getInt("Status"));
		}
		dbUtil.close(conn);
		pre.close();
		rs.close();
		return history;
	}

}
