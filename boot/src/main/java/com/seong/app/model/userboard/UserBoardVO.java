package com.seong.app.model.userboard;

import org.apache.ibatis.type.Alias;

@Alias("UserBoardVO")
public class UserBoardVO {
	
	private int b_id; // 1001���� �ڵ� +1
	private String id; // ȸ�� id
	private String title; // �Խñ� ����
	private String content; // �Խñ� ����
	private int r_cnt; // ��� ��
	private int like_cnt; // �� ��
	private String b_date; // �ۼ� ��¥
	private String u_date; // ���� ��¥
	private String b_type; // �Խ��� �з� - ����[info] or ����[ask] or �ı�[review]
	private String a_id; // ���� - ����, �ƽþ�, �̱� ..
	private String n_id; // ���� - ������, ����, ...
	private String cate_id; // ī�װ� - �Խ��ǿ� ���� �޶���
	private String condition; // �˻� �ɼ�
	private String keyword; // �˻� Ű����
	private int fav; // �� ��� - �� ���� ��� 0, ���� ��� 1
	private int startIndex; // �Խñ� ���� index
	private int cntPerPage; // 
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getR_cnt() {
		return r_cnt;
	}
	public void setR_cnt(int r_cnt) {
		this.r_cnt = r_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	@Override
	public String toString() {
		return "UserBoardVO [b_id=" + b_id + ", id=" + id + ", title=" + title + ", content=" + content + ", r_cnt="
				+ r_cnt + ", like_cnt=" + like_cnt + ", b_date=" + b_date + ", u_date=" + u_date + ", b_type=" + b_type
				+ ", a_id=" + a_id + ", n_id=" + n_id + ", cate_id=" + cate_id + ", condition=" + condition
				+ ", keyword=" + keyword + ", fav=" + fav + "]";
	}
}
