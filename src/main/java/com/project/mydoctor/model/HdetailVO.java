package com.project.mydoctor.model;

/**
 * @author 김건수
 * @병원상세
 */
public class HdetailVO {
	private String YPos;
	private String XPos;
	private String yadmNm;
	private String addr;
	private String telno;
	private String hospUrl;
	private long estbDd;
	public String getYPos() {
		return YPos;
	}
	public void setYPos(String yPos) {
		YPos = yPos;
	}
	public String getXPos() {
		return XPos;
	}
	public void setXPos(String xPos) {
		XPos = xPos;
	}
	public String getYadmNm() {
		return yadmNm;
	}
	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getHospUrl() {
		return hospUrl;
	}
	public void setHospUrl(String hospUrl) {
		this.hospUrl = hospUrl;
	}
	public long getEstbDd() {
		return estbDd;
	}
	public void setEstbDd(long estbDd) {
		this.estbDd = estbDd;
	}
	@Override
	public String toString() {
		return "HdetailVO [YPos=" + YPos + ", XPos=" + XPos + ", yadmNm=" + yadmNm + ", addr=" + addr + ", telno="
				+ telno + ", hospUrl=" + hospUrl + ", estbDd=" + estbDd + "]";
	}
	

}
