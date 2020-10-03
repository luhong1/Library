package com.library.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.bookService;
import com.library.service.bookServiceImpl;

/**
 * 
 * @author LENOVO 增加图书
 */
@WebServlet("/addBookServlet")
public class addBookServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addBookServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置编码类型
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//获取添加的图书信息
		String bookNo = request.getParameter("bookNo");
		String bookName = request.getParameter("bookName");
		String bookSort = request.getParameter("bookSort");
		String Author = request.getParameter("Author");
		String Press = request.getParameter("Press");
		String bookPrice = request.getParameter("bookPrice");
		String type = request.getParameter("type");
		int bookNum = Integer.parseInt(request.getParameter("bookNum"));
		
		bookService bService = new bookServiceImpl();
		try {
			String string=bService.addBook(bookNo, bookName, bookSort, Author, Press, bookPrice, type, bookNum);
			 if(string.equals("1")){
			renderData(response, "1");
			return;
			 }else{
				 renderData(response, "-4");
					return; 
			 }
			//返回增加图书界面
			//response.sendRedirect(location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */

	private void renderData(HttpServletResponse response, String data) {
		try {
			response.setContentType("text/plain;charset=utf-8");
			response.getWriter().write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
