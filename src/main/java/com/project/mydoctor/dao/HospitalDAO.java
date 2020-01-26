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
		return sqlSession.selectList("Hospitals.gethoslist", page);
	}
	
	public int hs_insert(Hospital vo) {
		return sqlSession.insert("Hospitals.hs_insert", vo);
	}

	public List<Hospital> getHosListTest() {
		return sqlSession.selectList("Hospitals.gethoslisttest");
	}

	public Hospital getDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Hospitals.getdetail", id);
	}

	public Hospital getDetail2(String yki) {
		return sqlSession.selectOne("Hospitals.getdetail2", yki);
	}
	
	

}
