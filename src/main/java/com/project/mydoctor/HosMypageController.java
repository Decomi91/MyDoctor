package com.project.mydoctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Hospital;
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
		System.out.println("listcount(총 예약수) : " + listcount);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		System.out.println("총 페이지 수 = " + maxpage);
		System.out.println("endpage : " + endpage);

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
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		System.out.println("checkbox length = " + reserveNo.length);

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
				System.out.println("checkbox value = " + reserveNo[i]);
			}

			if (result >= 1) {
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
	public ModelAndView reserveX(ModelAndView mv, int page, int reserveNo, HttpServletResponse response) throws Exception {
		int result = reserveService.cancel(reserveNo);
		
		if(result == 1) {
			mv.addObject("page", page);
			mv.setViewName("redirect:/hosmypage.net");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('취소시 이상 발생'); history.back();</script>");
			out.close();
			return null;
		}
		return mv;
	}
}
