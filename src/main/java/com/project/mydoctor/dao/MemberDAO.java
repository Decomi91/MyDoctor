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
		return sqlSession.selectOne("Hospitals.idcheck", id);
	}

	public String idcheckhos(String id) {
		return sqlSession.selectOne("Members.idcheck", id);

	}
///////////////////jisu///////////////////////////

public Member passck(Map<String, Object> map) {
// TODO Auto-generated method stub
return sqlSession.selectOne("Members.passck",map);
}


public Member my_info(String id) {
// TODO Auto-generated method stub
return sqlSession.selectOne("Members.myinfo", id);
}

public int update(Member member) {
// TODO Auto-generated method stub
return  sqlSession.update("Members.update", member);
}
}
