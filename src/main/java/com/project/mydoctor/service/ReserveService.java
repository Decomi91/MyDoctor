package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import com.project.mydoctor.model.Reservation;

public interface ReserveService {

	int insert(Map<String, Object> map);
	
	Reservation getReserveDetail(int reserveNo);

	int cancel(int reserveNo);

	int reserveOk(int reserveNo);

	List<Integer> getReserves(String id);

	int diagnosisOk(int reserveNo);

	

}
