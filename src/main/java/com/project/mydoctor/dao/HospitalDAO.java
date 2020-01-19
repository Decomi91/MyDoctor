package com.project.mydoctor.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Hospital;

@Repository
public class HospitalDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getlistCount() {
		return sqlSession.selectOne("Hospitals.getlistcount");
	}

	public List<Hospital> gethosList(int page) {
		System.out.println(page);
		return sqlSession.selectList("Hospitals.gethoslist", page);
	}

}
