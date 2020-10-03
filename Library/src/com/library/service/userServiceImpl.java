package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.User;
import com.library.dao.userDao;
import com.library.dao.userDaoImpl;

public class userServiceImpl implements userService {

	userDao user = new userDaoImpl();

	@Override
	public String Register(String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		// TODO Auto-generated method stub
		return user.Register(loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
	}
	
	@Override
	public String Register1(String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		// TODO Auto-generated method stub
		return user.Register1(loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
	}

	@Override
	public String Login(String loginName, String Password) throws SQLException {
		// TODO Auto-generated method stub
		return user.Login(loginName, Password);
	}

	@Override
	public User getUserInfo(String loginName, String Password) throws SQLException {
		// TODO Auto-generated method stub
		return user.getUserInfo(loginName, Password);
	}

	@Override
	public ArrayList<User> getAllUser() throws SQLException {
		// TODO Auto-generated method stub
		return user.getAllUser();
	}

	@Override
	public User getAidInfo(String aId) throws SQLException {
		// TODO Auto-generated method stub
		return user.getAidInfo(aId);
	}

	@Override
	public String upUserInfo(String aId, String loginName, String trueName, String niceName, String Password, String Email,
			String phoneNumber, String idNumber, String lendNum, String maxNum) throws SQLException {
		// TODO Auto-generated method stub
		return user.upUserInfo(aId, loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
	}
	@Override
	public String upUserInfo1(String aId,String trueName,String Email) throws SQLException {
		// TODO Auto-generated method stub
		return user.upUserInfo1(aId,trueName,Email);
	}
	@Override
	public String delUserInfo(String aId) throws SQLException {
		// TODO Auto-generated method stub
		return user.delUserInfo(aId);
	}

	@Override
	public String LoginPhone(String phoneNumber, String Password) throws SQLException {
		// TODO Auto-generated method stub
		return user.LoginPhone(phoneNumber, Password);
	}

	@Override
	public User getUserInfoPhone(String loginName, String password) throws SQLException {
		// TODO Auto-generated method stub
		return user.getUserInfoPhone(loginName, password);
	}

	@Override
	public User LoginCodePhone(String phoneNumber) throws SQLException {
		// TODO Auto-generated method stub
		return user.LoginCodePhone(phoneNumber);
	}

	@Override
	public String IdNumber(String IDNumber) throws SQLException {
		// TODO Auto-generated method stub
		return user.IDNumber(IDNumber);
	}

	@Override
	public String chUserPassword(String loginName, String Password) throws SQLException {
		// TODO Auto-generated method stub
		return user.chUserPassword(loginName, Password);
	}

	@Override
	public User LoginCode(String loginName) throws SQLException {
		// TODO Auto-generated method stub
		return user.LoginCode(loginName);
	}

	@Override
	public User getAidInfo2(String aId) throws SQLException {
		// TODO Auto-generated method stub
		return user.getAidInfo2(aId);
	}

	@Override
	public String upUserInfo2(String aId, String phoneNumber) throws SQLException {
		// TODO Auto-generated method stub
		return user.upUserInfo2(aId,phoneNumber);
	}

}
