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
import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Reservation;
import com.project.mydoctor.model.Review;
import com.project.mydoctor.model.Score;
import com.project.mydoctor.service.MemberService;
import com.project.mydoctor.service.MypageService;
import com.project.mydoctor.service.QnaService;
import com.project.mydoctor.service.ReserveService;
import com.project.mydoctor.service.ReviewService;

@Controller

public class HosMypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReviewService reviewService;
	
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
				session.setAttribute("canceled", mypageList.get(2));
				
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
			List<Integer> mypageList = reserveService.getReserves((String)session.getAttribute("loginid"));
			session.setAttribute("accepted", mypageList.get(0));
			session.setAttribute("wait", mypageList.get(1));
			session.setAttribute("canceled", mypageList.get(2));
			
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
				session.setAttribute("canceled", mypageList.get(2));
				
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
	
	@GetMapping(value ="hosmyboard.net")
	public ModelAndView hosmyboard(HttpSession session, ModelAndView mv,
			@RequestParam(value = "noreply", defaultValue = "0", required = false) String noreply,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount =0;
		if(noreply.equals("0")) {
			listcount = qnaService.hosGetBoardCount(hosId);
		}else {
			listcount = qnaService.getNoReplyQnaCount(hosId);
		}

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		List<Qna> rv = null;
		if(noreply.equals("0")) {
			rv = qnaService.hosGetBoardList(hosId, page, limit);
		}else {
			rv = qnaService.hosGetBoardList(hosId, page, limit, noreply);
		}
		mv.setViewName("mypage_hospital/hosmypage_board");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}
	
	@GetMapping(value="qnaDetail.net")
	public ModelAndView qnaDetail(int boardNum, ModelAndView mv, HttpServletResponse response) throws Exception{
		Qna qna = qnaService.getQna(boardNum);
		if(qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("mypage_hospital/qnaDetail");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로딩시 이상 발생'); history.back();</script>");
			out.close();
			return null;
		}
		
		return mv;
	}
	
	@PostMapping(value="replyInput")
	public ModelAndView reply(Qna qna, ModelAndView mv, HttpServletResponse response, HttpSession session) throws Exception{
		Qna board = qnaService.getQna(qna.getBoardNum());
		int result = qnaService.setReply(qna);
		if(result == 1) {
			mv.setViewName("redirect:/qnaDetail.net?boardNum="+qna.getBoardNum());
			if(board.getReply() == null) {
				session.setAttribute("qnawait", qnaService.getNoReplyQnaCount((String)session.getAttribute("loginid")));
			}else if(qna.getReply() == null || qna.getReply().equals("")) {
				session.setAttribute("qnawait", qnaService.getNoReplyQnaCount((String)session.getAttribute("loginid")));
			}
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('답변 입력시 이상 발생'); history.back();</script>");
			out.close();
			return null;
		}
		
		return mv;
	}
	
	@PostMapping(value="qnaDelete")
	public ModelAndView qnaDelete(int boardNum, ModelAndView mv, HttpSession session, HttpServletResponse response) throws Exception {
		Qna board = qnaService.getQna(boardNum);
		int result = qnaService.delBoard(boardNum);
		if(result == 1) {
			mv.setViewName("redirect:/hosmyboard.net");
			if(board.getReply() == null || board.getReply().equals("")) {
				session.setAttribute("qnawait", qnaService.getNoReplyQnaCount((String)session.getAttribute("loginid")));
			}
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('삭제시 이상 발생'); history.back();</script>");
			out.close();
			return null;
		}
		
		return mv;
	}
	
	@GetMapping(value="hosmyreview.net")
	public ModelAndView hosmyreview(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String hosId = session.getAttribute("loginid").toString();
		int limit = 10; // 한 page에 10개의 글

		// 총 예약수
		int listcount = reviewService.getHosListCount(hosId);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		List<Review> rv = reviewService.getHosReviewList(page, limit, hosId);
		Score score = reviewService.getScore(hosId);
		System.out.println(score);
		System.out.println(score.getKindness());
		
		mv.setViewName("mypage_hospital/hosmypage_review");
		mv.addObject("score", score);
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
