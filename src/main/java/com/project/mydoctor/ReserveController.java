package com.project.mydoctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.model.Reservation;
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
	@RequestMapping(value = "/reserve.net") // id = 병원아이디
	public ModelAndView reserveForm(HttpSession session, ModelAndView mv, String yki) {
		String memberId = session.getAttribute("loginid").toString();
		System.out.println("멤버 아이디 : " + memberId);

		Hospital hospital = hospitalservice.getDetail(yki);
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
	@PostMapping(value = "/reserveProcess.net")
	public ModelAndView reserveProcess(HttpSession session, @RequestParam(value = "hosid") String hosid,
			@RequestParam(value = "reserveDate") String reserveDate, @RequestParam(value = "hour") int hour,
			@RequestParam(value = "minute") int minute, @RequestParam(value = "disease") String disease,
			HttpServletResponse response, ModelAndView mv) throws Exception {

		int result = 0;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String memberId = session.getAttribute("loginid").toString();
		Member member = memberservice.select(memberId);
		Hospital hospital = hospitalservice.getDetailforId(hosid);

		String date = reserveDate + "\t" + Integer.toString(hour) + ":" + Integer.toString(minute);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", memberId);
		map.put("name", member.getName());
		map.put("hosid", hosid);
		map.put("hosname", hospital.getYadmNm());
		map.put("disease", disease);
		map.put("reserveTime", date);
		result = reserveservice.insert(map);
		
		if (result == 1) {
			mv.addObject("hosname", hospital.getYadmNm());
			mv.addObject("reserveDate", date);
			mv.addObject("yki", hospital.getYki());
			mv.setViewName("redirect:/reserveRes");
		} else {
			out.println("<script>");
			out.println("alert('예약에 실패했습니다.'); history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		return mv;
	}
	@GetMapping(value="/reserveRes")
	public ModelAndView reserveRes(ModelAndView mv, String hosname, String reserveDate, String yki) {
		mv.addObject("hosname", hosname);
		mv.addObject("reserveDate", reserveDate);
		mv.addObject("yki", yki);
		mv.setViewName("details/reserveResult");
		return mv;
	}
	
	@RequestMapping(value = "/cancel.do")
	public ModelAndView cancel(int reserveNo, ModelAndView mv) {
		Reservation reservation = reserveservice.getReserveDetail(reserveNo);

		mv.setViewName("mypage/reservation_cancel");
		mv.addObject("reservation", reservation);
		return mv;
	}

	@RequestMapping(value = "/cancelProcess.do", method = RequestMethod.POST)
	public void cancelProcess(int reserveNo, String password, HttpSession session, Member member,
			HttpServletResponse response) throws IOException {
		member.setId(session.getAttribute("loginid").toString());
		member.setPassword(password);

		int passwordCheck = memberservice.isId(member);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (passwordCheck == 1) {
			int result = reserveservice.cancel(reserveNo);

			if (result == 1) {
				out.println("<script>");
				out.println("alert('예약이 취소되었습니다.');");
				out.println("location.href='reserveCheck.net';");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('예약 취소를 실패하였습니다.');");
				out.println("location.href='reserveCheck.net';");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}

		out.close();
	}
}
