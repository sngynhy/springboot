package com.seong.app.model.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo); // 트랜잭션 처리 - 회원 탈퇴 시 해당 회원의 게시글/댓글 update, 찜 delete
	public int updateBoard(MemberVO vo);
	public int updateReply(MemberVO vo);
	public int deleteLikes(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public int checkID(String id);
}
