package com.project.mydoctor;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mydoctor.model.HdetailVO;


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
	 * @상세페이지
	 * @param ykiho 암호 키
	 * @param model HdetailVO
	 * @return locationView
	 * 
	 */
	@RequestMapping(value = "detail.net", method = RequestMethod.GET)
	public String locationView(String ykiho, Model model, String YPos, String XPos) throws Exception {

		HdetailVO vo = detail(ykiho);
		model.addAttribute("vo", vo);
		model.addAttribute("YPos", YPos);
		model.addAttribute("XPos", XPos);

		
		
		return "details/hospitaldetail";

	}
	
	
	
	
	/**
	 * @param ykiho
	 * @return 결과값 상세
	 */
	public HdetailVO detail(String ykiho) {
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject;
		try {
			jsonobject = (JSONObject) jsonparser.parse(readUrl(
					"http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getFacilityInfo?ServiceKey=G9rzPM3G3d1FVN%2F8ZyPSkwQ7B0IICxPX3Sks%2FrUY2wLu94BsUzYPUHzcNhSwJj%2FIjuLsoBMYMJ7JcX4thVA7Lg%3D%3D&_type=json&ykiho="
							+ ykiho));
			
			JSONObject json = (JSONObject) jsonobject.get("response");
			JSONObject body = (JSONObject) json.get("body");
			JSONObject items = (JSONObject) body.get("items");
			JSONObject item = (JSONObject) items.get("item");

			HdetailVO result = new HdetailVO();
			result.setYadmNm((String) item.get("yadmNm"));
			result.setAddr((String) item.get("addr"));
			result.setTelno((String) item.get("telno"));
			result.setHospUrl((String) item.get("hospUrl"));
			result.setEstbDd((String) item.get("estDd"));
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

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
