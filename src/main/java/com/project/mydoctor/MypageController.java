package com.project.mydoctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	// 마이페이지 메인
	@RequestMapping(value = "/mypage.net")
	public String mypage() {
		return "mypage/mypageMain";
	}

	// 예약현황
	@RequestMapping(value = "/reserve.net")
	public String reserve() {
		return "mypage/mypageReservation";
	}

	// 진료기록
	@RequestMapping(value = "/chart.net")
	public String chart() {
		return "mypage/mypageChart";
	}
}
