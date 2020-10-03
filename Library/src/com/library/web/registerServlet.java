package com.library.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.library.bean.User;
import com.library.dao.userDao;
import com.library.dao.userDaoImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;
import com.library.utils.ID;

/**
 * @author LENOVO
 * 注册功能的业务逻辑层
 * 在做数据查询时，建议用Get方式；而在做数据添加、修改或删除时，建议用Post方式
 */
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		userService uService = new userServiceImpl();
		String loginName=request.getParameter("mobile");
		String trueName = request.getParameter("name");
		String niceName = request.getParameter("name");
		String password = request.getParameter("password");
		String idNumber=request.getParameter("ID");
		String Email = null;
		String phoneNumber  = request.getParameter("mobile");
		String verifyCode = request.getParameter("verifyCode");
		String lendNum = "30";
		String maxNum = "5";
		JSONObject json = (JSONObject)request.getSession().getAttribute("verifyCode1");
		if(json == null){
			renderData(response, "验证码错误");
			return ;
		}
		if(!json.getString("mobile").equals(phoneNumber)){
			renderData(response, "手机号错误");
			return ;
		}
		 ID sId=new ID();
		 boolean string=sId.verify(idNumber);
		 System.out.println(string);
		 if(string==false){
			 renderData(response, "IDfalse");
				return; 
		 }
		if(!json.getString("verifyCode").equals(verifyCode)){
			renderData(response, "验证码错误");
			return ;
		}
		if((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60){
			renderData(response, "验证码已过期");
			return ;
		}
		//其他业务代码
		
		try {
		String result=uService.IdNumber(idNumber);
		 if(result=="1"){
			 renderData(response,"-2");
				return ;
		 }
		 if(result=="-1"){
		User user2 = uService.LoginCodePhone(phoneNumber);
		if(user2.getPhoneNumber()!=null) {
			System.out.println(user2.getLoginName());
			renderData(response,"-1");
			return ;
		}
		if(user2.getPhoneNumber()==null){
		userDao uDao = new userDaoImpl();
			uDao.Register(loginName, trueName, niceName, password, Email, phoneNumber, idNumber, lendNum, maxNum);
			renderData(response, "success");
			return ;
			//response.sendRedirect();
		
		}}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void renderData(HttpServletResponse response, String data){
		try {
			response.setContentType("text/plain;charset=utf-8");
			response.getWriter().write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	}


