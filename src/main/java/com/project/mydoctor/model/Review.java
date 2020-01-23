package com.project.mydoctor.model;

import java.sql.Date;

public class Review {
private String id;
private String password;
private String hospital;
private int reviewNum;
private String subject;
private String content;
private int kindness;
private int ability;
private int price;
private Date uploaddate;
private Date visited;
private String reply;
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
public String getHospital() {
	return hospital;
}
public void setHospital(String hospital) {
	this.hospital = hospital;
}
public int getReviewNum() {
	return reviewNum;
}
public void setReviewNum(int reviewNum) {
	this.reviewNum = reviewNum;
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
public int getKindness() {
	return kindness;
}
public void setKindness(int kindness) {
	this.kindness = kindness;
}
public int getAbility() {
	return ability;
}
public void setAbility(int ability) {
	this.ability = ability;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public Date getUploaddate() {
	return uploaddate;
}
public void setUploaddate(Date uploaddate) {
	this.uploaddate = uploaddate;
}
public Date getVisited() {
	return visited;
}
public void setVisited(Date visited) {
	this.visited = visited;
}
public String getReply() {
	return reply;
}
public void setReply(String reply) {
	this.reply = reply;
}

}
