package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.userService;
import com.library.service.userServiceImpl;
/**
 * 
 * @author LENOVO
 * 更新用户信息 */
@WebServlet("/upUserServlet")
public class upUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
		 * Constructor of the object.
		 */
	public upUserServlet() {
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
		String aId = request.getParameter("aId1");
		String loginName = request.getParameter("loginName1");
		String trueName = request.getParameter("trueName1");
		String niceName = request.getParameter("niceName1");
		String Password = request.getParameter("Password1");
		String Email = request.getParameter("Email1");
		String phoneNumber = request.getParameter("phoneNumber1");
		String idNumber = request.getParameter("idNumber1");
		String lendNum = request.getParameter("lendNum1");
		String maxNum = request.getParameter("maxNum1");
		
		userService uService = new userServiceImpl();
		
		try {
			String string=uService.upUserInfo(aId, loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
			 if(string.equals("1")){
					renderData(response, "1");
					return;
					 }
			 if(string.equals("-1")){
						 renderData(response, "-4");
							return; 
					 }
			 if(string.equals("-2")){
				 renderData(response, "-2");
					return; 
			 }
			//response.sendRedirect(location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
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
