package com.seong.app.model.like;

import org.apache.ibatis.type.Alias;

@Alias("LikeVO")
public class LikeVO {
	
	private int b_id; // �Խñ�  ID
	private String id; // ȸ�� id
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "LikeVO [b_id=" + b_id + ", id=" + id + "]";
	}
}
