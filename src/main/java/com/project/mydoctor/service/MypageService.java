package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import com.project.mydoctor.model.Reservation;

public interface MypageService {

	List<Reservation> select(String memberId, int page, int limit);

	int reserveCount(String loginId);

	int getListCount(String memberId);

}
