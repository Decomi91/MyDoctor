package com.project.mydoctor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.HospitalDAO;
import com.project.mydoctor.model.Hospital;

@Service
public class HospitalServiceImpl implements HospitalService {
	@Autowired
	private HospitalDAO hDAO;

	@Override
	public int getlistCount() {
		return hDAO.getlistCount();
	}

	@Override
	public List<Hospital> gethosList(int page) {
		return hDAO.gethosList(page);
	}

	@Override
	public int hs_insert(Hospital vo) {
		return hDAO.hs_insert(vo);
	}

	@Override
	public List<Hospital> getHosListTest() {
		return hDAO.getHosListTest();
	}

	@Override
	public Hospital getDetail(String id) {
		// TODO Auto-generated method stub
		return hDAO.getDetail(id);
	}
}
