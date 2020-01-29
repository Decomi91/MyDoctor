package com.project.mydoctor.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mydoctor.model.Bookmark;

@Repository
public class BookmarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Map<String, Object> map) {
		return sqlSession.insert("Bookmarks.insert", map);
	}

	public int delete(Map<String, Object> map) {
		return sqlSession.delete("Bookmarks.delete", map);
	}

	public Bookmark isBookmark(Map<String, Object> map) {
		return sqlSession.selectOne("Bookmarks.isBookmark", map);
	}

	public List<Bookmark> getBookmarkList(String memberId) {
		return sqlSession.selectList("Bookmarks.getBookmarkList", memberId);
	}

	public int getListCount(String memberId) {
		return sqlSession.selectOne("Bookmarks.getListCount", memberId);
	}
}
