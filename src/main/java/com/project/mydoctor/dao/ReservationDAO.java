package com.project.mydoctor.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Reservation;

@Repository
public class ReservationDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Map<String, Object> map) {
		return sqlSession.insert("Reservations.insert", map);
	}

	public Reservation getReserveDetail(int reserveNo) {
		return sqlSession.selectOne("Reservations.getReserveDetail", reserveNo);
	}

	public int cancel(int reserveNo) {
		return sqlSession.update("Reservations.cancel", reserveNo);
	}

	public int reserveOk(int reserveNo) {
		return sqlSession.update("Reservations.reserveOk", reserveNo);
	}

}
