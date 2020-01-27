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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.AdminBoard;
import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.BoardService;
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
	
	@Autowired
	private BoardService boardService;
	
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
	
	@GetMapping(value="/requestToAdmin")
	public ModelAndView requestToAdmin(ModelAndView mv, HttpSession session, HttpServletResponse response,
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

			int listcount = boardService.getAdminRequestListCount();
			List<AdminBoard> aBoardList = boardService.getAdminRequestList(pages);		
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
			mv.addObject("boardlist", aBoardList);
			
			mv.setViewName("admin/adminReqList");			
		}
		return mv;
	}
	
	@GetMapping(value="/hospitalSignlist")
	public ModelAndView hospitalSignlist(HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "0", required = false)String page, ModelAndView mv)
			throws Exception{
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

			int listcount = hosService.getSignRequestCount();
			List<Hospital> hosList = hosService.getSignRequestList(pages);		
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
			mv.addObject("hoslist", hosList);
			
			mv.setViewName("admin/hospitalSignlist");			
		}
		return mv;
	}
	
	@GetMapping(value="/hospitalSignDetail")
	public ModelAndView hospitalSignDetail(ModelAndView mv, HttpSession session, String id, HttpServletResponse response)
		throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			Hospital hos = hosService.getDetailforId(id);
			mv.addObject("hospital", hos);
			mv.setViewName("admin/hospitalSignDetail");
		}
		return mv;
	}
	
	@PostMapping(value="/hospitalSignOkay")
	public ModelAndView hospitalSignOkay(ModelAndView mv, HttpSession session, String hosid, HttpServletResponse response)
			throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int result =  hosService.setJoinOkay(hosid);
			if(result == 1) {
				session.setAttribute("accepctReq", (int)session.getAttribute("accepctReq")-1);
				mv.setViewName("redirect:/hospitalSignlist");
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('병원 등록시 오류 발생'); location.replace('main'); </script>");
				out.close();
			}
		}
		return mv;
	}
	
	@GetMapping(value="/hospitalDetail")
	public ModelAndView hospitalDetail(ModelAndView mv, HttpSession session, String hosid, HttpServletResponse response) throws Exception{
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			Hospital hos = hosService.getDetailforId(hosid);
			mv.addObject("hospital", hos);
			mv.setViewName("admin/hospitalDetail");
		}
		return mv;
	}
	
	@PostMapping(value="/hospitalWithdraw")
	public ModelAndView hospitalWithdraw(ModelAndView mv, String hosid, HttpSession session, HttpServletResponse response) throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int result =  hosService.widthdraw(hosid);
			if(result == 1) {
				mv.setViewName("redirect:/hospitalcontrol");
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('병원 탈퇴시 오류 발생'); location.replace('main'); </script>");
				out.close();
			}
		}
		return mv;
	}
	
	@GetMapping(value="/adminReqDetail")
	public ModelAndView adminReqDetail(ModelAndView mv, int boardnum, HttpSession session, HttpServletResponse response) throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			AdminBoard board = boardService.getAdminRequestDetail(boardnum);
			mv.addObject("board", board);
			mv.setViewName("admin/adminReqDetail");
		}
		return mv;
	}
	
	@PostMapping(value="/adminReqReply")
	public  ModelAndView adminReqReply(ModelAndView mv, AdminBoard board, HttpSession session, HttpServletResponse response) throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int result = boardService.setAdminRequestReply(board);
			if(result == 1) {
				if(board.getChecking()==1) {					
					session.setAttribute("adminReq", (int)session.getAttribute("adminReq")-1);
				}
				mv.setViewName("redirect:/requestToAdmin");				
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('댓글 작성시 오류 발생'); location.replace('main'); </script>");
				out.close();
			}
		}
		return mv;
	}
	
	@GetMapping(value="/memberDetail")
	public ModelAndView membertDetail(ModelAndView mv, String id, HttpSession session, HttpServletResponse response) throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			Member mem = memberService.select(id);
			mv.addObject("member", mem);
			mv.setViewName("admin/memberDetail");
		}
		return mv;
	}
	
	@PostMapping(value="/memberWithdraw")
	public ModelAndView memberWithdraw(ModelAndView mv, String id, HttpSession session, HttpServletResponse response) throws Exception {
		if(session.getAttribute("loginid") == null || !session.getAttribute("loginid").equals("admin")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비정상 접근'); location.replace('main'); </script>");
			out.close();
			return null;
		} else if(session.getAttribute("loginid").equals("admin")) {
			int result = memberService.removeaccount(id);
			if(result == 1) {
				mv.setViewName("redirect:/usercontrol");				
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('댓글 작성시 오류 발생'); location.replace('main'); </script>");
				out.close();
			}
		}
		return mv;
	}
}
