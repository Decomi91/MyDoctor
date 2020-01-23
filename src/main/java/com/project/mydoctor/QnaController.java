package com.project.mydoctor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mydoctor.model.Qna;
import com.project.mydoctor.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaservice;
	
/////jisu_0122//////////
	@RequestMapping(value="/qna")
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
		
	
	@RequestMapping(value="/qnawrite.do")
	public String qna_write(Qna qna, HttpServletRequest request)throws Exception{
		qnaservice.insertQna(qna);
		return "redirect:qna";
	}
}
