package com.seong.app.model.area;

import org.apache.ibatis.type.Alias;

@Alias("AreaVO")
public class AreaVO {
	private String a_id; // pk
	private String area; // ���� - EU ��
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
}
