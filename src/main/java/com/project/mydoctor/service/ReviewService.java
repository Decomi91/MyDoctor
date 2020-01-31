package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Review;
import com.project.mydoctor.model.Score;

public interface ReviewService {

	int getListCount(String id);

	List<Review> getMyReviewList(int page, int limit, String id);

	Score getScore(String hosId);

	int getHosListCount(String hosId);

	List<Review> getHosReviewList(int page, int limit, String hosId);
}
