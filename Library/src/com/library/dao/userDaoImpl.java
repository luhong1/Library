package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.library.bean.User;
import com.library.utils.dbUtil;

/**
 * 
 * @author LENOVO
 * 用户数据库操作的具体实现方法
 */
public class userDaoImpl implements userDao {



	@Override
	public String Login(String loginName, String Password) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where loginName = '"+loginName+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		if(rs.next()){
			if(Password.equals(rs.getString("Password"))){
				System.out.print("登录成功!");
				return "登录成功";
			}
			if(!Password.equals(rs.getString("Password"))){
				System.out.print("密码错误!");
				return "密码错误";
			}
		}
		rs.close();
		dbUtil.close(conn);
		return "登录失败";
		
	}
	
	@Override
	public String select(String loginName) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where loginName = '"+loginName+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		if(rs.next()){
				return "1";		
		}
		rs.close();
		dbUtil.close(conn);
		return "-1";
		
	}

	//有点逻辑问题 关于aId是否应该添加
	@Override
	public String Register(String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "insert into User(aId,loginName,trueName,niceName,Password,Email,phoneNumber,idNumber,lendNum,maxNum,Status) values(?,?,?,?,?,?,?,?,?,?,?)";
	
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, loginName);
		pre.setString(2, loginName);
		pre.setString(3, trueName);
		pre.setString(4, niceName);
		pre.setString(5, Password);
		pre.setString(6, Email);
		pre.setString(7, phoneNumber);
		pre.setString(8,idNumber);
		pre.setString(9, lendNum);
		pre.setString(10, maxNum);
		pre.setInt(11,1);
		
		
		int flag = pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		if(flag == 1 )
			return "注册成功";
			//System.out.print("注册成功!");
