package com.library.utils;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.Gson;


  //验证码
/**
 * Servlet implementation class PhoneCodeServlet
 */
public class PhoneCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    public PhoneCodeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 String mobile = request.getParameter("mobile");		
			JSONObject json = null;
			//生成6位验证码
			 String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
			 System.out.println(mobile);
			//发送短信
			// 短信验证测试方法
//			HttpClient client = new HttpClient();
//			//向http://gbk.sms.webchinese.cn发送请求
//			PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
//			// 在头文件中设置转码
//			post.addRequestHeader("Content-Type",
//					"application/x-www-form-urlencoded;charset=gbk");
//			//NameValuePair是简单名称值对节点类型。多用于Java像url发送Post请求
//			//设置表单元素，和填值
//			NameValuePair[] data = { new NameValuePair("Uid", "lulin"),
//					new NameValuePair("Key", "d41d8cd98f00b204e9"),
//					new NameValuePair("smsMob", mobile),
//					new NameValuePair("smsText", "验证码："+verifyCode+",请保管好您的验证码!") };
//			
//			// 将表单的值放入postMethod中
//			post.setRequestBody(data);
//			
//			client.executeMethod(post);
//			Header[] headers =post.getRequestHeaders();
//			int statusCode=post.getStatusCode();
//			System.out.println("statusCode:"+statusCode);
//			for(Header header :headers){
//				System.out.println(header.toString());
//			}
//			String result=new String(post.getResponseBodyAsString().getBytes("gbk"));
//	        System.out.println(result); //打印返回消息状态
//	        int s=Integer.parseInt(result);
//	        
//	        //释放连接。无论执行方法是否成功，都必须释放连接
//	        post.releaseConnection();
//			if(s<1){//发送短信失败
//				renderData(response, "出错");
//				return; 
//			}
	
//		     SendSmsResponse message=sendSms();
//		     System.out.println(message.getMessage());
//		     if(!message.getMessage().equals("OK")){
//		    	 renderData(response, "出错");
//				return; 
//		     }
			
		SendSms sendSms=new SendSms();
		String message=sendSms.SendSms(mobile, verifyCode);
		 if(!message.equals("OK")){
	    	 renderData(response, "出错");
		return; 
	     }
			//将验证码存到session中,同时存入创建时间
			//以json存放，这里使用的是阿里的fastjson
			System.out.println(verifyCode);
			json = new JSONObject();
			json.put("mobile", mobile);
			json.put("verifyCode", verifyCode);
			json.put("createTime", System.currentTimeMillis());
			// 将认证码存入SESSION
			request.getSession().setAttribute("verifyCode1", json);  
			renderData(response, "success");
			return ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		renderData(response, "fail");
	}

	/**
	 *
	 * 
	 * )
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			 String mobile = request.getParameter("mobile");
			String ID = request.getParameter("Id");
			 ID sId=new ID();
			 boolean string=sId.verify(ID);
			 System.out.println(string);
			 if(string==false){
				 renderData(response, "IDfalse");
					return; 
			 }
			JSONObject json = null;
			//生成6位验证码
			String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
//			//发送短信
//			// 短信验证测试方法
//			HttpClient client = new HttpClient();
//			//向http://gbk.sms.webchinese.cn发送请求
//			PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
//			// 在头文件中设置转码
//			post.addRequestHeader("Content-Type",
//					"application/x-www-form-urlencoded;charset=gbk");
//			//NameValuePair是简单名称值对节点类型。多用于Java像url发送Post请求
//			//设置表单元素，和填值
//			NameValuePair[] data = { new NameValuePair("Uid", "lulin"),
//					new NameValuePair("Key", "d41d8cd98f00b204e9"),
//					new NameValuePair("smsMob", mobile),
//					new NameValuePair("smsText", "验证码："+verifyCode+",请保管好您的验证码!") };
//			// 将表单的值放入postMethod中
//			post.setRequestBody(data);
//			
//			client.executeMethod(post);
//			Header[] headers =post.getRequestHeaders();
//			int statusCode=post.getStatusCode();
//			System.out.println("statusCode:"+statusCode);
//			for(Header header :headers){
//				System.out.println(header.toString());
//			}
//			String result=new String(post.getResponseBodyAsString().getBytes("gbk"));
//	        System.out.println(result); //打印返回消息状态
//	        int s=Integer.parseInt(result);
//	        
//	        //释放连接。无论执行方法是否成功，都必须释放连接
//	        post.releaseConnection();
//			if(s<1){//发送短信失败
//				renderData(response, "出错");
//				return; 
//			}
			 SendSms sendSms=new SendSms();
				String message=sendSms.SendSms(mobile, verifyCode);
				 if(!message.equals("OK")){
			    	 renderData(response, "出错");
				return; 
			     }
		
			//将验证码存到session中,同时存入创建时间
			//以json存放，这里使用的是阿里的fastjson
			System.out.println(verifyCode);
			json = new JSONObject();
			json.put("mobile", mobile);
			json.put("verifyCode", verifyCode);
			json.put("createTime", System.currentTimeMillis());
			// 将认证码存入SESSION
			request.getSession().setAttribute("verifyCode1", json);  
			renderData(response, "success");
			return ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		renderData(response, "fail");
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
