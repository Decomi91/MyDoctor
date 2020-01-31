package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Review;

public interface QnaService {

	void insertQna(Qna qna);

	int getqnaListCount(String id);

	List<Qna> getMyQnaList(int page, int limit, String id);


	int hosGetBoardCount(String hosId);

	List<Qna> hosGetBoardList(String hosId, int page, int limit);

	int setReply(Qna qna);

	Qna getQna(int boardNum);

	int getNoReplyQnaCount(String id);

	List<Qna> hosGetBoardList(String hosId, int page, int limit, String noreply);

	int delBoard(int boardNum);

}
