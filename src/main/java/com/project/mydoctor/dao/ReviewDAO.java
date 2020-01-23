package com.project.mydoctor.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Review;


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

}
