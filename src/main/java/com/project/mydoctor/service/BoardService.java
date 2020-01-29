package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.AdminBoard;

public interface BoardService {

	int getAdminRequestListCount();

	List<AdminBoard> getAdminRequestList(int pages);

	AdminBoard getAdminRequestDetail(int boardnum);

	Object getAdminRequestNoCheckListCount();

	int setAdminRequestReply(AdminBoard board);

}
