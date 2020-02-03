package com.project.mydoctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.AdminBoard;
import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.model.Member;
import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Reservation;
import com.project.mydoctor.model.Review;
import com.project.mydoctor.service.BoardService;
import com.project.mydoctor.service.BookmarkService;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.MemberService;
import com.project.mydoctor.service.MypageService;
import com.project.mydoctor.service.QnaService;
import com.project.mydoctor.service.ReserveService;
import com.project.mydoctor.service.ReviewService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private QnaService qnaService;// 병원에게 쓰는 qna
	@Autowired
	private MypageService mypageService;
  @Autowired
	private BookmarkService bookmarkService;
  @Autowired
  private BoardService boardService; //관리자에게 쓰는 요청사항
  @Autowired
 	private ReserveService reserveService;
    
	//새로 입력받은 비밀번호로 비밀번호 update합니다.
	@RequestMapping(value="/pwmodify.do")	
	public void updatePass(@RequestParam("new_password") String newPassword, HttpServletResponse response, 
    HttpSession session) throws IOException{
		System.out.println(" 신 비번: "+newPassword);			
		String id=(String)session.getAttribute("loginid");
		int result=memberService.updatePass(newPassword, id);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result == 1) {
			out.println("<script>");
			out.println("alert('비밀번호 수정을 완료했습니다.')");
			out.println("location.href='mypage.net'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('정보 수정에 실패했습니다. 같은 문제가 반복될 경우 관리자에게 문의해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	}

	// 회원탈퇴 이전 비밀번호 맞는지 확인=>탈퇴진행
	@RequestMapping(value = "/quitprocess.do")
	public void removeaccount(@RequestParam("password") String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("loginid");

		System.out.println("id=" + id + "password=" + password);
		boolean usercheck = memberService.passck(id, password);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (usercheck == false) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			int removed = memberService.removeaccount(id);
			if (removed == 1) {
				out.println("<script>");
				out.println("alert('탈퇴 되었습니다.');");
				out.println("location.href='main'");
				out.println("</script>");
				out.close();
				session.invalidate();
			} else {
				out.println("<script>");
				out.println("alert('회원 탈퇴에 실패했습니다. 같은 문제가 반복될 경우 관리자에게 문의해 주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}
	}

	// mypage 메뉴에서 나의정보 수정 누르면 비밀번호 확인하는 페이지로 이동
	@RequestMapping(value = "/modifyck.do")
	public String gomodify() {

		return "mypage/mypage_modify";

	}

	// 정보수정하기이전 비밀번호 맞는지 확인
	@RequestMapping(value = "/modifyckpass.do")
	public void gomodifyckpass(@RequestParam("password") String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("loginid");

		System.out.println("id=" + id + "password=" + password);
		boolean usercheck = memberService.passck(id, password);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (usercheck == false) {
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

	// 개인정보 수정화면에 이전 정보 불러옵니다.
	@RequestMapping(value = "/modify.do")
	public ModelAndView modifydo(ModelAndView mv, HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		System.out.println("id=" + id);
		Member m = memberService.my_info(id);
		mv.addObject("myinfo", m);
		mv.setViewName("mypage/mypage_modify2");
		return mv;

	}

	// 새로 입력받은 정보로 개인정보 update합니다.
	@RequestMapping(value = "/updateProcess.net")
	public void updateProcess(Member member, HttpServletResponse response) throws IOException {
		int result = memberService.update(member);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result == 1) {
			out.println("<script>");
			out.println("alert('정보 수정을 완료했습니다.')");
			out.println("location.href='mypage.net'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('정보 수정에 실패했습니다. 같은 문제가 반복될 경우 관리자에게 문의해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	}

	// jisu_0123_myreview_내가쓴 후기 불러옵니다.
	@RequestMapping(value = "/myreview.net")
	public ModelAndView gomyreview(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("loginid");
		int limit = 5;
		int listcount = reviewService.getListCount(id);
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 5 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
		List<Review> reviewlist = reviewService.getMyReviewList(page, limit, id);
		
		mv.setViewName("mypage/mypage_review");
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("myreviewlist", reviewlist);
		mv.addObject("limit", limit);
		
		return mv;
	}

	@RequestMapping(value = "/quit.do")
	public String goquit_ck() {
		return "mypage/mypage_signout";
	}

	// jisu 0128_내가쓴 문의(병원) 불러옵니다.
	@RequestMapping(value = "/myqna.net")
	public ModelAndView gomyqna(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("loginid");
		int limit = 5;
		int qnalistcount = qnaService.getqnaListCount(id);
		int maxpage = (qnalistcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 5 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
		List<Qna> myqnalist = qnaService.getMyQnaList(page, limit, id);
		mv.setViewName("mypage/mypage_req");
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("qnalistcount", qnalistcount);
		mv.addObject("myqnalist", myqnalist);
		mv.addObject("limit", limit);
		return mv;
	}

	// jisu 0128_내가쓴 요청(관리자에게) 불러옵니다.
	@ResponseBody
	@RequestMapping(value = "/myReqToA")
	public Object gomyReqToA(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			HttpSession session) throws Exception {
		String id = (String) session.getAttribute("loginid");
		int limit = 5;
		int reqlistcount = boardService.getreqListCount(id);
		int maxpage = (reqlistcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 5 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
		List<AdminBoard> myreqlist = boardService.getMyReqList(page, limit, id);
		Map<String, Object> mv = new HashMap<String, Object>();

		mv.put("maxpage", maxpage);
		mv.put("startpage", startpage);
		mv.put("endpage", endpage);
		mv.put("reqlistcount", reqlistcount);
		mv.put("myreqlist", myreqlist);
		mv.put("limit", limit);
		return mv;
	}

//jisu_0130_관리자에게 문의하기 입력
	@RequestMapping(value = "/writeReqToA")
	public String writemyReqToA() {
		return "mypage/mypage_writeReqToA";

	}

	@RequestMapping(value = "/writeReqToA.do")
	public void reqToAWriteProcess(AdminBoard ab, HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		int result = boardService.insert(ab);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result == 1) {
			out.println("<script>");
			out.println("alert('문의를 완료했습니다.')");
			out.println("location.href='mypage.net'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('문의에 실패했습니다. 잠시 후 다시 시도해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	}

	// 마이페이지 전체기록
	@RequestMapping(value = "/mypage.net")
	public ModelAndView gomypage(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		String memberId = session.getAttribute("loginid").toString();
		int limit = 5; // 한 page에 5개의 글

		// 총 예약수
		int listcount = mypageService.getListCount(memberId);
		System.out.println("listcount(총 예약수) : " + listcount);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		System.out.println("총 페이지 수 = " + maxpage);
		System.out.println("endpage : " + endpage);

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.select(memberId, page, limit);

		mv.setViewName("mypage/mypage");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}

	// 마이페이지 예약확인(예약된 + 예약신청한)
	@RequestMapping(value = "/reserveCheck.net")
	public ModelAndView goreserveCheck(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {
	
		String memberId = session.getAttribute("loginid").toString();
		int limit = 5; // 한 page에 5개의 글

		// 예약된 + 예약신청한 수
		int listcount = mypageService.reserveCounti(memberId);
		System.out.println("listcount(총 예약수) : " + listcount);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		System.out.println("총 페이지 수 = " + maxpage);
		System.out.println("endpage : " + endpage);

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Reservation> rv = mypageService.reserveOk(memberId, page, limit);

		mv.setViewName("mypage/mypage_reserve");
		mv.addObject("rv", rv);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;
	}
	
	// 마이페이지 진료기록
		@RequestMapping(value = "/finish.net")
		public ModelAndView gofinish(HttpSession session, ModelAndView mv,
				@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {
		
			String memberId = session.getAttribute("loginid").toString();
			int limit = 5; // 한 page에 5개의 글

			// 예약된 + 예약신청한 수
			int listcount = mypageService.reserveCountf(memberId);
			System.out.println("listcount(총 예약수) : " + listcount);

			int maxpage = (listcount + limit - 1) / limit;
			int startpage = ((page - 1) / 10) * 10 + 1;
			int endpage = startpage + 10 - 1;

			System.out.println("총 페이지 수 = " + maxpage);
			System.out.println("endpage : " + endpage);

			if (endpage > maxpage) {
				endpage = maxpage;
			}

			List<Reservation> rv = mypageService.finish(memberId, page, limit);

			mv.setViewName("mypage/mypage_finish");
			mv.addObject("rv", rv);
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("limit", limit);

			return mv;
		}

	@RequestMapping(value = "/gobookmark.net")
	public ModelAndView gobookmark(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {
		String memberId = session.getAttribute("loginid").toString();
		int limit = 5; // 한 page에 5개의 글

		// 총 북마크 수
		int listcount = bookmarkService.getListCount(memberId);
		System.out.println("listcount(총 북마크수) : " + listcount);

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Hospital> bm = bookmarkService.getBookmarkList(memberId, page, limit);
	
		
		mv.setViewName("mypage/bookmark");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);
		mv.addObject("bm", bm);

		return mv;
	}

	//jisu_0131_후기작성폼에 진료기록 불러옵니다.
	@RequestMapping(value = "/reviewwrite.do")
	public ModelAndView record(ModelAndView mv, int reserveNo, HttpSession session) {
		
		 
		Reservation r = reserveService.getReserveDetail(reserveNo);
		mv.addObject("reserveRecord", r);
		mv.setViewName("mypage/review");
		return mv;

	}
//jisu_0131_리뷰 입력
	@RequestMapping(value = "/ReviewAddAction.do")
	public void reviewWriteProcess(Review review, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		int result = reviewService.insert(review);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result == 1) {
			out.println("<script>");
			out.println("alert('리뷰 감사합니다.')");
			out.println("location.href='mypage.net'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰 작성에 실패했습니다. 잠시 후 다시 시도해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	}
	
	
	
	@RequestMapping(value = "/detail")
	public String detailQna() {

		return "details/hospitaldetail";
	}

	@RequestMapping(value = "/record.net")
	public String gorecord() {

		return "mypage/chart";
	}

	@RequestMapping(value = "/bookmarkcancel.do")
	public void bookmarkcancel(String ykiho, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		Hospital hospital = hospitalService.getDetail(ykiho);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("loginid").toString());
		map.put("hosid", hospital.getId());

		int result = bookmarkService.delete(map);

		if (result == 1) {
			out.println("<script>");
			out.println("alert('관심병원에서 해제되었습니다.');");
			out.println("location.href='gobookmark.net';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('해제를 실패하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		out.close();
	}

}
