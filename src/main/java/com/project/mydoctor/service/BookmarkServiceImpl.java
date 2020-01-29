package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.BookmarkDAO;
import com.project.mydoctor.model.Bookmark;

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
	public List<Bookmark> getBookmarkList(String memberId) {
		return bDAO.getBookmarkList(memberId);
	}

	@Override
	public int getListCount(String memberId) {
		return bDAO.getListCount(memberId);
	}

}
