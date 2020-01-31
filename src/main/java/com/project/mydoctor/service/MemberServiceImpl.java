package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
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
	//////////////////////jisu/////////////////
	@Override
	public boolean passck(String id, String password) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		Member result=mDao.passck(map);
		if(result==null)
			return false;
		else 
			return true;
	}
	
	@Override
	public Member my_info(String id) {
	// TODO Auto-generated method stub
	return mDao.my_info(id);
	}
	
	@Override
	public int update(Member member) {
	// TODO Auto-generated method stub
	return mDao.update(member);
	}
	////////////////////////////
	@Override
	public Member select(String id) {
		return mDao.select(id);
	}
	
	////////////////////jisu_0122//////////////////
	@Override
	public int updatePass(String newPassword, String id) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", newPassword);
		System.out.println("새 패스워드: "+newPassword);
		int result=mDao.updatePass(map);
	
		return result;
	}
	
	@Override
	public int removeaccount(String id) {
		return mDao.removeaccount(id);
	}

	@Override
	public int removehosaccount(Member mem) {
		return mDao.removehosaccount(mem);
	}

}

