package com.library.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.library.bean.User;
import com.library.service.userService;
import com.library.service.userServiceImpl;
import com.library.utils.ID;

/**
 * Servlet implementation class chUserPassword
 */
@WebServlet("/chUserPassword")
public class chUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chUserPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		userService uService = new userServiceImpl();
		String phoneNumber=null;
		String verifyCode=null;
		// 获取账号密码
		// String loginName = request.getParameter("loginName");
		String Password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String repassword = request.getParameter("repassword");
		HttpSession session=request.getSession();
		String loginName=(String)session.getAttribute("aId");
		if (repassword.equals("1")) {
			 phoneNumber = request.getParameter("mobile");
			 verifyCode = request.getParameter("verifyCode");
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
		}		
		try {
			if(Password.equals(password1)){
				renderData(response, "-8");
				return;
			}
			System.out.println(repassword);
			System.out.println(loginName);
			if (loginName.length() < 11) {
				User user = uService.LoginCode(loginName);
				if (user.getLoginName() != null) {
							if (repassword.equals("0")) {
								if (!user.getPassword().equals(Password)) {
									renderData(response, "-5");
									return;
								}
								if (user.getPassword().equals(Password)) {
									String result = uService.chUserPassword(loginName, password1);
									if (result == "-1") {
										renderData(response, "-4");
										return;
									}
									if (result == "1") {
										renderData(response, "1");
										return;
									}
								}
							} else {
								if (user.getPhoneNumber().length() < 1) {
									renderData(response, "-8");
									return;
								} else{
								if (user.getPhoneNumber().equals(phoneNumber)) {
								String result = uService.chUserPassword(loginName, password1);
								if (result == "-1") {
									renderData(response, "-4");
									return;
								}
								if (result == "1") {
									renderData(response, "1");
									return;
								}
							}else {
								renderData(response, "-6");
								return;
							}
						} 
							}
				} else {
					renderData(response, "-7");
					return;
				}
			}else{
				if (!loginName.equals(phoneNumber)) {
					renderData(response, "-6");
					return;
				}
				if (loginName.equals(phoneNumber)) {
					User user2 = uService.LoginCodePhone(loginName);
					System.out.println(user2.getPassword());
					if (repassword.equals("0")) {
						if (!user2.getPassword().equals(Password)) {
							System.out.println(user2.getPassword());
							renderData(response, "-5");
							return;
						} else {
							String result = uService.chUserPassword(loginName, password1);
							if (result == "-1") {
								renderData(response, "-4");
								return;
							}
							if (result == "1") {
								renderData(response, "1");
							}
						}
					} else {
						if (user2.getPhoneNumber() != null) {
							String result = uService.chUserPassword(loginName, password1);
							if (result == "-1") {
								renderData(response, "-4");
								return;
							}
							if (result == "1") {
								renderData(response, "1");
							}
						} else {
							renderData(response, "-7");
							return;
						}
					}
				}
			}
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
