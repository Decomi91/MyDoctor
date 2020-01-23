package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.MypageDAO;
import com.project.mydoctor.model.Reservation;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mDAO;

	@Override
	public List<Reservation> select(String memberId, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page-1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("memberId", memberId);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return mDAO.select(map);
	}

	@Override
	public List<Map<String, Integer>> reserveCount(String memberId) {
		return mDAO.reserveCount(memberId);
	}

	@Override
	public int getListCount(String memberId) {
		return mDAO.getListCount(memberId);
	}

}
