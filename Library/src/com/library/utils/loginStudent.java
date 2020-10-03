package com.library.utils;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.library.bean.User;


public class loginStudent {
	private static String username = "";
	private static String password = "";
	User user=new User();
	public  User loginStudent(String username1,String password1){
		username=username1;
		password=password1;
        //初始化一个httpclient
        HttpClient client = new DefaultHttpClient();
    	String c=new String();
        // 登录url
        String url="http://jwnew.cqust.edu.cn/eams/login.action";
        HttpPost httpost = new HttpPost(url); 
		List<NameValuePair> nvp = new ArrayList<NameValuePair>();
		nvp.add(new BasicNameValuePair("username",username1));
		nvp.add(new BasicNameValuePair("password", password1));
		nvp.add(new BasicNameValuePair("encodedPassword",""));
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvp, HTTP.UTF_8));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpResponse response1 = null;
		try {
			response1 = client.execute(httpost);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		httpost.abort();//关闭httppost，不关闭的话下面使用httpget会报错
		if (response1.getStatusLine().getStatusCode() == 302) {//使用httppost执行，会导致302重定向，response中会包含重定向的地址yyy，需使用get方式访问
			List<Cookie> list = ((AbstractHttpClient) client).getCookieStore()
                    .getCookies();
			Cookie bCookie=list.get(0);
             c =list.get(0).getValue();
			HttpGet httpget = new HttpGet("http://jwnew.cqust.edu.cn/eams/home.action");
			HttpResponse response = null;
			try {
				response = client.execute(httpget);
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				String entity = EntityUtils.toString (response.getEntity(),"utf-8");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			//System.out.println(bCookie+"\n"+c);//输出的就是html的内容

			httpget=new HttpGet("http://jwnew.cqust.edu.cn/eams/stdDetail.action");
		
			
			httpget.setHeader("Cookie", bCookie.getName() + "=" + bCookie.getValue());
			HttpResponse response2 = null;
			try {
				response2 = client.execute(httpget);
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String entity1 = null;
			try {
				entity1 = EntityUtils.toString (response2.getEntity(),"utf-8");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 Document doc = Jsoup.parse(entity1);
			//System.out.println(entity1);
			
			Element links = doc.select("table").first();
			Elements sElements=links.select("tr");
			int k=0,j=0;
			
			for(k=1;k<sElements.size();k++){
				Elements rd=sElements.get(k).select("td");
				for(j=1;j<rd.size();j=j+2){
					if(k==1){
						if(j==1){
					user.setLoginName(rd.get(1).text());
					}
					if (j==3) {
							user.setTrueName(rd.get(3).text());
						}
					}
					if(k==2){
						if (j==1) {
							user.setNiceName(rd.get(1).text());
						}
					}
					String text=rd.get(j).text();
					System.out.println(text);
				}
			}
			 String links1= doc.select("#idcard").val();
			 user.setPassword(password);
			 user.setIdNumber(links1);
			 user.setStatus(1);
			 user.setLendNum("30");
			 user.setMaxNum("5");
			String links2= doc.select("#birthday").val();
			 System.out.println(links1+"\t"+links2);
			 httpget.abort();
		}else {
			System.out.println("失败");
		}
       return user;
	}
}
