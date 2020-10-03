package com.library.bean;
/**
 * 
 * @author LENOVO
 * 书籍bean类
 */
public class Book {
	
	
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String bId;//图书id
	private String bookNo;//图书编号
	private String bookName;//图书名称
	private String bookSort;//图书类型
	private String Author;//图书作者
	private String Press;//图书出版社
	private String bookPrice;//图书价格
	private String type;//图书的分类
	private int bookNum;//图书数量
	
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
	public String getBookSort() {
		return bookSort;
	}
	public void setBookSort(String bookSort) {
		this.bookSort = bookSort;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getPress() {
		return Press;
	}
	public void setPress(String press) {
		Press = press;
	}
	public String getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(String bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	
	
}
