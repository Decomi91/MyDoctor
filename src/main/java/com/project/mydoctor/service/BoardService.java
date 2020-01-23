package com.project.mydoctor.service;

import java.util.List;

import com.project.mydoctor.model.AdminBoard;
import com.project.mydoctor.model.Board;

public interface BoardService {

	int getAdminRequestListCount();

	List<AdminBoard> getAdminRequestList(int pages);


}
