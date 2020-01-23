package com.project.mydoctor;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mydoctor.model.HdetailVO;
import com.project.mydoctor.model.Work_hs;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


/**
 * @author 김건수
 * @맵관련
 *
 */
@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	private static final String radius = "3000";
	
	/**
	 * @param req 좌표
	 * @param res
	 * @throws Exception
	 * @author 김건수
	 * @현재위치 좌표
	 */
	@RequestMapping(value = "intro_hs")
	public void intro_hs(HttpServletRequest req, HttpServletResponse res)throws Exception {
		String xPos = req.getParameter("xPos");
		String yPos = req.getParameter("yPos");
		String addr = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?numOfRows=100&ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D";

		PrintWriter out = res.getWriter();

		String parameter = "";

		parameter = parameter + addr;
		parameter = parameter + "&xPos=" + xPos;
		parameter = parameter + "&yPos=" + yPos;
		parameter = parameter + "&radius=" + radius;
		parameter = parameter + "&_type=json";
	
		URL url = new URL(parameter);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();

		IOUtils.copy(in, bos1); // 인풋 데이터 바이트배열복수
		in.close();
		bos1.close();
		String mbos = bos1.toString("UTF-8");
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");	

		out.println(s);

	}
	
	/**
	 * @param req 좌표
	 * @param res
	 * @throws Exception
	 * @author 김건수
	 * @검색결과
	 */
	@RequestMapping(value = "hs_query",method = RequestMethod.POST)
	public void hs_query(HttpServletRequest req, HttpServletResponse res)throws Exception {
		String cate = req.getParameter("cate");
		String query = req.getParameter("query");
		String xPos = req.getParameter("xPos");
		String yPos = req.getParameter("yPos");
		
		String addr = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?numOfRows=30&ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D";

		PrintWriter out = res.getWriter();

		String parameter = "";

		parameter = parameter + addr;
		parameter = parameter + "&xPos=" + xPos;
		parameter = parameter + "&yPos=" + yPos;
		parameter = parameter + "&radius=" + 10000;
		parameter = parameter + "&_type=json";
		if(query!="")
		parameter = parameter + "&yadmNm="+URLEncoder.encode(query, "UTF-8");
		if(cate!="")
		parameter = parameter + "&dgsbjtCd="+cate;
		
		
		URL url = new URL(parameter);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();

		IOUtils.copy(in, bos1); // 인풋 데이터 바이트배열복수
		in.close();
		bos1.close();
		String mbos = bos1.toString("UTF-8");
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		
//		데이터 1개일 때 검증용
//		System.out.println(s);
//		System.out.println(s.indexOf("items"));
//		System.out.println(s.charAt(s.indexOf("items")+15)); // { 면은 [추가
//		System.out.println(s.indexOf("numOf"));
//		System.out.println(s.charAt(s.indexOf("numOf")-4));
		if(s.charAt(s.indexOf("items")+15) == '{') {
			s = s.substring(0, s.indexOf("items")+15) + "[" 
					+ s.substring(s.indexOf("items")+15, s.indexOf("numOf")-3   ) 
					+ "]" +s.substring(s.indexOf("numOf")-3)    ;
			
		}
//		System.out.println(s);
		out.println(s);
	}
	
	
	/**
	 * @상세페이지
	 * @param ykiho 암호 키
	 * @param model HdetailVO
	 * @return locationView
	 * 
	 */
	@RequestMapping(value = "detail.net", method = RequestMethod.GET)
	public String locationView(HdetailVO vo, Model model) throws Exception {
//		System.out.println(vo.getYkiho());
		vo = detail(vo);
		Work_hs work_hs= new Work_hs();
		
		
		work_hs = work(vo.getYkiho());
//		System.out.println(work_hs);
		
		model.addAttribute("vo", vo);
		model.addAttribute("work", work_hs);
		return "details/hospitaldetail";

	}
	
	
	
	/**
	 * @param ykiho
	 * @return 결과값 상세
	 */
	public HdetailVO detail(HdetailVO result) {
		
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject;
		try {
			
			//api 안나오는거 있음 요양기호 -> url에 보내줌
//			HdetailVO result = new HdetailVO();
//			jsonobject = (JSONObject) jsonparser.parse(readUrl(
//					"http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getFacilityInfo?ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D&_type=json&ykiho="
//							+ ykiho));
//			
//			JSONObject json = (JSONObject) jsonobject.get("response");
//			JSONObject body = (JSONObject) json.get("body");
//			JSONObject items = (JSONObject) body.get("items");
//			JSONObject item = (JSONObject) items.get("item");					
//			//시설정보
//			result.setYadmNm((String) item.get("yadmNm"));
//			result.setAddr((String) item.get("addr"));
//			result.setTelno((String) item.get("telno"));
//			result.setHospUrl((String) item.get("hospUrl"));
//			result.setClCdNm((String)item.get("clCdNm"));			
//			result.setEstbDd((Long)item.get("estbDd"));
//			
			//근무시간 따로 클래스빼야함
//			jsonobject = (JSONObject) jsonparser.parse(readUrl(
//					"http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getDetailInfo?ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D&_type=json&ykiho="
//							+ ykiho));
//			
			
			
			//진료과목			
			jsonobject = (JSONObject) jsonparser.parse(readUrl(
					"http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getMdlrtSbjectInfoList?ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D&_type=json&ykiho="
							+ result.getYkiho()));
			
			 JSONObject json = (JSONObject) jsonobject.get("response");			 
			 JSONObject body = (JSONObject) json.get("body");			
			 Long total = (Long) body.get("totalCount");
			
			 
			 if(total==0) {
				 return result;
			 }
			 
			 JSONObject items = (JSONObject) body.get("items");	
			 
			
			 try {
		   	 JSONArray itemArray = (JSONArray)items.get("item");		   	 
		   	 String s ="";
		     JSONObject a;
		   	for (int i = 0; i < itemArray.size(); i++) {
		   		a = (JSONObject)itemArray.get(i);		   				   		
		   		s +=(String)a.get("dgsbjtCdNm"); 
		   	 if (i < itemArray.size() - 1)
		            s += ",";
		      }		   			   	
		   	
		   	result.setDgsbjtCdNm(s);
			return result;
			 }catch (Exception e) {				 				 
				 JSONObject itemz = (JSONObject) items.get("item");			 
				 result.setDgsbjtCdNm((String)itemz.get("dgsbjtCdNm"));
				 return result;
			}
			
		

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	/**
	 * @author 김건수 
	 * @param result
	 * @return
	 * @근무시간
	 */
	public Work_hs work(String ykiho) {		
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject;
		Work_hs work_hs = new Work_hs();
		try {
			//근무시간 
			jsonobject = (JSONObject) jsonparser.parse(readUrl(
					"http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getDetailInfo?ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D&_type=json&ykiho="
							+ ykiho));
	
			
			 JSONObject json = (JSONObject) jsonobject.get("response");			 
			 JSONObject body = (JSONObject) json.get("body");
//			 System.out.println(body.size());
			 int total = body.size();
			 int a =4;
			 if(total>=a) {
//				 System.out.println("실행됨");
				 JSONObject items = (JSONObject) body.get("items");
				 JSONObject item = (JSONObject) items.get("item");	
				 
				 work_hs.setNoTrmtSun((String)item.get("noTrmtSun"));
				 work_hs.setNoTrmtHoli((String)item.get("noTrmtHoli"));
				 work_hs.setLunchWeek((String)item.get("lunchWeek"));
				 work_hs.setRcvSat((String)item.get("rcvSat"));
				 work_hs.setRcvWeek((String)item.get("rcvWeek"));
				 
				 
				 
//				 System.out.println("4개이상일때만");
				 
				 return work_hs; 
			 }	 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	

	/**
	 * @author 김건수
	 * @param urlString
	 * @return
	 * @throws Exception
	 * 
	 */
	private static String readUrl(String urlString) throws Exception {	
		
		BufferedReader reader = null;
		try {
			URL url = new URL(urlString);
			reader = new BufferedReader(new InputStreamReader(url.openStream()));
			StringBuffer buffer = new StringBuffer();
			int read;
			char[] chars = new char[1024];
			while ((read = reader.read(chars)) != -1)
				buffer.append(chars, 0, read);

			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}
}
