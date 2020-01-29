package com.project.mydoctor;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	// test용
	@GetMapping(value = "/main")
	public ModelAndView mainPage(ModelAndView mv) {
		List<Hospital> list = null;
		list = hospitalservice.getHosListTest();
		
		mv.setViewName("main/main");
		mv.addObject("hoslist", list);
		
		return mv;
	}


}
