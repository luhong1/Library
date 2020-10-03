package com.library.bean;
/**
 * 图书分类的数据表的bean类
 */
public class Type {

	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int tId;//分类的id
	private String name;//分类的名称
	
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
}
