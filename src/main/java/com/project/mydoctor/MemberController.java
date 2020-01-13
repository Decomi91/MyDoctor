package com.project.mydoctor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@PostMapping(value="/join")
	public ModelAndView joinProcess(Member member, ModelAndView mv, HttpServletResponse response, HttpSession session) throws Exception {
		int result = memberService.insertMember(member);
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
	
	
}
