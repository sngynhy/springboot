package com.seong.app.model.member;

public interface MemberService {
	int insertMember(MemberVO vo);
	int updateMember(MemberVO vo);
	int deleteMember(MemberVO vo) throws Exception;
	int checkID(String id);
	MemberVO getMember(MemberVO vo);
}
