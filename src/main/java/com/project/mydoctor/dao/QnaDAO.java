package com.project.mydoctor.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Qna;
@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Qna.insertqna", qna);
	}
	public int getListCount(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Qna.qnalistcount", id);
	}
	public List<Qna> getMyQnaList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Qna.qnalist", map);
	}
	public int insert(Qna qna) {
		return sqlSession.insert("Qna.insert", qna);
	}
	public int getCount(String hosId) {
		return sqlSession.selectOne("Qna.getCount", hosId);
	}
	public List<Qna> getQnaList(HashMap<String, Object> map) {
		return sqlSession.selectList("Qna.getQnaList", map);
	}

	public int hosGetBoardCount(String hosId) {
		return sqlSession.selectOne("Qna.hosGetBoardCount", hosId);
	}

	public List<Qna> hosGetBoardList(HashMap<String, Object> map) {
		return sqlSession.selectList("Qna.hosGetBoardList", map);
	}
	public int setReply(Qna qna) {
		return sqlSession.update("Qna.setreply", qna);
	}
	public Qna getDetail(int boardNum) {
		return sqlSession.selectOne("Qna.getdetail", boardNum);
	}
	public int getNoReplyQnaCount(String id) {
		return sqlSession.selectOne("Qna.getnoreplyqnacount", id);
	}
	public List<Qna> hosGetNoReplyBoardList(HashMap<String, Object> map) {
		return sqlSession.selectList("Qna.hosGetNoReplyBoardList", map);
	}
	public int delBoard(int boardNum) {
		return sqlSession.delete("Qna.delBoard", boardNum);
	}

}
