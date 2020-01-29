package com.project.mydoctor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Reservation;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Reservation> select(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.select", map);
	}

	public int yesAccept(String memberId) {
		return sqlSession.selectOne("Reservations.yesAccept", memberId);
	}
  
	public int reserveCount(String memberId) {
		return sqlSession.selectOne("Reservations.reserveCount", memberId);
	}

	public int getListCount(String memberId) {
		return sqlSession.selectOne("Reservations.getListCount", memberId);
	}

	public List<Reservation> hosGetReserveList(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.hosGetReserveList", map);
	}

	public int hosGetListCount(String hosId) {
		return sqlSession.selectOne("Reservations.hosGetListCount", hosId);
	}

	public int hosGetTodayListCount(String hosId) {
		return sqlSession.selectOne("Reservations.hosGetTodayListCount", hosId);
	}

	public List<Reservation> hosGetTodayReserveList(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.hosGetTodayReserveList", map);
	}

	public int hosGetDiagListCount(String hosId) {
		return sqlSession.selectOne("Reservations.hosGetDiagListCount", hosId);
	}

	public List<Reservation> hosGetDiagList(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.hosGetDiagList", map);
	}

	public int hosGetAllReserveListCount(String hosId) {
		return sqlSession.selectOne("Reservations.hosGetAllReserveListCount", hosId);
	}

	public List<Reservation> hosGetAllReserveList(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.hosGetAllReserveList", map);
	}
}
