package com.project.mydoctor.model;

public class Reservation {
	private int reserveNo;
	private String id; // 환자 아이디
	private String name; // 환자 이름
	private String hosid;
	private String hosname;
	private String disease;
	private String reserveTime;
	private int acceptance; // 거절할 경우 -1, 대기중일 경우 0, 승낙할 경우 1, 진료완료 2

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHosid() {
		return hosid;
	}

	public void setHosid(String hosid) {
		this.hosid = hosid;
	}

	public String getHosname() {
		return hosname;
	}

	public void setHosname(String hosname) {
		this.hosname = hosname;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime.substring(0,reserveTime.length()-3);
	}

	public int getAcceptance() {
		return acceptance;
	}

	public void setAcceptance(int acceptance) {
		this.acceptance = acceptance;
	}

}
