package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.bookService;
import com.library.service.bookServiceImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;

/**
 * 
 * @author LENOVO
 * 删除图书
 */
@WebServlet("/delBookServlet")
public class delBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
		 * Constructor of the object.
		 */
	public delBookServlet() {
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
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		System.out.println(bId);
		bookService bookService = new bookServiceImpl();
		try {
			bookService.delBookByNo(bId);
			
			//response.sendRedirect(location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		response.sendRedirect("http://120.26.187.198:8080/Library/admin_jsp/admin_book.jsp");
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
