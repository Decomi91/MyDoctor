package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import com.project.mydoctor.model.Bookmark;

public interface BookmarkService {

	int insert(Map<String, Object> map);

	int delete(Map<String, Object> map);

	Bookmark isBookmark(Map<String, Object> map);

	List<Bookmark> getBookmarkList(String memberId);

	int getListCount(String memberId);

}
