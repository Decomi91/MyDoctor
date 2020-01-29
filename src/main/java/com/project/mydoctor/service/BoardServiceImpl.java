package com.project.mydoctor.service;

import java.util.HashMap;
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

	@Override
	public int getreqListCount(String id) {
		// TODO Auto-generated method stub
		int listcount=abDAO.getListCount(id);
		return listcount;
	}

	@Override
	public List<AdminBoard> getMyReqList(int page, int limit, String id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String,Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("id", id);
		return abDAO.getMyReqList(map);
	}

}
