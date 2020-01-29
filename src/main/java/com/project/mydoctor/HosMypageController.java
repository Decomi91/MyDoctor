package com.project.mydoctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Member;
import com.project.mydoctor.model.Reservation;
import com.project.mydoctor.service.MemberService;
import com.project.mydoctor.service.MypageService;
import com.project.mydoctor.service.ReserveService;

@Controller

public class HosMypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MemberService memberService;

	// 병원 마이페이지 메인
	@RequestMapping(value = "/hosmypage.net")
	public ModelAndView gomypage(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount = mypageService.hosGetListCount(hosId);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.hosGetReserveList(hosId, page, limit);

		mv.setViewName("mypage_hospital/hosmypage");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}

	@RequestMapping(value = "reserveOk.net")
	public void reserveProcess(@RequestParam(value = "reserveOk", defaultValue = "") int[] reserveNo,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (reserveNo.length == 0) {
			out.println("<script>");
			out.println("alert('승인할 예약내역을 선택해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			int result = 0;
			
			for (int i = 0; i < reserveNo.length; i++) {
				reserveService.reserveOk(reserveNo[i]);
				result++;
			}

			if (result >= 1) {
				List<Integer> mypageList = reserveService.getReserves((String)session.getAttribute("loginid"));
				session.setAttribute("accepted", mypageList.get(0));
				session.setAttribute("wait", mypageList.get(1));
				
				out.println("<script>");
				out.println("alert('선택한 예약이 모두 승인되었습니다.');");
				out.println("location.href='hosmypage.net'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('예약 승인을 실패하였습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
			out.close();
		}
	}

	@RequestMapping(value = "reserveDetail.net")
	public ModelAndView reserveDetail(int reserveNo, Reservation reservation, Member member, ModelAndView mv) {
		reservation = reserveService.getReserveDetail(reserveNo);
		member = memberService.my_info(reservation.getId());
		
		mv.setViewName("mypage_hospital/reserveDetail");
		mv.addObject("rv", reservation);
		mv.addObject("member", member);
		
		return mv;
	}
	
	@GetMapping(value="/reserveX")
	public ModelAndView reserveX(ModelAndView mv, int page, int reserveNo, HttpServletResponse response,
			HttpSession session) throws Exception {
		int result = reserveService.cancel(reserveNo);
		
		if(result == 1) {
			mv.addObject("page", page);
			session.setAttribute("wait", (int)session.getAttribute("wait")-1);
			session.setAttribute("canceled", (int)session.getAttribute("canceled")+1);
			mv.setViewName("redirect:/hosmypage.net");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('취소시 이상 발생'); history.back();</script>");
			out.close();
			return null;
		}
		return mv;
	}
	
	@PostMapping(value="diagnosis.net")
	public void diagnosis(@RequestParam(value = "reserveOk", defaultValue = "") int[] reserveNo,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (reserveNo.length == 0) {
			out.println("<script>");
			out.println("alert('진료 완료 할 내용을 선택해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			int result = 0;
			
			for (int i = 0; i < reserveNo.length; i++) {
				reserveService.diagnosisOk(reserveNo[i]);
				result++;
			}

			if (result >= 1) {
				List<Integer> mypageList = reserveService.getReserves((String)session.getAttribute("loginid"));
				session.setAttribute("accepted", mypageList.get(0));
				session.setAttribute("wait", mypageList.get(1));
				
				out.println("<script>");
				out.println("alert('선택한 예약이 모두 진료되었습니다.');");
				out.println("location.href='hosmypage_today.net'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('진료 처리를 실패하였습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
			out.close();
		}
	}
	
	@GetMapping(value="hosmypage_today.net")
	public ModelAndView hosmypage_today(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount = mypageService.hosGetTodayListCount(hosId);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.hosGetTodayReserveList(hosId, page, limit);

		mv.setViewName("mypage_hospital/hosmypage_todayaccept");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}
	
	@GetMapping(value="diagnosisList.net")
	public ModelAndView diagnosisList(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount = mypageService.hosGetDiagListCount(hosId);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.hosGetDiagReserveList(hosId, page, limit);

		mv.setViewName("mypage_hospital/hosmypage_diaglist");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}
	
	@GetMapping(value="reserveAll.net")
	public ModelAndView reserveAll(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount = mypageService.hosGetAllReserveListCount(hosId);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.hosGetAllReserveList(hosId, page, limit);

		mv.setViewName("mypage_hospital/hosmypage_reservelist");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}
}
