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

	public int getListCount(String memberId) {
		return sqlSession.selectOne("Reservations.getListCount", memberId);
	}

	public List<Reservation> hosGetReserveList(HashMap<String, Object> map) {
		return sqlSession.selectList("Reservations.hosGetReserveList", map);
	}

	public int hosGetListCount(String hosId) {
		return sqlSession.selectOne("Reservations.hosGetListCount", hosId);
	}
}
