package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Qna;

public interface QnaService {

	void insertQna(Qna qna);

	int getqnaListCount(String id);

	List<Qna> getMyQnaList(int page, int limit, String id);

	int insert(Qna qna);

	int getCount(String hosId);

	List<Qna> getQnaList(String hosId, int page, int limit);

	

}
