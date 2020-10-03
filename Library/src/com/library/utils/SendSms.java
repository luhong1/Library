package com.library.utils;

import java.util.Map;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.Gson;

public class SendSms {
	private Object Message=null;
	public String SendSms(String mobile,String code){
    	DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4GJ2j3CkEh6zdc5bBsVv", "2dEYtUKTFYKvSZWwSPZjnIOKTKyttJ");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers",mobile);
        request.putQueryParameter("SignName", "图书管理系统");
        request.putQueryParameter("TemplateCode", "SMS_192836185");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
            String data = response.getData();
            String sData = data.replaceAll("'\'", "");
            Gson gson = new Gson();
            Map map = gson.fromJson(sData, Map.class);
             Message = map.get("Message");

        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
		return Message.toString();
    }
		 

	}
