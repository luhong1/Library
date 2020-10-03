package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.library.bean.User;
import com.library.service.bookService;
import com.library.service.bookServiceImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;
@WebServlet("/adminServlet")
/**
 * 
 * @author LENOVO
 * 管理员功能（修改密码和修改个人信息）
 */
public class adminServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
		 * Constructor of the object.
		 */
	public adminServlet() {
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
		//设置编码类型
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
	    userService userService = new userServiceImpl();
		//获取存储到session的aId
		String aId = (String) session.getAttribute("aId");
		String phoneNumber=null;
		String verifyCode=null;
			//获取需要修改的信息
			String trueName = request.getParameter("trueName");
			String Email = request.getParameter("Email");
			String flag = request.getParameter("flag");
			if(flag.equals("1")){
				 phoneNumber = request.getParameter("mobile");
				 verifyCode = request.getParameter("code");
				JSONObject json = (JSONObject) request.getSession().getAttribute("verifyCode1");
				if (json == null) {
					renderData(response, "-4");
					return;
				}
				if (!json.getString("mobile").equals(phoneNumber)) {
					renderData(response, "-2");
					return;
				}
				if (!json.getString("verifyCode").equals(verifyCode)) {
					renderData(response, "-1");
					return;
				}
				if ((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60) {
					renderData(response, "-3");
					return;
				}
				String result;
				try {
					result = userService.upUserInfo2(aId,phoneNumber);
				
				   if(result.equals("1")){
					   renderData(response, "1");
						return;
				   }else{
					   renderData(response, "-4");
						return;
				   }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
			try {
				String result=userService.upUserInfo1(aId, trueName, Email);
			   if(result.equals("1")){
				   renderData(response, "1");
					return;
			   }else{
				   renderData(response, "-4");
					return;
			   }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
