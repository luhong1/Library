package com.library.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.bean.Book;
import com.library.bean.User;
import com.library.service.bookService;
import com.library.service.bookServiceImpl;
import com.library.service.noteService;
import com.library.service.noteServiceImpl;
import com.library.service.remarkService;
import com.library.service.remarkServiceImpl;
import com.library.service.userService;
import com.library.service.userServiceImpl;

/**
 * Servlet implementation class information
 */
@WebServlet("/information")
public class information extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public information() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("textml;charset=UTF-8");
		
		bookService bookService = new bookServiceImpl();
		remarkService remarkService = new remarkServiceImpl();
		userService userService=new userServiceImpl();
		
		//区别借书和换书功能,flag=1借书，其他为还书
		int information = Integer.parseInt(request.getParameter("information"));
		HttpSession session = request.getSession();
		String remarkContent=request.getParameter("textarea1");
		String aId = (String) session.getAttribute("aId");
		int bId = Integer.parseInt(request.getParameter("bId"));
		Book book=new Book();
		User user = new User();
		try {
			book=bookService.getBookInfo(bId);
				user = userService.getAidInfo2(aId);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		System.out.println(information);
		if(information ==0){
			try {
                String string=remarkService.addSpeech(book, user, remarkContent);
                if(string.equals("1")){
                renderData(response,"1");
				return;
                }else{
                	renderData(response,"-4");
    				return;
                }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		if(information==1){	
		noteService noteService=new noteServiceImpl();
		try {
			String string1=noteService.addSpeech(book, user, remarkContent);
			  if(string1.equals("1")){
	                renderData(response,"1");
					return;
	                }else{
	                	renderData(response,"-4");
	    				return;
	                }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
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

