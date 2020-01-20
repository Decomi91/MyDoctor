package com.project.mydoctor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.HospitalDAO;
import com.project.mydoctor.model.Hospital;

@Service
public class HospitalService {

	@Autowired
	private HospitalDAO hDAO;
	
	public int getlistCount() {
		return hDAO.getlistCount();
	}

	public List<Hospital> gethosList(int page) {
		return hDAO.gethosList(page);
	}
	
	public int hs_insert(Hospital vo) {
		return hDAO.hs_insert(vo);
	}
	
}
