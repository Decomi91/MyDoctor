package com.project.mydoctor.model;

public class Score{
	private double kindness;
	private double ability;
	private double price;
	public double getKindness() {
		return kindness;
	}
	public void setKindness(double kindness) {
		this.kindness = Math.round(kindness*10)/10;
	}
	public double getAbility() {
		return ability;
	}
	public void setAbility(double ability) {
		this.ability = Math.round(ability*10)/10;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = Math.round(price*10)/10;
	}
}
