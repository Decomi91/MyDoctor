package com.project.mydoctor.service;

import javax.servlet.http.HttpSession;
import java.util.List;

import com.project.mydoctor.model.Member;

public interface MemberService {

	int insertMember(Member member);

	int isId(Member member); 

	int isHosId(Member member);

	
	int getlistCount();

	List<Member> getmemList(int pages);

	String idcheck(String id, String pub);
////////////////////////////////jisu//////////////////////
boolean passck(String id, String password);


Member my_info(String id);

int update(Member member);
}
