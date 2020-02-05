package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.ReservationDAO;
import com.project.mydoctor.model.Reservation;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Autowired
	private ReservationDAO rDAO;

	@Override
	public int insert(Map<String, Object> map) {
		return rDAO.insert(map);
	}
	
	@Override
	public Reservation getReserveDetail(int reserveNo) {
		return rDAO.getReserveDetail(reserveNo);
	}

	@Override
	public int cancel(int reserveNo) {
		return rDAO.cancel(reserveNo);
	}

	@Override
	public int reserveOk(int reserveNo) {
		return rDAO.reserveOk(reserveNo);
	}

	@Override
	public List<Integer> getReserves(String id) {
		return rDAO.getReserves(id);
	}

	@Override
	public int diagnosisOk(int reserveNo) {
		return rDAO.diagnosisOk(reserveNo);
	}

  @Override
	public int hoscancel(int reserveNo) {
		return rDAO.hoscancel(reserveNo);
	}

@Override
public int reviewCheck(Reservation reservation) {
	return rDAO.reviewCheck(reservation);
}
}
