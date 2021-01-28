package com.project.mydoctor;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoronaCrawler {
	
	private static final Logger logger = LoggerFactory.getLogger(CoronaCrawler.class);
	

	@RequestMapping(value = "/crawling.do", method = RequestMethod.GET)
	public void home() throws IOException {
		
		String url = "http://ncov.mohw.go.kr/";		
		
		
		Document doc = Jsoup.connect(url).get();
		Elements element1 = doc.select("body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > ul");
		Elements element2 = doc.select("body > div > div.mainlive_container > div.container > div > div.liveboard_layout > div.liveNumOuter > div > ul");
		
		//String[] el1 =  element1.select("li").text().split(" ");		
		
		Map<String, String> cr = new HashMap<String, String>();
		cr.put("e1", element1.toString());
		cr.put("e2", element2.toString());
			
		
		
	}
	
}



