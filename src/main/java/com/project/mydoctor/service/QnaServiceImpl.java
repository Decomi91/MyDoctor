package com.project.mydoctor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mydoctor.dao.QnaDAO;
import com.project.mydoctor.model.Qna;


@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDAO Qdao;
	@Override
	public void insertQna(Qna qna) {
		// TODO Auto-generated method stub
		Qdao.insertQna(qna);
	}
	

}
