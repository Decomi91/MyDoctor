package com.project.mydoctor;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.service.HospitalService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HospitalService hospitalservice;
	
	String url = "http://ncov.mohw.go.kr/";
	
	// test용
	@GetMapping(value = "/main")
	public ModelAndView mainPage(ModelAndView mv) throws IOException {
		
		Document doc = Jsoup.connect(url).get();
		Elements element1 = doc.select("body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > ul");
		Elements element2 = doc.select("body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > div > ul");
		
		//String[] el1 =  element1.select("li").text().split(" ");		
		
		Map<String, String> cr = new HashMap<String, String>();
		cr.put("e1", element1.toString());
		cr.put("e2", element2.toString());
		
		mv.addObject("el", cr);
		
		List<Hospital> list = null;
		list = hospitalservice.getHosListTest();		
		mv.setViewName("main/main");
		mv.addObject("hoslist", list);		
		return mv;
	}


}
