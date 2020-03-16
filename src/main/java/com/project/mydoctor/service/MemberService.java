package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Member;

public interface MemberService {

	int insertMember(Member member);

	int isId(Member member); 

	int isHosId(Member member);

	int getlistCount();

	List<Member> getmemList(int pages);

	String idcheck(String id, String pub);
	//////////////////////////////////////////
	Member select(String memberId);
	////////////////////////////////jisu//////////////////////
	boolean passck(String id, String password);
	
	Member my_info(String id);
	
	int update(Member member);
	
	//////////////////////////////////jisu_0122//////////////
	int updatePass(String newPassword, String id);
	
	int removeaccount(String id);

	int removehosaccount(Member mem);

	// yuri id 중복 체크
	int ididCheck(String id);

  String findId(String name, String email);

	int idExist(String name, String id, String email);
}