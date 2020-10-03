package com.library.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.User;

public interface userService {
	    //用户（读者）注册
		String Register(String loginName,String trueName,String niceName,String Password,String Email, String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
		
		//管理员注册
	    String Register1(String loginName,String trueName,String niceName,String Password,String Email, String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
				
		//用户登录;
		String Login(String loginName,String Password)throws SQLException;
		String LoginPhone(String phoneNumber,String Password)throws SQLException;
		User LoginCodePhone(String phoneNumber)throws SQLException;
		//根据传入的账号，密码，来查找用户信息;
		User getUserInfo(String loginName,String Password)throws SQLException;
		
		//获取全部用户的信息（没有管理员） 管理员功能
		ArrayList<User> getAllUser()throws SQLException;
		
		//根据用户id查找单一用户信息 管理员功能
		User getAidInfo(String aId)throws SQLException;
		
		User getAidInfo2(String aId)throws SQLException;
		//修改读者信息  管理员功能
		String upUserInfo(String aId,String loginName,String trueName,String niceName,String Password,String Email,String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
		
		String upUserInfo1(String aId,String trueName,String Email)throws SQLException;
		
		String upUserInfo2(String aId,String phoneNumber)throws SQLException;
		//根据用户id删除用户信息 管理员功能
		String delUserInfo(String aId)throws SQLException;
		
        //根据手机号码和密码进行登录
		User getUserInfoPhone(String loginName, String password)throws SQLException;
		
		//验证身份证号是否存在
		String IdNumber(String IDNumber)throws SQLException;
		
		//修改密码
		String chUserPassword(String loginName,String Password)throws SQLException;
		
		//验证是否存在该账号
		User LoginCode(String loginName)throws SQLException;
		
}
