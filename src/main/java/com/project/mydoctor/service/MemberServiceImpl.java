package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.MemberDAO;
import com.project.mydoctor.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;
	
	@Override
	public int insertMember(Member member) {
		return mDao.insertMember(member);
	}

	@Override
	public int isId(Member member) {
		return mDao.isID(member);
	}

	@Override
	public int isHosId(Member member) {
		return mDao.isHosId(member);
	}

	@Override
	public boolean passck(HttpSession id, String password) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		Member result=mDao.passck(map);
		if(result==null)
			return false;
		else
			return true;
		
	}

	
	
}
