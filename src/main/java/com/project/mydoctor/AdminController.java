package com.project.mydoctor;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private HospitalService hosService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value="/hospitalcontrol")
	public ModelAndView hospitalControlPage(ModelAndView mv, HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "0", required = false)String page) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int pages=1;
			if(!page.equals("0")) {
				pages = Integer.parseInt(page);
			}
			int limit = 10;
			int pageShowLimit = 10;

			int listcount = hosService.getlistCount();
			List<Hospital> hoslist = hosService.gethosList(pages);		
			
			//페이지 그룹 10개씩 보여주므로 최대치를 10개로 잡은
			int maxpage = (listcount+limit-1)/limit;
			
			//startpage ~ endpage : 페이지 그룹
			//페이지를 10개 단위로 보여줌
			int startpage = ((pages-1)/pageShowLimit)*limit + 1;
			int endpage = ((startpage) + pageShowLimit -1);
			
			if(endpage > maxpage) endpage = maxpage;
			
			mv.addObject("page", pages);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);	// 총 글의 수
			mv.addObject("hoslist", hoslist);
			
			mv.setViewName("admin/hospitalControl");			
		}
		return mv;
	}
	
	@GetMapping(value="/usercontrol")
	public ModelAndView userControlPage(ModelAndView mv, HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "0", required = false)String page) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int pages=1;
			if(!page.equals("0")) {
				pages = Integer.parseInt(page);
			}
			int limit = 10;
			int pageShowLimit = 10;

			int listcount = memberService.getlistCount();
			List<Member> memlist = memberService.getmemList(pages);		
			
			//페이지 그룹 10개씩 보여주므로 최대치를 10개로 잡은
			int maxpage = (listcount+limit-1)/limit;
			
			//startpage ~ endpage : 페이지 그룹
			//페이지를 10개 단위로 보여줌
			int startpage = ((pages-1)/pageShowLimit)*limit + 1;
			int endpage = ((startpage) + pageShowLimit -1);
			
			if(endpage > maxpage) endpage = maxpage;
			
			mv.addObject("page", pages);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);	// 총 글의 수
			mv.addObject("memlist", memlist);
			
			mv.setViewName("admin/memberControl");			
		}
		return mv;
	}
}
