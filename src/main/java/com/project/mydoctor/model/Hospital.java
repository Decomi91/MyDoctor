package com.project.mydoctor.model;

/**
 * @author 김건수
 * @병원회원가입
 * 
 */
public class Hospital {
	private String id; //아이디
	private String password; //비밀번호
	private String yadmNm; //병원명
	private String addr; //주소
	private long hphone; //전화번호
	private String yki; //요양기호
	//근무시간
	private int doctors;
	private int monStart;
	private int monEnd;
	private int tueStart;
	private int tueEnd;
	private int wedStart;
	private int wedEnd;
	private int thuStart;
	private int thuEnd;
	private int friStart;
	private int friEnd;
	private int satStart;
	private int satEnd;
	private int sunStart;
	private int sunEnd;
	private int lunchStart;
	private int lunchEnd;
	private byte joinok;
	private String joindate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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

	public long getHphone() {
		return hphone;
	}
	public void setHphone(long hphone) {
		this.hphone = hphone;
	}
	public String getYki() {
		return yki;
	}
	public void setYki(String yki) {
		this.yki = yki;
	}
	
	public int getDoctors() {
		return doctors;
	}
	public void setDoctors(int doctors) {
		this.doctors = doctors;
	}
	public int getMonStart() {
		return monStart;
	}
	public void setMonStart(int monStart) {
		this.monStart = monStart;
	}
	public int getMonEnd() {
		return monEnd;
	}
	public void setMonEnd(int monEnd) {
		this.monEnd = monEnd;
	}
	public int getTueStart() {
		return tueStart;
	}
	public void setTueStart(int tueStart) {
		this.tueStart = tueStart;
	}
	public int getTueEnd() {
		return tueEnd;
	}
	public void setTueEnd(int tueEnd) {
		this.tueEnd = tueEnd;
	}
	public int getWedStart() {
		return wedStart;
	}
	public void setWedStart(int wedStart) {
		this.wedStart = wedStart;
	}
	public int getWedEnd() {
		return wedEnd;
	}
	public void setWedEnd(int wedEnd) {
		this.wedEnd = wedEnd;
	}
	public int getThuStart() {
		return thuStart;
	}
	public void setThuStart(int thuStart) {
		this.thuStart = thuStart;
	}
	public int getThuEnd() {
		return thuEnd;
	}
	public void setThuEnd(int thuEnd) {
		this.thuEnd = thuEnd;
	}
	public int getFriStart() {
		return friStart;
	}
	public void setFriStart(int friStart) {
		this.friStart = friStart;
	}
	public int getFriEnd() {
		return friEnd;
	}
	public void setFriEnd(int friEnd) {
		this.friEnd = friEnd;
	}
	public int getSatStart() {
		return satStart;
	}
	public void setSatStart(int satStart) {
		this.satStart = satStart;
	}
	public int getSatEnd() {
		return satEnd;
	}
	public void setSatEnd(int satEnd) {
		this.satEnd = satEnd;
	}
	public int getSunStart() {
		return sunStart;
	}
	public void setSunStart(int sunStart) {
		this.sunStart = sunStart;
	}
	public int getSunEnd() {
		return sunEnd;
	}
	public void setSunEnd(int sunEnd) {
		this.sunEnd = sunEnd;
	}
	public int getLunchStart() {
		return lunchStart;
	}
	public void setLunchStart(int lunchStart) {
		this.lunchStart = lunchStart;
	}
	public int getLunchEnd() {
		return lunchEnd;
	}
	public void setLunchEnd(int lunchEnd) {
		this.lunchEnd = lunchEnd;
	}
	public byte getJoinok() {
		return joinok;
	}
	public void setJoinok(byte joinok) {
		this.joinok = joinok;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate.split(" ")[0];
	}
	@Override
	public String toString() {
		return "Hospital [id=" + id + ", password=" + password + ", yadmNm=" + yadmNm + ", addr=" + addr + ", hphone="
				+ hphone + ", yki=" + yki + ", doctors=" + doctors + ", monStart=" + monStart + ", monEnd=" + monEnd
				+ ", tueStart=" + tueStart + ", tueEnd=" + tueEnd + ", wedStart=" + wedStart + ", wedEnd=" + wedEnd
				+ ", thuStart=" + thuStart + ", thuEnd=" + thuEnd + ", friStart=" + friStart + ", friEnd=" + friEnd
				+ ", satStart=" + satStart + ", satEnd=" + satEnd + ", sunStart=" + sunStart + ", sunEnd=" + sunEnd
				+ ", lunchStart=" + lunchStart + ", lunchEnd=" + lunchEnd + ", joinok=" + joinok + ", joindate="
				+ joindate + "]";
	}
	

	
	
}
