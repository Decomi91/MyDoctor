package com.project.mydoctor.model;

import java.util.Arrays;

/**
 * @author 김건수
 * @병원상세
 */
public class HdetailVO {
	private String YPos;
	private String XPos;
	private String ykiho;
	private String yadmNm;
	private String clCdNm;//큰 상세
	private String postNo;
	private String addr;
	private String telno;
	private String hospUrl;//url
	private String estbDd;//개설일자
	private String drTotCnt;//의사총수
	private String dgsbjtCdNm;//상세 진료
	
	
	
	public String getDgsbjtCdNm() {
		return dgsbjtCdNm;
	}
	public void setDgsbjtCdNm(String dgsbjtCdNm) {
		this.dgsbjtCdNm = dgsbjtCdNm;
	}
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
	public String getYkiho() {
		return ykiho;
	}
	public void setYkiho(String ykiho) {
		this.ykiho = ykiho;
	}
	public String getYadmNm() {
		return yadmNm;
	}
	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}
	public String getClCdNm() {
		return clCdNm;
	}
	public void setClCdNm(String clCdNm) {
		this.clCdNm = clCdNm;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
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
	public String getEstbDd() {
		return estbDd;
	}
	public void setEstbDd(String estbDd) {
		this.estbDd = estbDd;
	}
	public String getDrTotCnt() {
		return drTotCnt;
	}
	public void setDrTotCnt(String drTotCnt) {
		this.drTotCnt = drTotCnt;
	}
	@Override
	public String toString() {
		return "HdetailVO [YPos=" + YPos + ", XPos=" + XPos + ", ykiho=" + ykiho + ", yadmNm=" + yadmNm + ", clCdNm="
				+ clCdNm + ", postNo=" + postNo + ", addr=" + addr + ", telno=" + telno + ", hospUrl=" + hospUrl
				+ ", estbDd=" + estbDd + ", drTotCnt=" + drTotCnt + ", dgsbjtCdNm=" + dgsbjtCdNm + "]";
	}
	
}
