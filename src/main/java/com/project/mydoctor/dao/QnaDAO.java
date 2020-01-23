package com.project.mydoctor.dao;

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

}
