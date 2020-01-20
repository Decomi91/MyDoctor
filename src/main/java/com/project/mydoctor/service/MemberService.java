package com.project.mydoctor.service;

import javax.servlet.http.HttpSession;

import com.project.mydoctor.model.Member;

public interface MemberService {

	int insertMember(Member member);

	int isId(Member member);

	int isHosId(Member member);

	boolean passck(HttpSession id, String password);

}
