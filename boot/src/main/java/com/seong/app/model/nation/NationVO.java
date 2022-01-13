package com.seong.app.model.nation;

import org.apache.ibatis.type.Alias;

@Alias("NationVO")
public class NationVO {
	private String n_id; // pk
	private String nation; // 국가명
	private String a_id; // 지역 pk
	private double lat; // 위도
	private double lng; // 경도
	
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
}
