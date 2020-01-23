package com.project.mydoctor.service;

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
}
