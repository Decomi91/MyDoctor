package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.ReviewDAO;
import com.project.mydoctor.model.AdminBoard;
import com.project.mydoctor.model.Review;
import com.project.mydoctor.model.Score;

@Service
public class ReviewServiceImpl implements ReviewService {
@Autowired
private ReviewDAO rdao;

	
	@Override
	public int getListCount(String id) {
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

	@Override
	public Score getScore(String hosId) {
		return rdao.getScore(hosId);
	}

	@Override
	public int getHosListCount(String hosId) {
		return rdao.getHosListCount(hosId);
	}

	@Override
	public List<Review> getHosReviewList(int page, int limit, String hosId) {
		HashMap<String, Object> map=new HashMap<String,Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("id", hosId);
		return rdao.getHosReviewList(map);
	}

	@Override
	public int insert(Review review) {
		return rdao.insert(review);
  }
  
  @Override
	public Review getDetail(int reviewNum, String hospital) {
		Review rev = new Review();
		rev.setReviewNum(reviewNum);
		rev.setHospital(hospital);
		return rdao.getDetail(rev);
	}

	@Override
	public int setReply(Review review) {
		return rdao.setReply(review);
	}


}
