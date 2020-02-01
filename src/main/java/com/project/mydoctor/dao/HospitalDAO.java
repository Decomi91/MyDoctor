package com.project.mydoctor.dao;

import java.util.List;
import java.util.Map;

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

	public Hospital getDetail(String yki) {
		return sqlSession.selectOne("Hospitals.getdetail", yki);
	}

	public int getSignRequestCount() {
		return sqlSession.selectOne("Hospitals.getsignlistcount");
	}

	public List<Hospital> getSignRequestList(int page) {
		return sqlSession.selectList("Hospitals.getsignlist",page);
	}

	public Hospital getDetailforId(String hosid) {
		return sqlSession.selectOne("Hospitals.getdetailforid", hosid);
	}

	public int setJoinOkay(String hosid) {
		return sqlSession.update("Hospitals.setjoinokay",hosid);
	}

	public int widthdraw(String hosid) {
		return sqlSession.update("Hospitals.widthdraw", hosid);
	}
	public Hospital getDetail2(String yki) {
		return sqlSession.selectOne("Hospitals.getdetail", yki);
	}
	
	public Hospital getFavorites(String yki) {
		return sqlSession.selectOne("Hospitals.select_yki", yki);
	}
	
	public String getFavorite_sel(String fa_hos) {
		return sqlSession.selectOne("Hospitals.fa_sel",fa_hos);
	}
	
	public String getFavorite_re(Map<String, String> fa) {
		return sqlSession.selectOne("Hospitals.fa_re", fa);
	}
	
	public int fa_insert(Map<String, String> fa) {
		return sqlSession.insert("Hospitals.fa_insert",fa);
	}
	
	public int fa_delete(Map<String, String> fa) {
		return sqlSession.delete("Hospitals.fa_delete",fa);
	}

	public String getHosId(String ykiho) {
		return sqlSession.selectOne("Hospitals.getHosId", ykiho);
	}
}
