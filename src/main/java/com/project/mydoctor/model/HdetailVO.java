package com.project.mydoctor.model;

/**
 * @author 김건수
 * @병원상세
 */
public class HdetailVO {
	private String yadmNm;
	private String addr;
	private String telno;
	private String hospUrl;
	private String estbDd;

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

	public String getEstbDd() {
		return estbDd;
	}

	public void setEstbDd(String estbDd) {
		this.estbDd = estbDd;
	}

	@Override
	public String toString() {
		return "HdetailVO [yadmNm=" + yadmNm + ", addr=" + addr + ", telno=" + telno + ", hospUrl=" + hospUrl
				+ ", estbDd=" + estbDd + "]";
	}

}
