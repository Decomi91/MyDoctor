package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Reservation;

public interface MypageService {

	List<Reservation> select(String memberId, int page, int limit);

	int yesAccept(String loginId);
  
	int reserveCount(String loginId);

	int getListCount(String memberId);

	List<Reservation> hosGetReserveList(String hosId, int page, int limit);

	int hosGetListCount(String hosId);

	
}
