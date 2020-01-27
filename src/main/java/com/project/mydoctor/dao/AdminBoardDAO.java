package com.project.mydoctor.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.AdminBoard;

@Repository
public class AdminBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getlistcount() {
		return sqlSession.selectOne("AdminBoards.getlistcount");
	}

	public List<AdminBoard> getboardlist(int pages) {
		return sqlSession.selectList("AdminBoards.getboardlist", pages);
	}

	public AdminBoard getAdminRequestDeatil(int boardnum) {
		return sqlSession.selectOne("AdminBoards.getdetail", boardnum);
	}

	public Object getAdminRequestNoCheckListcount() {
		return sqlSession.selectOne("AdminBoards.getnochecklistcount");
	}

	public void setChecking1(int boardnum) {
		sqlSession.update("AdminBoards.setchecking", boardnum);
	}

	public int setAdminRequestReply(AdminBoard board) {
		return sqlSession.update("AdminBoards.setreply", board);
	}

}
