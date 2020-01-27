package com.project.mydoctor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.AdminBoardDAO;
import com.project.mydoctor.model.AdminBoard;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private AdminBoardDAO abDAO;
	
	@Override
	public int getAdminRequestListCount() {
		return abDAO.getlistcount();
	}

	@Override
	public List<AdminBoard> getAdminRequestList(int pages) {
		return abDAO.getboardlist(pages);
	}

	@Override
	public AdminBoard getAdminRequestDetail(int boardnum) {
		AdminBoard board = abDAO.getAdminRequestDeatil(boardnum);
		if(board.getChecking()==0) {
			abDAO.setChecking1(board.getBoardNum());
			board.setChecking(1);
		}
		return abDAO.getAdminRequestDeatil(boardnum);
	}

	@Override
	public Object getAdminRequestNoCheckListCount() {
		return abDAO.getAdminRequestNoCheckListcount();
	}

	@Override
	public int setAdminRequestReply(AdminBoard board) {
		return abDAO.setAdminRequestReply(board);
	}

}
