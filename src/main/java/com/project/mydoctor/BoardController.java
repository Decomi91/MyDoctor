package com.project.mydoctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping(value = "ReviewAddAction.do")
	public String reviewAdd() {
		return null;
	}
}
