package com.project.mydoctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	@RequestMapping(value="/modifyck.do")
	public String gomodify_ck() {

		return "mypage/mypage_modify";
		
	}
	@RequestMapping(value="/modify.do")
	public String gomodify() {

		return "mypage/mypage_modify2";
		
	}
	@RequestMapping(value="/myreview.net")
	public String gomyreview() {

		return "mypage/mypage_review";
	}
	@RequestMapping(value="/quit.do")
	public String goquit_ck() {

		return "mypage/mypage_signout";
	}
}
 