  package com.library.web;

import java.io.IOException;
/**
 * 借书和还书
 */
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.bean.User;
import com.library.service.bookService;
import com.library.service.bookServiceImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;
@WebServlet("/borServlet")
public class borServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
		 * Constructor of the object.
		 */
	public borServlet() {
		super();
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
		
		bookService bookService = new bookServiceImpl();
		userService userService = new userServiceImpl();
		
		
		//区别借书和换书功能,flag=1借书，其他为还书
		int flag = Integer.parseInt(request.getParameter("flag"));
		System.out.println(flag);
		if(flag == 1){
			//借书,获取用户id和图书id
			
			HttpSession session = request.getSession();
			
			String aId = (String) session.getAttribute("aId");
			int bId = Integer.parseInt(request.getParameter("bId"));
			User user = new User();
			try {	
				user = userService.getAidInfo2(aId);
				bookService.borrowBook(bId, user);
				response.sendRedirect("http://120.26.187.198:8080/Library/user_jsp/borrow.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		if(flag==2){
			//还书  获取借阅历史id
			int hId = Integer.parseInt(request.getParameter("hId"));
			
			//区分管理员和用户界面,room=1表示用户界面,其他为管理员界面
			int room = Integer.parseInt(request.getParameter("room"));
			if(room == 1){
				//用户还书
				try {
					bookService.returnBook(hId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("http://120.26.187.198:8080/Library/user_jsp/return.jsp");
			}else{
//				管理员界面
				try {
					bookService.returnBook(hId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("http://120.26.187.198:8080/Library/admin_jsp/admin_borrow.jsp");
			}
			
		}
		if(flag==3){
			//还书  获取借阅历史id
			int hId = Integer.parseInt(request.getParameter("hId"));
			
			//区分管理员和用户界面,room=1表示用户界面,其他为管理员界面
			int room = Integer.parseInt(request.getParameter("room"));
			if(room == 1){
				//用户还书
				try {
					bookService.returnBook(hId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("http://120.26.187.198:8080/Library/user_jsp/User.jsp");
			}else{
//				管理员界面
				try {
					bookService.returnBook(hId);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("http://120.26.187.198:8080/Library/admin_jsp/admin_borrow.jsp");
			}
			
		}
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

		
		
	}
}
