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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Review;
import com.project.mydoctor.model.Score;
import com.project.mydoctor.service.HospitalService;
import com.project.mydoctor.service.QnaService;
import com.project.mydoctor.service.ReviewService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;

	@Autowired
	private HospitalService hospitalService;

	@Autowired
	private ReviewService reviewService;
	
/////jisu_0122//////////
	// @RequestMapping(value = "/qna")
	public String writeQna() {

		return "details/qna";
	}
	/*
	 * @RequestMapping(value="/qna") public ModelAndView
	 * getqnawriterinfo(ModelAndView mv, HttpServletRequest request, HttpSession
	 * session)throws Exception{ String id=(String)session.getAttribute("loginid");
	 * Qna qna=qnaservice.getInfo(id); mv.addObject("qnadata", qna);
	 * mv.setViewName("details/qna"); return mv;}
	 */

//	@RequestMapping(value="/qnawrite.do")
	public String qna_write(Qna qna, HttpServletRequest request) throws Exception {
		qnaService.insertQna(qna);
		return "redirect:qna";
	}

	/* yuri hospitaldetail -> qna */
	@RequestMapping(value = "/qnaWrite.net", method = RequestMethod.POST)
	public void qna_write(HttpSession session, HttpServletResponse response, Qna qna,
			@RequestParam(value = "ykiho") String ykiho) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("dd" + ykiho);
		qna.setWriteId((String) session.getAttribute("loginid"));
		
		String hosId = hospitalService.getHosId(ykiho);
		System.out.println("hosid = " + hosId);
		qna.setBoardsTarget(hosId);
		
		System.out.println(qna.getBoardNum());
		System.out.println(qna.getBoardsTarget());
		System.out.println(qna.getContent());
		System.out.println(qna.getHead());
		System.out.println(qna.getReply());
		int result = qnaService.insert(qna);
		
		if (result == 1) {
			out.println("<script>");
			out.println("alert('문의글이 등록되었습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('문의글 등록에 실패하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		out.close();
	}

	@RequestMapping(value = "/qna")
	public ModelAndView qnaList(ModelAndView mv,@RequestParam(value = "ykiho") String ykiho,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		
		System.out.println("ykiho = " + ykiho);
		String hosId = hospitalService.getHosId(ykiho);
		
		int limit = 5; // 한 page에 5개의 글
		int listcount = qnaService.getCount(hosId);
		
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Qna> qna = qnaService.getQnaList(hosId, page, limit);

		mv.setViewName("details/qna");
		mv.addObject("ykiho", ykiho);
		mv.addObject("qna", qna);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);
		mv.addObject("ykiho", ykiho);
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="qnapage")
	public Map<String, Object> qnaPage(@RequestParam(value = "ykiho") String ykiho,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		Map<String,Object> map = new HashMap<String, Object>();
		String hosId = hospitalService.getHosId(ykiho);
		
		int limit = 5; // 한 page에 5개의 글
		int listcount = qnaService.getCount(hosId);
		
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Qna> qna = qnaService.getQnaList(hosId, page, limit);
		System.out.println(ykiho);
		map.put("ykiho", ykiho);
		map.put("qna", qna);
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("limit", limit);
		map.put("ykiho", ykiho);
		
		return map;
	}
	
	@RequestMapping(value = "/review")
	public ModelAndView reviewMore(ModelAndView mv,@RequestParam(value = "ykiho") String ykiho,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		
		System.out.println("ykiho = " + ykiho);
		String hosId = hospitalService.getHosId(ykiho);
		
		int limit = 5; // 한 page에 5개의 글
		int listcount = reviewService.getHosListCount(hosId);
		
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Review> review = reviewService.getHosReviewList(page, limit, hosId);
		Score score;
		try{
			score = reviewService.getScore(hosId);
		}catch (NullPointerException e) {
			score = new Score();
			score.setAbility(0);
			score.setKindness(0);
			score.setPrice(0);
		}
		mv.addObject("score", score);
		mv.setViewName("details/review");
		mv.addObject("ykiho", ykiho);
		mv.addObject("review", review);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);
		mv.addObject("ykiho", ykiho);
		
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="reviewpage")
	public Map<String, Object> reviewPage(@RequestParam(value = "ykiho") String ykiho,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		Map<String,Object> map = new HashMap<String, Object>();
		String hosId = hospitalService.getHosId(ykiho);
		
		int limit = 5; // 한 page에 5개의 글
		int listcount = reviewService.getHosListCount(hosId);
		
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		List<Review> review = reviewService.getHosReviewList(page, limit, hosId);
		System.out.println(ykiho);
		map.put("ykiho", ykiho);
		map.put("review", review);
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("limit", limit);
		map.put("ykiho", ykiho);
		
		return map;
	}
}
