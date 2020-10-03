package com.library.bean;
/**
 * 
 * @author LENOVO
 * 用户数据表的bean类 
 */
public class User {
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	private String aId;//用户id,用学号代替
	private String loginName;//登录账号（用学号代替)
	private String trueName;//用户姓名
	private String niceName;//用户别名
	private String Password;//用户密码
	private String Email;//用户注册邮箱(用于找回密码)
	private String phoneNumber;//用户手机号
	private String idNumber;//用户身份证号 (初始密码为后6位)
	private String lendNum;//可借阅天数
	private String maxNum;//最大可借数
	private int Status;//用来判断是管理员还是用户，用户的值为1，管理员为2
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getNiceName() {
		return niceName;
	}
	public void setNiceName(String niceName) {
		this.niceName = niceName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getLendNum() {
		return lendNum;
	}
	public void setLendNum(String lendNum) {
		this.lendNum = lendNum;
	}
	public String getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(String maxNum) {
		this.maxNum = maxNum;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	
	
	

}
