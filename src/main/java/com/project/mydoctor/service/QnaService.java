package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Review;

public interface QnaService {

	void insertQna(Qna qna);

	int getqnaListCount(String id);

	List<Qna> getMyQnaList(int page, int limit, String id);

	

}