//		else {
//			System.out.print("注册失败!");
//		}
		return "注册失败";
	}
	
	@Override
	public String Register1(String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		// TODO Auto-generated method stub
		String string=this.select(loginName);
		if(string.equals("1")){
			return "-2";
		}else{
			if(phoneNumber.length()>0){
			String str=this.PhoneNumber(phoneNumber);
			if(str.equals("1")){
				return "-3";
			}}else{
				String str1=this.IDNumber(idNumber);
				if(str1.equals("1")){
					return "-4";
				}else{
		Connection conn = dbUtil.getConnection();
		String sql = "insert into User(aId,loginName,trueName,niceName,Password,Email,phoneNumber,idNumber,lendNum,maxNum,Status) values(?,?,?,?,?,?,?,?,?,?,?)";
	
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, loginName);
		pre.setString(2, loginName);
		pre.setString(3, trueName);
		pre.setString(4, niceName);
		pre.setString(5, Password);
		pre.setString(6, Email);
		pre.setString(7, phoneNumber);
		pre.setString(8,idNumber);
		pre.setString(9, lendNum);
		pre.setString(10, maxNum);
		pre.setInt(11,2);
		
		
		int flag = pre.executeUpdate();
		pre.close();
		dbUtil.close(conn);
		if(flag == 1 )
			return "注册成功";
			//System.out.print("注册成功!");
//		else {
//			System.out.print("注册失败!");
//		}
		return "注册失败";
	}}}
		return "注册失败";
		
	}

	@Override
	public User getUserInfo(String loginName, String Password) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		Connection connection = dbUtil.getConnection();
		String sql = "select * from User where loginName = '"+loginName+"' and Password = '"+Password+"'";
		PreparedStatement pre = connection.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
			user.setStatus(Integer.valueOf(rs.getString("Status")));
		}
		pre.close();
		rs.close();
		dbUtil.close(connection);	
		return user;		
	}

	@Override
	public ArrayList<User> getAllUser() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<User> users = new ArrayList<User>();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where Status = 1";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
			users.add(user);
		}
		
		pre.close();
		rs.close();
		dbUtil.close(conn);
		return users;
	}

	@Override
	public User getAidInfo(String aId) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User Where aId = '"+aId+"'";
		PreparedStatement pre = conn.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
		}
		return null;
	}

	@Override
	public String upUserInfo(String aId, String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE User set loginName = '"+loginName+"',trueName = '"+trueName+"',niceName = '"+niceName+"',Password = '"+Password+"',Email = '"+Email+"',phoneNumber = '"+phoneNumber+
				"',idNumber = '"+idNumber+"',lendNum = '"+lendNum+"',maxNum = '"+maxNum+"' where aId = '"+aId+"'";
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
	public String upUserInfo1(String aId,String trueName,String Email) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE User set trueName = '"+trueName+"',Email = '"+Email+"' where aId = '"+aId+"'";
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
	public String delUserInfo(String aId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "delete from User where aId = ?";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, aId);
		pre.executeUpdate();
		
		dbUtil.close(conn);
		pre.close();
		return "删除成功";
	}

	@Override
	public String LoginPhone(String phoneNumber, String password) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where phoneNumber = '"+phoneNumber+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		if(rs.next()){
		
			if(password.equals(rs.getString("Password"))){
				System.out.print("登录成功!");
				return "登录成功";
			}if(!password.equals(rs.getString("Password"))){
				System.out.print("密码错误!");
				return "密码错误";
			}
		}
		else{
			System.out.print("手机号不存在，请重新输入!");
			return "登录失败";
		}
		
		rs.close();
		dbUtil.close(conn);
		return "登录失败";
		
	}

	@Override
	public User getUserInfoPhone(String phoneNumber, String Password) throws SQLException {
		User user = new User();
		Connection connection = dbUtil.getConnection();
		String sql = "select * from User where phoneNumber = '"+phoneNumber+"' and Password = '"+Password+"'";
		PreparedStatement pre = connection.prepareStatement(sql);
		ResultSet rs = pre.executeQuery();
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
			user.setStatus(Integer.valueOf(rs.getString("Status")));
		}
		pre.close();
		rs.close();
		dbUtil.close(connection);	
		return user;		
	}

	@Override
	public User LoginCodePhone(String phoneNumber) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where phoneNumber = '"+phoneNumber+"'";
		Statement state = conn.createStatement();
		  User user=new User();
		ResultSet rs = state.executeQuery(sql);
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
			user.setStatus(Integer.valueOf(rs.getString("Status")));
		}
		
		rs.close();
		dbUtil.close(conn);
		return user;
		
	}

	@Override
	public String IDNumber(String IDNumber) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where idNumber = '"+IDNumber+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		if(rs.next()){
			System.out.println("身份证账号已存在！");
		   return "1"; 
		}else{
			System.out.println("身份证账号不存在！");
		}
		rs.close();
		dbUtil.close(conn);
		return "-1";
		
	}

	@Override
	public String chUserPassword(String loginName, String Password) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql=null;
		if(loginName.length()<11){
			sql = "UPDATE User set Password = '"+Password+"' WHERE loginName = '"+loginName+"'";
		}else{
		 	sql = "UPDATE User set Password = '"+Password+"' WHERE phoneNumber = '"+loginName+"'";
		}
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
	public User LoginCode(String loginName) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where loginName = '"+loginName+"'";
		Statement state = conn.createStatement();
		  User user=new User();
		ResultSet rs = state.executeQuery(sql);
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
			user.setStatus(Integer.valueOf(rs.getString("Status")));
		}
		
		rs.close();
		dbUtil.close(conn);
		return user;
	}
	
	@Override
	public User getAidInfo2(String aId) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User Where aId = '"+aId+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		while(rs.next()){
			user.setaId(rs.getString("aId"));
			user.setLoginName(rs.getString("loginName"));
			user.setTrueName(rs.getString("trueName"));
			user.setNiceName(rs.getString("niceName"));
			user.setPassword(rs.getString("Password"));
			user.setEmail(rs.getString("Email"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setIdNumber(rs.getString("idNumber"));
			user.setLendNum(rs.getString("lendNum"));
			user.setMaxNum(rs.getString("maxNum"));
		}
		return user;
	}

	@Override
	public String upUserInfo2(String aId, String phoneNumber) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE User set phoneNumber = '"+phoneNumber+"' where aId = '"+aId+"'";
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
	public String PhoneNumber(String PhoneNumber) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = dbUtil.getConnection();
		String sql = "select * from User where  phoneNumber= '"+PhoneNumber+"'";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		if(rs.next()){
			System.out.println("手机号已存在！");
		   return "1"; 
		}else{
			System.out.println("手机号不存在！");
		}
		rs.close();
		dbUtil.close(conn);
		return "-1";
	}




}
