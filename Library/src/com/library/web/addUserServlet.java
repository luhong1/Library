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
import com.library.utils.ID;
/**
 * 
 * @author LENOVO
 * 增加用户
 */
@WebServlet("/addUserServlet")
public class addUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
		 * Constructor of the object.
		 */
	public addUserServlet() {
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
		
		String loginName = null;
		String trueName = null;
		String niceName = null;
		String Password = null;
		String Email = null;
		String phoneNumber = null;
		String idNumber = null;
		String lendNum = null;
		String maxNum = null;
		String flag=request.getParameter("add");
		userService uService = new userServiceImpl();
		if(flag.equals("1")){
			String admin=request.getParameter("admin");
			 loginName = request.getParameter("username");
			 trueName = request.getParameter("name");
			 niceName = request.getParameter("name");
			 Password = request.getParameter("password");
			 Email = request.getParameter("addemail");
			 phoneNumber = request.getParameter("phone");
			 idNumber = request.getParameter("addID");
			 lendNum = request.getParameter("lend_num");
			 maxNum = request.getParameter("max_num"); 
			
			try {
				ID sId=new ID();
				 boolean str=sId.verify(idNumber);
				 if(str==false){
					 renderData(response, "-2");
						return; 
				 }else{
					 if(!admin.equals("1")){
				String string=uService.Register(loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
				  if(string.equals("注册成功")){
					  renderData(response, "1");
						return; 
				  } 
				  if(string.equals("注册失败")){
					  renderData(response, "-4");
						return; 
				  } 
				 if(string.equals("-2")){
					  renderData(response, "-5");
						return; 
				}
				 if(string.equals("-3")){
					  renderData(response, "-6");
						return; 
				}
				 if(string.equals("-4")){
					  renderData(response, "-7");
						return; 
				}
				 }else{
					 String string=uService.Register1(loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
					  if(string.equals("注册成功")){
						  renderData(response, "1");
							return; 
					  } 
					  if(string.equals("注册失败")){
						  renderData(response, "-4");
							return; 
					  } 
					 if(string.equals("-2")){
						  renderData(response, "-5");
							return; 
					}
					 if(string.equals("-3")){
						  renderData(response, "-6");
							return; 
					}
					 if(string.equals("-4")){
						  renderData(response, "-7");
							return; 
					}
				 }
			}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			 loginName = request.getParameter("loginName");
			 trueName = request.getParameter("trueName");
			 niceName = request.getParameter("niceName");
			 Password = request.getParameter("Password");
			 Email = request.getParameter("Email");
			 phoneNumber = request.getParameter("phoneNumber");
			 idNumber = request.getParameter("idNumber");
			 lendNum = request.getParameter("lendNum");
			 maxNum = request.getParameter("maxNum");
		try {
			uService.Register(loginName, trueName, niceName, Password, Email, phoneNumber, idNumber, lendNum, maxNum);
			//response.sendRedirect(location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
