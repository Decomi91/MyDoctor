package com.project.mydoctor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.BookmarkDAO;
import com.project.mydoctor.model.Bookmark;
import com.project.mydoctor.model.Hospital;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	@Autowired
	private BookmarkDAO bDAO;

	@Override
	public int insert(Map<String, Object> map) {
		return bDAO.insert(map);
	}

	@Override
	public int delete(Map<String, Object> map) {
		return bDAO.delete(map);
	}

	@Override
	public Bookmark isBookmark(Map<String, Object> map) {
		return bDAO.isBookmark(map);
	}

	@Override
	public List<Hospital> getBookmarkList(String memberId, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("memberId", memberId);
		map.put("start", startrow);
		map.put("end", endrow);

		return bDAO.getBookmarkList(map);
	}

	@Override
	public int getListCount(String memberId) {
		return bDAO.getListCount(memberId);
	}

}
