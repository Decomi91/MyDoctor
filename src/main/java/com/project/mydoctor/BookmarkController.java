package com.project.mydoctor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.mydoctor.model.Hospital;
import com.project.mydoctor.service.BookmarkService;
import com.project.mydoctor.service.HospitalService;

@Controller
public class BookmarkController {
	@Autowired
	private BookmarkService bookmarkService; 

	@Autowired
	private HospitalService hospitalService;

	@ResponseBody
	@RequestMapping(value = "/bookmark.net")
	public int bookmark(@RequestParam("ykiho") String ykiho, @RequestParam("chk") int chk, Hospital hospital,
			HttpSession session) {
		hospital = hospitalService.getDetail(ykiho);
		int resp = 0;
		
		if (chk == 1) {	// 북마크 등록
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", session.getAttribute("loginid").toString());
			map.put("hosid", hospital.getId());
			map.put("hosname", hospital.getYadmNm());

			bookmarkService.insert(map);
			resp = 1;
		}else if(chk == -1){	// 북마크 해제
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", session.getAttribute("loginid").toString());
			map.put("hosid", hospital.getId());
			
			bookmarkService.delete(map);
			resp = -1;
		}
		return resp;
	}
}
