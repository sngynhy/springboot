package com.seong.app.model.reply;

import org.apache.ibatis.type.Alias;

@Alias("ReplyVO")
public class ReplyVO {
	
	private int r_id; // 댓글 id
	private int b_id; // 게시글 id
	private String id; // 회원 id
	private String reply; // 댓글 내용
	private String r_date; // 작성 날짜
	private String u_date; // 수정 날짜
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [r_id=" + r_id + ", b_id=" + b_id + ", id=" + id + ", reply=" + reply + ", r_date=" + r_date
				+ ", u_date=" + u_date + "]";
	}
	
}
