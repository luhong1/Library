package com.library.dao;

import java.sql.SQLException;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		userDao userDao = new userDaoImpl();
		bookDao bookDao = new bookDaoImpl();

		// 添加图书信息测试成功
//		System.out.println("请输入需要添加图书的各项信息,按照图书编号，图书姓名、图书类型、图书作者、图书出版社，图书价格的顺序填写:");
//		int bId = sc.nextInt();// 图书id
//		int bookNo = sc.nextInt();// 图书编号
//		String bookName = sc.next();// 图书名称
//		String bookSort =  sc.next();// 图书类型
//		String Author = sc.next();// 图书作者
//		String Press =  sc.next();// 图书出版社
//		int bookPrice = sc.nextInt();// 图书价格
//		String type = sc.next();// 图书的分类
//		int bookNum = sc.nextInt();// 图书数量
//		bookDao.addBook(bId, bookNo, bookName, bookSort, Author, Press, bookPrice, type, bookNum);
		
		//
		// bookDao.addBook(bookNo, bookName, bookSort, Author, Press,
		// bookPrice);

//		// 登录测试通过
//		 System.out.println("请输入学号：");
//		 Integer loginName = sc.nextInt();
//		 System.out.println("请输入密码：");
//		 String Password = sc.next();
//		 userDao.Login(loginName, Password);
		//

		// 注册通过

		 //userDao.Register(2017441575, "谢金桥", "xjq", "123456","1111", 2222, 3333, 30, 5);
	}

}
