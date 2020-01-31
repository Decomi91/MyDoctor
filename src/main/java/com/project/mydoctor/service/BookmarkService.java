package com.project.mydoctor.service;

import java.util.List;
import java.util.Map;

import com.project.mydoctor.model.Bookmark;
import com.project.mydoctor.model.Hospital;

public interface BookmarkService {

	int insert(Map<String, Object> map);

	int delete(Map<String, Object> map);

	Bookmark isBookmark(Map<String, Object> map);

	List<Hospital> getBookmarkList(String memberId, int page, int limit);

	int getListCount(String memberId);

}
