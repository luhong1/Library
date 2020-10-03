package com.library.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.library.bean.User;

/**
 * 
 * @author LENOVO
 * 用户类的数据层接口，用于连接数据库进行操作数据
 */
public interface userDao {
	//用户（读者）注册
	String Register(String loginName,String trueName,String niceName,String Password,String Email, String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
	
	//管理员注册
	String Register1(String loginName,String trueName,String niceName,String Password,String Email, String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
		
	//用户登录;
	String Login(String loginName,String Password)throws SQLException;
	//查询该账号是否存在
	String select(String loginName) throws SQLException;
	//根据传入的账号，密码，来查找用户信息;
	User getUserInfo(String loginName,String Password)throws SQLException;
	
	//获取全部用户的信息（没有管理员） 管理员功能
	ArrayList<User> getAllUser()throws SQLException;
	
	//根据用户id查找单一用户信息 管理员功能
	User getAidInfo(String aId)throws SQLException;
	
	User getAidInfo2(String aId)throws SQLException;
	//修改读者信息  管理员功能
	String upUserInfo(String aId,String loginName,String trueName,String niceName,String Password,String Email,String phoneNumber,String idNumber,String lendNum,String maxNum)throws SQLException;
	
	//根据aid实现修改邮箱和姓名的功能
	String upUserInfo1(String aId,String trueName,String Email)throws SQLException;
	
	//根据aid实现修改邮箱和姓名的功能
	String upUserInfo2(String aId,String phoneNumber)throws SQLException;
	//修改密码
	String chUserPassword(String loginName,String Password)throws SQLException;

	//根据用户id删除用户信息 管理员功能
	String delUserInfo(String aId)throws SQLException;
    
	//根据用户手机号和密码进行登录
	String LoginPhone(String phoneNumber, String password)throws SQLException;
	
	//根据传入的手机号，密码，来查找用户信息;
	User getUserInfoPhone(String phoneNumber,String Password)throws SQLException;
   
	//根据传入的手机号进行登录，实现验证码登录;
	User LoginCodePhone(String phoneNumber)throws SQLException;
	
	//验证是否存在该账号
	User LoginCode(String loginName)throws SQLException;
	
	//验证身份证号是否已注册
	String IDNumber(String IDNumber)throws SQLException;
    
	//验证手机号是否已注册
	String PhoneNumber(String PhoneNumber)throws SQLException;
}
