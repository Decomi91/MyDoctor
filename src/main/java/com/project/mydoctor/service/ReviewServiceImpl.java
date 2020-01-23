package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.ReviewDAO;
import com.project.mydoctor.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
@Autowired
private ReviewDAO rdao;
	
	@Override
	public int getListCount(String id) {
		// TODO Auto-generated method stub
		int listcount=rdao.getListCount(id);
		return listcount;
	}

	@Override
	public List<Review> getMyReviewList(int page, int limit, String id) {
		HashMap<String, Object> map=new HashMap<String,Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("id", id);
		return rdao.getMyReviewList(map);
	}

}
