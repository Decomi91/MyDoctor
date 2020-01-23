package com.project.mydoctor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.AdminBoardDAO;
import com.project.mydoctor.model.AdminBoard;
import com.project.mydoctor.model.Board;

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


}
