package com.project.mydoctor;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

public class SNSlogin {
	
	private static final String CLIENT_ID = "e83a4d65bd01e957173ff18b53ca8b11";
	private static final String REDIRECT_URI = "https://192.168.0.4:8443/mydoctor/kakaologin";

	String url = "http://ncov.mohw.go.kr/";

	public String SNSUrl() {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + CLIENT_ID + "&redirect_uri="
				+ REDIRECT_URI + "&response_type=code";
		return kakaoUrl;
	}

	// 토큰
	public JsonNode getAccessToken(String autorize_code) {

		String RequsetUrl = "https://kauth.kakao.com/oauth/token";// ?
		List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); // ?
		postParams.add(new BasicNameValuePair("client_id", CLIENT_ID));
		postParams.add(new BasicNameValuePair("redirect_uri", REDIRECT_URI));
		postParams.add(new BasicNameValuePair("code", autorize_code));// 로그인과정중 얻는 코드값

		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RequsetUrl);

		JsonNode returnNode = null;
		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));
			HttpResponse response = client.execute(post);
			// json형태 반환값 리턴이라함
			System.out.println("[gettoken]json 형태로 받은 리턴값" + response);
			// 처리부분
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println("[gettoken]바이트로나오는지확인?" + response.getEntity().getContent());

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("먼데");
		}

		System.out.println("[gettoken]얻은 토큰의 값" + returnNode.toString());
		return returnNode;
	}

	public JsonNode getkakaoInfo(JsonNode accessToken) {
		String RequestUrl = "https://kapi.kakao.com/v2/user/me";// ?
		HttpClient client = HttpClientBuilder.create().build(); // 위에꺼랑 뭐가다를까
		HttpPost post = new HttpPost(RequestUrl);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);

		JsonNode returnNode = null;

		try {
			HttpResponse response = client.execute(post);
			System.out.println(response.toString());
			//json형태로 반환값처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println(returnNode.toString());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("2번째거");
		}

		return returnNode;
	}

}
