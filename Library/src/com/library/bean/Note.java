package com.library.bean;
/**
 * 读者对书籍做的笔记
 */
public class Note {

	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private String aId;//用户id
	private String loginName;//登录账号
	private String trueName;//用户姓名
	private String niceName;//用户别名
	
	
	private String bId;//图书id
	private String bookNo;//图书编号
	private String bookName;//图书名称
	
	
	private String noteTime;//批注时间
	private String noteContent;//批注内容



	public String getNoteTime() {
		return noteTime;
	}



	public void setNoteTime(String noteTime) {
		this.noteTime = noteTime;
	}



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



	public String getbId() {
		return bId;
	}



	public void setbId(String bId) {
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



	public String getNoteContent() {
		return noteContent;
	}



	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	
	
	
	
	
	
}
