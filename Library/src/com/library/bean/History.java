package com.library.bean;
/**
 * 
 * @author LENOVO
 * 借阅记录数据表的bean类
 */
public class History {
	
	public History() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int hId;//借阅记录的id
	private int aId;//读者的id
	private int bId;//图书的id
	private String bookNo;//图书号
	private String bookName;//图书名称
	private String loginName;//读者的账号
	private String trueName;//读者的姓名
	private String beginTime;//借阅时间
	private String endTimemax;//借阅时间
	private String endTime;//还书时间
	private int Status;//借阅状态，1为正在借阅，2是已经还书
	public String getEndTimemax() {
		return endTimemax;
	}
	public void setEndTimemax(String endTimemax) {
		this.endTimemax = endTimemax;
	}
	public int gethId() {
		return hId;
	}
	public void sethId(int hId) {
		this.hId = hId;
	}
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	
	
	
}
