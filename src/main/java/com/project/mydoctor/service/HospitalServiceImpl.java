package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

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
	public Hospital getDetail(String yki) {
		return hDAO.getDetail(yki);
	}

	@Override
	public int getSignRequestCount() {
		return hDAO.getSignRequestCount();
	}

	@Override
	public List<Hospital> getSignRequestList(int page) {
		return hDAO.getSignRequestList(page);
	}

	@Override
	public Hospital getDetailforId(String hosid) {
		return hDAO.getDetailforId(hosid);
	}

	@Override
	public int setJoinOkay(String hosid) {
		return hDAO.setJoinOkay(hosid);
	}

	@Override
	public int widthdraw(String hosid) {
		return hDAO.widthdraw(hosid);
	}

  @Override
	public Hospital getDetail2(String yki) {
		return hDAO.getDetail2(yki);
	}

	@Override
	public Hospital getFavorites(String yki) {
		// TODO Auto-generated method stub
		return hDAO.getFavorites(yki);
	}

	@Override
	public int Fa_insert(Map<String, String> fa) {
		// TODO Auto-generated method stub
		return hDAO.fa_insert(fa);
	}

	@Override
	public int Fa_delete(Map<String, String> fa) {
		// TODO Auto-generated method stub
		return hDAO.fa_delete(fa);
	}

	@Override
	public String getFavorite_sel(String fa_hos) {
		// TODO Auto-generated method stub
		return hDAO.getFavorite_sel(fa_hos);
	}

	@Override
	public String getFavorite_re(Map<String, String> fa) {
		// TODO Auto-generated method stub
		return hDAO.getFavorite_re(fa);
	}

	@Override
	public String getHosId(String ykiho) {
		return hDAO.getHosId(ykiho);
	}

	

}
