package com.project.mydoctor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping(value="/main")
	public ModelAndView mainPage( ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;
	}
	
	@RequestMapping(value = "/detail.net")
	public String detail() {
		return "details/hospitaldetail";
	}
	
	// 예약 폼
	@RequestMapping(value = "/reserve.do")
	public String reserve() {
		return "details/reserve";
	}
}
