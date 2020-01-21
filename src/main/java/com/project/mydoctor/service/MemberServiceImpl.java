package com.project.mydoctor.service;

import java.util.List;

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
	public int getlistCount() {
		return mDao.getlistcount();
	}

	@Override
	public List<Member> getmemList(int pages) {
		return mDao.getmemList(pages);
	}

	@Override
	public String idcheck(String id, String pub) {
		if(pub.equals("hos")) {
			return mDao.idcheckhos(id);
		}else {
			return mDao.idcheckpub(id);
		}
	}
	
	@Override
	public Member select(String id) {
		return mDao.select(id);
	}
}
