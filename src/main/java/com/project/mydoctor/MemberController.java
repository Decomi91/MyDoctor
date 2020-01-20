package com.project.mydoctor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@GetMapping(value="/joinForm")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	@PostMapping(value="/join")
	public ModelAndView joinProcess(Member member, ModelAndView mv, HttpServletResponse response, HttpSession session) throws Exception {
		int result = memberService.insertMember(member);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.print("<script>alert('가입을 축하드립니다');</script>");
			session.setAttribute("loginid", member.getId());
			mv.setViewName("redirect:/main");
		}else {
			out.print("<script>alert('가입에 실패했습니다.\n입력한 사항을 다시 확인하세요.'); history.go(-1)</script>");
			out.close();
			return null;
		}
		
		return mv;
	}
	
	@PostMapping(value="/loginMember")
	public ModelAndView loginMember(Member member, String user, ModelAndView mv, HttpSession session, HttpServletResponse response) throws Exception {
		int result = 0;
		int chk = 0;
		response.setContentType("text/html;charset=utf-8");
		if(user.equals("pub")) {
			result = memberService.isId(member);
			chk=1;
		}else {
			result = memberService.isHosId(member);
			chk=2;
		}
		if(result == 1) {
			session.setAttribute("loginid", member.getId());
			session.setAttribute("chk", chk);
			if(member.getId().equals("admin")) {
				mv.setViewName("redirect:/hospitalcontrol");
			}else {
				mv.setViewName("redirect:/main");
			}
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 오류 발생'); history.go(-1);</script>");
			out.close();
			return null;
		}
		return mv;
	}
	
	@GetMapping(value="/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/main");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/idcheck")
	public String idcheck(String id, String pub) {
		return memberService.idcheck(id, pub);
	}
}
