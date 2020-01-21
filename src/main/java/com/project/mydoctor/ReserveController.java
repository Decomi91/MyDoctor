package com.project.mydoctor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.MemberService;

@Controller
public class ReserveController {
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private HospitalService hospitalservice;

	// 상세 페이지 -> 예약 페이지
	@RequestMapping(value = "/reserve.net")
	public ModelAndView reserveForm(HttpSession session, ModelAndView mv, String id) {
		String memberId = session.getId();
		System.out.println(memberId);
		
		Hospital hospital = hospitalservice.getDetail(id);
		Member member = memberservice.select(memberId);
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(date);
		
		System.out.println("today : " + today);
		
		mv.setViewName("details/reserve");
		mv.addObject("hospital", hospital);
		mv.addObject("member", member);
		mv.addObject("today", today);
		return mv;
	}

	// 예약 페이지 -> 예약 완료 페이지
	@RequestMapping(value = "/reserve.do")
	public ModelAndView reserveProcess(HttpSession session, ModelAndView mv)
			throws Exception {
		String id = session.getId();
		Member member = memberservice.select(id);

		mv.setViewName("details/reserveResult");
		mv.addObject("member", member);

		return mv;
	}
}
