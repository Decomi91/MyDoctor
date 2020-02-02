package com.project.mydoctor.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Review;
import com.project.mydoctor.model.Score;


@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Review.listcount", id);
	}

	public List<Review> getMyReviewList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Review.list", map);
	}

	public Score getScore(String hosId) {
		return sqlSession.selectOne("Review.getscore", hosId);
	}

	public int getHosListCount(String hosId) {
		return sqlSession.selectOne("Review.hoslistcount", hosId);
	}

	public List<Review> getHosReviewList(HashMap<String, Object> map) {
		return sqlSession.selectList("Review.hoslist", map);
	}

	public Review getDetail(Review rev) {
		return sqlSession.selectOne("Review.getDetail", rev);
	}

}
