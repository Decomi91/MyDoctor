package com.project.mydoctor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.mydoctor.service.HospitalService;

@Controller
public class SNSlogin {

	private static final Logger logger = LoggerFactory.getLogger(SNSlogin.class);
	private static final String CLIENT_ID = "API";
	private static final String REDIRECT_URI = "설정http";

	@Autowired
	private HospitalService hospitalservice;

	String url = "http://ncov.mohw.go.kr/";

	public String SNSUrl(HttpSession session) {
		String kakaoUrl = ""+"client_id="+CLIENT_ID+"&redirect_uri="+REDIRECT_URI+"&response_type=code";
		return kakaoUrl;
	}
	
	//토큰
	public JsonNode getAccessToken(String autorize_code) {
		
		String RequsetUrl = "";//?
		List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); //?
		postParams.add(new BasicNameValuePair("client_id", "API"));
		postParams.add(new BasicNameValuePair("redirect_uri", "리다이렉트uri"));
		postParams.add(new BasicNameValuePair("code",autorize_code));//로그인과정중 얻는 코드값
		
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RequsetUrl);
		
		JsonNode returnNode = null;
		try {
			
			post.setEntity(new UrlEncodedFormEntity(postParams));
			HttpResponse response = client.execute(post);
			//json형태 반환값 리턴이라함
			System.out.println("[gettoken]json 형태로 받은 리턴값"+response);
			//처리부분
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println("[gettoken]바이트로나오는지확인?"+response.getEntity().getContent());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		System.out.println("[gettoken]얻은 토큰의 값"+returnNode.toString());
		return returnNode;
	}
	
	public JsonNode getkakaoInfo(JsonNode accessToken) {
		String RequestUrl = "";//?
		HttpClient client = HttpClientBuilder.create().build(); //위에꺼랑 뭐가다를까
		HttpPost post = new HttpPost(RequestUrl);
		//add header
		post.addHeader("Authorization","Bearer"+accessToken);		
	
		JsonNode returnNode =null;
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return returnNode;
	}

}
