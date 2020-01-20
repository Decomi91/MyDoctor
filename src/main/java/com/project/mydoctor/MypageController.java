package com.project.mydoctor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mydoctor.service.MemberService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value="/modify.do")
	public String gomodify() {

		return "mypage/mypage_modify2";
		
	}
	@RequestMapping(value="/modifyck.do")
	public void gomodifyck(String password, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession id=request.getSession();
		boolean usercheck=memberService.passck(id, password);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		if(usercheck==false) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		out.println("<script>");
		out.println("location.href='modify.do'");
		out.println("</script>");
		out.close();
		}
	@RequestMapping(value="/myreview.net")
	public String gomyreview() {

		return "mypage/mypage_review";
	}
	@RequestMapping(value="/quit.do")
	public String goquit_ck() {

		return "mypage/mypage_signout";
	}
	@RequestMapping(value="/myqna.net")
	public String gomyqna() {

		return "mypage/mypage_req";
	}
}
 