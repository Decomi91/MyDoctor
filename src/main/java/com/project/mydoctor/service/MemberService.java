package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.Member;

public interface MemberService {

	int insertMember(Member member);

	int isId(Member member);

	int isHosId(Member member);

	int getlistCount();

	List<Member> getmemList(int pages);

}
