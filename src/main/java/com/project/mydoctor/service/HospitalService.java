package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import com.project.mydoctor.model.Hospital;

public interface HospitalService {
	public int getlistCount();

	public List<Hospital> gethosList(int page);

	public int hs_insert(Hospital vo);
	
	public List<Hospital> getHosListTest();

	public int getSignRequestCount();

	public List<Hospital> getSignRequestList(int pages);

	public Hospital getDetailforId(String hosid);

	public int setJoinOkay(String hosid);

	public int widthdraw(String hosid);
  
	public Hospital getDetail(String id);

	public Hospital getDetail2(String yki);
	
	public Hospital getFavorites(String yki);
	
	public String getFavorite_sel(String fa_hos);
	
	public String getFavorite_re(Map<String, String> fa);

	public int Fa_insert(Map<String, String> fa);
	
	public int Fa_delete(Map<String, String> fa);
}
