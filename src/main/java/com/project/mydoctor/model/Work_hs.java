package com.project.mydoctor.model;

/**
 * @author 김건수
 * @근무시간
 *
 */
public class Work_hs {

	private String noTrmtSun;// 일요일
	private String noTrmtHoli;// 공휴일
	private String lunchWeek;// 런치타임
	private String rcvSat;// 토요일근무
	private String rcvWeek;// 주말근무

	// 월~일
	private Object trmtMonStart;	
	private Object trmtMonEnd;
	private Object trmtTueStart;
	private Object trmtTueEnd;
	private Object trmtWedStart;
	private Object trmtWedEnd;
	private Object trmtThuStart;
	private Object trmtThuEnd;
	private Object trmtFriStart;
	private Object trmtFriEnd;
	private Object trmtSatStart;
	private Object trmtSatEnd;
	private Object trmtSunStart;
	private Object trmtSunEnd;

	public String getNoTrmtSun() {
		return noTrmtSun;
	}

	public void setNoTrmtSun(String noTrmtSun) {
		if (noTrmtSun == "전부휴진") {
			this.noTrmtSun = noTrmtSun;
		} else {
			this.noTrmtSun = "N";
		}
	}

	public String getNoTrmtHoli() {
		return noTrmtHoli;
	}

	public void setNoTrmtHoli(String noTrmtHoli) {
		if (noTrmtHoli == "전부휴진") {
			this.noTrmtHoli = noTrmtHoli;
		} else {
			this.noTrmtHoli = "N";
		}
	}

	public String getLunchWeek() {
		return lunchWeek;
	}

	public void setLunchWeek(String lunchWeek) {
		this.lunchWeek = lunchWeek;
	}

	public String getRcvSat() {
		return rcvSat;
	}

	public void setRcvSat(String rcvSat) {
		if (rcvSat != null) {
			this.rcvSat = rcvSat;	
		} else {			
			this.rcvSat = "N";	
		}
	}

	public String getRcvWeek() {
		return rcvWeek;
	}

	public void setRcvWeek(String rcvWeek) {
		if (rcvWeek != null) {
			this.rcvWeek = rcvWeek;
		} else {
			this.rcvWeek = "N";
		}
	}

	public Object getTrmtMonStart() {
		return trmtMonStart;
	}

	public void setTrmtMonStart(Object trmtMonStart) {
		this.trmtMonStart = trmtMonStart;
	}

	public Object getTrmtMonEnd() {
		return trmtMonEnd;
	}

	public void setTrmtMonEnd(Object trmtMonEnd) {
		this.trmtMonEnd = trmtMonEnd;
	}

	public Object getTrmtTueStart() {
		return trmtTueStart;
	}

	public void setTrmtTueStart(Object trmtTueStart) {
		this.trmtTueStart = trmtTueStart;
	}

	public Object getTrmtTueEnd() {
		return trmtTueEnd;
	}

	public void setTrmtTueEnd(Object trmtTueEnd) {
		this.trmtTueEnd = trmtTueEnd;
	}

	public Object getTrmtWedStart() {
		return trmtWedStart;
	}

	public void setTrmtWedStart(Object trmtWedStart) {
		this.trmtWedStart = trmtWedStart;
	}

	public Object getTrmtWedEnd() {
		return trmtWedEnd;
	}

	public void setTrmtWedEnd(Object trmtWedEnd) {
		this.trmtWedEnd = trmtWedEnd;
	}

	public Object getTrmtThuStart() {
		return trmtThuStart;
	}

	public void setTrmtThuStart(Object trmtThuStart) {
		this.trmtThuStart = trmtThuStart;
	}

	public Object getTrmtThuEnd() {
		return trmtThuEnd;
	}

	public void setTrmtThuEnd(Object trmtThuEnd) {
		this.trmtThuEnd = trmtThuEnd;
	}

	public Object getTrmtFriStart() {
		return trmtFriStart;
	}

	public void setTrmtFriStart(Object trmtFriStart) {
		this.trmtFriStart = trmtFriStart;
	}

	public Object getTrmtFriEnd() {
		return trmtFriEnd;
	}

	public void setTrmtFriEnd(Object trmtFriEnd) {
		this.trmtFriEnd = trmtFriEnd;
	}

	public Object getTrmtSatStart() {
		return trmtSatStart;
	}

	public void setTrmtSatStart(Object trmtSatStart) {
		if (trmtSatStart != null) {
			this.trmtSatStart = trmtSatStart;
		} else {
			this.trmtSatStart = "N";
		}
	}

	public Object getTrmtSatEnd() {
		return trmtSatEnd;
	}

	public void setTrmtSatEnd(Object trmtSatEnd) {
		if (trmtSatEnd != null) {
			this.trmtSatEnd = trmtSatEnd;
		} else {
			this.trmtSatEnd = "N";
		}
	}

	public Object getTrmtSunStart() {
		return trmtSunStart;
	}

	public void setTrmtSunStart(Object trmtSunStart) {
		if (trmtSunStart != null) {
			this.trmtSunStart = trmtSunStart;
		} else {
			this.trmtSunStart = "N";
		}
	}

	public Object getTrmtSunEnd() {
		return trmtSunEnd;
	}

	public void setTrmtSunEnd(Object trmtSunEnd) {
		if(trmtSunEnd!=null) {
		this.trmtSunEnd = trmtSunEnd;
		}else {
			this.trmtSunEnd = "N";
		}
	}

	@Override
	public String toString() {
		return "Work_hs [noTrmtSun=" + noTrmtSun + ", noTrmtHoli=" + noTrmtHoli + ", lunchWeek=" + lunchWeek
				+ ", rcvSat=" + rcvSat + ", rcvWeek=" + rcvWeek + ", trmtMonStart=" + trmtMonStart + ", trmtMonEnd="
				+ trmtMonEnd + ", trmtTueStart=" + trmtTueStart + ", trmtTueEnd=" + trmtTueEnd + ", trmtWedStart="
				+ trmtWedStart + ", trmtWedEnd=" + trmtWedEnd + ", trmtThuStart=" + trmtThuStart + ", trmtThuEnd="
				+ trmtThuEnd + ", trmtFriStart=" + trmtFriStart + ", trmtFriEnd=" + trmtFriEnd + ", trmtSatStart="
				+ trmtSatStart + ", trmtSatEnd=" + trmtSatEnd + ", trmtSunStart=" + trmtSunStart + ", trmtSunEnd="
				+ trmtSunEnd + "]";
	}
}
