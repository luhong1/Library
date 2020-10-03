package com.library.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.library.bean.Book;
import com.library.service.bookService;
import com.library.service.bookServiceImpl;

@WebServlet("/selServlet")
public class selServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public selServlet() {
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
		//查询书籍
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
	
		
		bookService bService = new bookServiceImpl();
		String bookName = request.getParameter("bookName");
		String flag=request.getParameter("flag");
		if(flag.equals("2")){
			String txtName=request.getParameter("txtName");
			System.out.println(txtName);
			//将获取的书籍信息存于一个二维数组里面
			try {
				ArrayList<Book> data = bService.getBookName1(txtName);
				JSONArray ja=new JSONArray();
				ja = JSON.parseArray(JSONObject.toJSONString(data));
				renderData(response,ja.toString());
				return;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			//区分用户和管理员,label=1表示管理员界面
			int label = Integer.parseInt(request.getParameter("label"));
		try {
		
			//将获取的书籍信息存于一个二维数组里面
			ArrayList<Book> data = bService.getBookName(bookName);
			request.setAttribute("data", data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url = "";
		//转发不同的界面
		if(label == 1){
			//管理员
			url = response.encodeURL("");
		}else{
			//用户
			url = response.encodeURL("");
		}
		
		//转发请求
	    request.getRequestDispatcher(url).forward(request, response);
		
	}}

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

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	protected void renderData(HttpServletResponse response, String data){
		try {
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
