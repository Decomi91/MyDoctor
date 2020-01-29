package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Review;

public interface ReviewService {

	int getListCount(String id);

	List<Review> getMyReviewList(int page, int limit, String id);

	

}
