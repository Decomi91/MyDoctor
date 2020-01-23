package com.project.mydoctor;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.MemberService;
import com.project.mydoctor.service.ReserveService;

@Controller
public class ReserveController {
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private HospitalService hospitalservice;
	
	@Autowired
	private ReserveService reserveservice;

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
	
	@RequestMapping(value = "/reserveProcess.net")
	public ModelAndView reserveProcess(HttpSession session, 
										@RequestParam(value = "hosid") String hosid, 
										@RequestParam(value = "reserveDate") String reserveDate, 
										@RequestParam(value = "hour") int hour, 
										@RequestParam(value = "minute") int minute,
										@RequestParam(value = "disease") String disease,
										HttpServletResponse response, ModelAndView mv) throws Exception {
		
		int result = 0;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String memberId = session.getAttribute("loginid").toString();
		Member member = memberservice.select(memberId);
		Hospital hospital = hospitalservice.getDetail(hosid);
//		
//		String formatDate = reserveDate + Integer.toString(hour) + ":" + Integer.toString(minute);
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date date = transFormat.parse(formatDate);
//		

		String date = reserveDate + "\t" + Integer.toString(hour) + ":" + Integer.toString(minute);
		System.out.println(date);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", memberId);
		map.put("name", member.getName());
		map.put("hosid", hosid);
		map.put("hosname", hospital.getYadmNm());
		map.put("disease", disease);
		map.put("reserveTime", date);
		
		result = reserveservice.insert(map);
		
		if(result == 1) {
			mv.setViewName("details/reserveResult");
			mv.addObject("loginid", memberId);
			mv.addObject("hosname", hospital.getYadmNm());
			mv.addObject("reserveDate", date);
		}else {
			out.println("<script>");
			out.println("alert('예약에 실패했습니다.');");
			out.println("</script>");
			out.close();
			return null;
		}
		return mv;
	}
}
