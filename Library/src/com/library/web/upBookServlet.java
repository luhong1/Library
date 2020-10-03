package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.extra.spath.Step;

import com.library.service.bookService;
import com.library.service.bookServiceImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;
/**
 * 
 * @author LENOVO
 * 更新书籍信息 */
@WebServlet("/upBookServlet")
public class upBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
		 * Constructor of the object.
		 */
	public upBookServlet() {
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

		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//修改的信息
		int bId=Integer.valueOf(request.getParameter("bId"));
		String bookNo = request.getParameter("bookNo");
		String bookName = request.getParameter("bookName");
		String bookSort = request.getParameter("bookSort");
		String Author = request.getParameter("Author");
		String Press = request.getParameter("Press");
		String bookPrice = request.getParameter("bookPrice");
		String type = request.getParameter("type");
		int bookNum = Integer.parseInt(request.getParameter("bookNum"));
		System.out.println(bookNum);
		
		bookService bService = new bookServiceImpl();
		try {
			String string=bService.updateBook(bId,bookNo, bookName, bookSort, Author, Press, bookPrice, type, bookNum);
			 if(string.equals("1")){
					renderData(response, "1");
					return;
					 }else{
						 renderData(response, "-4");
							return; 
					 }
			//response.sendRedirect(location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void renderData(HttpServletResponse response, String data) {
		try {
			response.setContentType("text/plain;charset=utf-8");
			response.getWriter().write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
