package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.library.bean.User;
import com.library.dao.userDao;
import com.library.dao.userDaoImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;
import com.library.utils.loginStudent;

/**
 * 
 * @author LENOVO 登录
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public loginServlet() {
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
		// 设置utf-8文本
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
          
		// 获取账号密码
		String loginName = request.getParameter("loginName");
		String Password = request.getParameter("password");
		User user = new User();
       JSONObject jsonObject=new JSONObject();
		userService uService = new userServiceImpl();
		HttpSession session=request.getSession();
		if(loginName.length()<11){
		try {
			String result = uService.Login(loginName, Password);
			if (result == "登录成功") {
				// 查找用户信息
				user = uService.getUserInfo(loginName, Password);
				String sessionId = session.getId();
				// 将回写给浏览器的Cookie覆盖，设置上有效期，那么这个session也就有有效期了
				Cookie cookie = new Cookie("JSESSIONID", sessionId);
				cookie.setPath("/Library");
				// 设置有效期为30分钟
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);
				session.setAttribute("aId",user.getaId());    
				// 判断是读者还是管理员
				if (user.getStatus() == 1) {// 用户
					jsonObject.put("statu","1");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
					return;
					// 进入用户界面
					// response.sendRedirect(location);

				} else if(user.getStatus() ==2) {
					jsonObject.put("statu","2");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
					return;
					// 管理员
					// 进入管理员界面
					// response.sendRedirect(location);
				}

			}  
		if(result == "密码错误"){
			jsonObject.put("statu","-1");
			String objStr = JSONObject.toJSONString(jsonObject);
			renderData(response,objStr);
				  return;
			}
		if(result == "登录失败") {
		 loginStudent student=new loginStudent();
		  user=student.loginStudent(loginName, Password);
		  if(user.getLoginName()==null){
			  jsonObject.put("statu","-1");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			  return;
		  }
		  if(user!=null){
			  userDao uDao = new userDaoImpl();
			 String string=uDao.Register(user.getLoginName(),user.getTrueName(),user.getNiceName(),Password,user.getEmail(),user.getPhoneNumber(),user.getIdNumber(), user.getLendNum(),user.getMaxNum());
			  session.setAttribute("aId",user.getLoginName());
			  jsonObject.put("statu","1");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			  return;
		  } 
		 
				// 登录失败,返回登录界面
				// response.sendRedirect(location);
	     
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else{
			try {
				String result = uService.LoginPhone(loginName, Password);
				if (result == "登录成功") {
					// 查找用户信息
					user = uService.getUserInfoPhone(loginName, Password);
					String sessionId = session.getId();
					// 将回写给浏览器的Cookie覆盖，设置上有效期，那么这个session也就有有效期了
					Cookie cookie = new Cookie("JSESSIONID", sessionId);
					cookie.setPath("/Library");
					// 设置有效期为30分钟
					cookie.setMaxAge(60 * 60);
					response.addCookie(cookie);
					 session.setAttribute("aId",user.getLoginName());
                     //System.out.println(user.getStatus());
					// 判断是读者还是管理员
					if (user.getStatus() == 1) {// 用户
						  jsonObject.put("statu","1");
							String objStr = JSONObject.toJSONString(jsonObject);
							renderData(response,objStr);
						return;
						// 进入用户界面
						// response.sendRedirect(location);

					} else {
						  jsonObject.put("statu","2");
							String objStr = JSONObject.toJSONString(jsonObject);
							renderData(response,objStr);
						return;
						// 管理员
						// 进入管理员界面
						// response.sendRedirect(location);
					}

				}
               if(result=="密码错误"){
            	   jsonObject.put("statu","-1");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
					return;
				}
               if(result=="登录失败"){
            	   jsonObject.put("statu","-3");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		userService uService = new userServiceImpl();
		User user=new User();
		String mobile = request.getParameter("mobile");
		System.out.println(mobile);
		//System.out.println(mobile);
		String verifyCode = request.getParameter("verifyCode");
		JSONObject json = (JSONObject)request.getSession().getAttribute("verifyCode1");
		JSONObject jsonObject=new JSONObject();
		HttpSession session=request.getSession();
		if(json == null){
			  jsonObject.put("statu","-4");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			return ;
		}
		if(!json.getString("mobile").equals(mobile)){
			  jsonObject.put("statu","-5");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			return ;
		}
		if(!json.getString("verifyCode").equals(verifyCode)){
			  jsonObject.put("statu","-6");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			return ;
		}
		if((System.currentTimeMillis() - json.getLong("createTime")) > 3*1000 * 60){
			  jsonObject.put("statu","-7");
				String objStr = JSONObject.toJSONString(jsonObject);
				renderData(response,objStr);
			return ;
		}
		
		try {
			User user2 = uService.LoginCodePhone(mobile);
		if (user2!=null) {
			System.out.println(user2.getPassword());
            System.out.println(user2.getStatus());
            String sessionId = session.getId();
			// 将回写给浏览器的Cookie覆盖，设置上有效期，那么这个session也就有有效期了
			Cookie cookie = new Cookie("JSESSIONID", sessionId);
			cookie.setPath("/Library");
			// 设置有效期为30分钟
			cookie.setMaxAge(60 * 30);
			response.addCookie(cookie);
   		 session.setAttribute("aId",user2.getLoginName());
			// 判断是读者还是管理员
			if (user2.getStatus() == 1) {// 用户
				  jsonObject.put("statu","1");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
				return;
			} else {
				  jsonObject.put("statu","2");
					String objStr = JSONObject.toJSONString(jsonObject);
					renderData(response,objStr);
				return;
				// 管理员
				// 进入管理员界面
				// response.sendRedirect(location);
			}

		}
       if(user2==null){
    	   jsonObject.put("statu","-3");
			String objStr = JSONObject.toJSONString(jsonObject);
			renderData(response,objStr);
			return;
       }
       } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	protected void renderData(HttpServletResponse response, String data){
		try {
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
