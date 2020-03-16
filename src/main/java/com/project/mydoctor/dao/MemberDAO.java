package com.project.mydoctor.dao;

import java.util.Map;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Member;

@Repository
public class MemberDAO { 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMember(Member member) {
		return sqlSession.insert("Members.insertMember", member);
	}

	public int isID(Member member) {
		return sqlSession.selectOne("Members.isId", member);
	}
 
	public int isHosId(Member member) {
		return sqlSession.selectOne("Hospitals.isId", member);
	}

	public int getlistcount() {
		return sqlSession.selectOne("Members.getlistcount");
	}

	public List<Member> getmemList(int pages) {
		return sqlSession.selectList("Members.getmemlist", pages);
	}

	public String idcheckpub(String id) {
		return sqlSession.selectOne("Members.idcheck", id);
	}

	public String idcheckhos(String id) {
		return sqlSession.selectOne("Hospitals.idcheck", id);

	}
	///////////////////jisu///////////////////////////
	
	public Member passck(Map<String, Object> map) {
		return sqlSession.selectOne("Members.passck",map);
	}
	
	
	public Member my_info(String id) {
		return sqlSession.selectOne("Members.myinfo", id);
	}
	
	public int update(Member member) {
		return  sqlSession.update("Members.update", member);
	}
	
	///////////////////////jisu_0122//////////////////
	public int updatePass(Map<String, Object> map) {
		return  sqlSession.update("Members.updatePass", map);
	}

	public int removeaccount(String id) {
		return sqlSession.update("Members.removeaccount", id);
	}

	/* 유리씨 */
	public Member select(String id) {
		return sqlSession.selectOne("Members.select", id);
	}

	public int removehosaccount(Member mem) {
		return sqlSession.update("Members.removehosaccount", mem);
	}

	// yuri
	public Member ididCheck(String id) {
		return sqlSession.selectOne("Members.ididCheck", id);
}
	public String findId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Members.findId", map);
	}

	public int findPwd(Map<String, Object> map) {
		
		return sqlSession.selectOne("Members.findPwd", map);
	}
}

