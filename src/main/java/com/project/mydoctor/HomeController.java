package com.project.mydoctor;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.MemberService;
import com.project.mydoctor.service.MypageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HospitalService hospitalservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bc;
	
	
	String url = "http://ncov.mohw.go.kr/";

	
	
	
	
	// test용 kokoa, 크롤링
	@GetMapping(value = "/main")
	public ModelAndView mainPage(ModelAndView mv,SNSlogin sns) throws IOException {

		// 크롤링
		Document doc = Jsoup.connect(url).get();
		Elements element1 = doc.select(
				"body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > ul");
		Elements element2 = doc.select(
				"body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > div > ul");

		Map<String, String> cr = new HashMap<String, String>();
		cr.put("e1", element1.toString());
		cr.put("e2", element2.toString());

		mv.addObject("el", cr);
		// 크롤링끝

		//
		List<Hospital> list = null;
		list = hospitalservice.getHosListTest();
		mv.setViewName("main/main");
		mv.addObject("hoslist", list);
		//
		
		
		// 카카오
		// 인증URL을 생성하기 위하여 호출		
		System.out.println(sns.SNSUrl());
		mv.addObject("kakao_url", sns.SNSUrl());	

		return mv;
	}

	@RequestMapping(value = "kakaologin", produces = "application/json", method = RequestMethod.GET)
	public ModelAndView kakaologin(ModelAndView mv, @RequestParam("code") String code, HttpServletRequest req,
			HttpServletResponse res, HttpSession session,SNSlogin sns,Member m) {
		//결과값을 node에 담아둠
		JsonNode node = sns.getAccessToken(code);
		System.out.println("sns로그인컨트롤러탔다 코드"+code);
		
		//accesstoken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		System.out.println("sns로그인컨트롤러탔다 엑세스토큰"+accessToken);
		
		//사용자의정보
		JsonNode userInfo = sns.getkakaoInfo(accessToken);
		System.out.println("sns로그인컨트롤러탔다 토큰을 넣은 유저의 정보"+userInfo);
		
		//유저정보 카카오에서 가져오기 getproperties
		JsonNode properties =userInfo.path("properties");
		JsonNode kakao_account =userInfo.path("kakao_account");
		String id = userInfo.path("id").asText();
		
		String kemail = kakao_account.path("email").asText();
		String kname = properties.path("nickname").asText();
		String kimage = properties.path("profile_image").asText();
		String kgender = kakao_account.path("gender").asText();
		String kbirthday = kakao_account.path("birthday").asText();
		String kage = kakao_account.path("age_range").asText();
		System.out.println(id);
		
		//데이터넣기
		m.setId(userInfo.path("id").asText());
		m.setPassword("kakao");
		m.setName(properties.path("nickname").asText());
		m.setPhone(0);
		m.setAddress("입력해주세요");
		m.setEmail(kakao_account.path("email").asText());
		m.setBirth("01"+kakao_account.path("birthday").asText());
		m.setGender((byte) 0);
		
		
		Member result = null;		
		int chk = 1;
		
		result = memberservice.kakaoid(id);
				
		if(result!=null) {//있을경우
			session.setAttribute("loginid", result.getId());
			session.setAttribute("chk", chk);
			session.setAttribute("yesaccept", mypageService.reserveCount(result.getId()));
			session.setAttribute("kakao", result.getName());
			System.out.println("있어서 완료함");		
		}else {//없을경우 DB안에 넣는다
			m.setPassword(bc.encode(m.getPassword()));
			memberservice.insertMember(m);
			System.out.println("디비삽입성공");
			session.setAttribute("loginid", m.getId());
			session.setAttribute("chk", chk);
			session.setAttribute("kakao", m.getName());
			session.setAttribute("yesaccept", mypageService.reserveCount(m.getId()));			
			System.out.println("삽입후 완료");
		}
		
		mv.setViewName("redirect:/main");	
		return mv;
	}

}
