package com.project.mydoctor.model;

public class Qna {
	private String writeId;
	private String boardsTarget;	// hosId
	private int boardNum;
	private int secret;	// 일반글 - 1, 비밀글 - 0
	private String head;	// 병원 - 공지, 환자 - 문의글
	private String subject;
	private String content;
	private String uploaddate;
	private String reply;	// ""(빈값)이면 답변중

	public String getWriteId() {
		return writeId;
	}

	public void setWriteId(String writeId) {
		this.writeId = writeId;
	}

	public String getBoardsTarget() {
		return boardsTarget;
	}

	public void setBoardsTarget(String boardsTarget) {
		this.boardsTarget = boardsTarget;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate.split(" ")[0];
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
}
