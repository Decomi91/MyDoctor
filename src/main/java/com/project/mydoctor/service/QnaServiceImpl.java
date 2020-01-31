package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.QnaDAO;
import com.project.mydoctor.model.Qna;
import com.project.mydoctor.model.Review;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDAO Qdao;

	@Override
	public void insertQna(Qna qna) {
		// TODO Auto-generated method stub
		Qdao.insertQna(qna);
	}

	@Override
	public int getqnaListCount(String id) {
		// TODO Auto-generated method stub
		int listcount = Qdao.getListCount(id);
		return listcount;
	}

	@Override
	public List<Qna> getMyQnaList(int page, int limit, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("id", id);
		return Qdao.getMyQnaList(map);
	}

	@Override
	public int insert(Qna qna) {
		return Qdao.insert(qna);
	}

	@Override
	public int getCount(String hosId) {
		return Qdao.getCount(hosId);
	}

	@Override
	public List<Qna> getQnaList(String hosId, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("hosId", hosId);
		map.put("start", startrow);
		map.put("end", endrow);

		return Qdao.getQnaList(map);
	}

	public int hosGetBoardCount(String hosId) {
		return Qdao.hosGetBoardCount(hosId);
	}

	@Override
	public List<Qna> hosGetBoardList(String hosId, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page-1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("hosId", hosId);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return Qdao.hosGetBoardList(map);
	}
	@Override
	public int setReply(Qna qna) {
		return Qdao.setReply(qna);
	}
	@Override
	public Qna getQna(int boardNum) {
		return Qdao.getDetail(boardNum);
	}
	@Override
	public int getNoReplyQnaCount(String id) { 
		return Qdao.getNoReplyQnaCount(id);
	}
	@Override
	public List<Qna> hosGetBoardList(String hosId, int page, int limit, String noreply) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page-1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("hosId", hosId);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return Qdao.hosGetNoReplyBoardList(map);
	}
	@Override
	public int delBoard(int boardNum) {
		return Qdao.delBoard(boardNum);
	}
}
