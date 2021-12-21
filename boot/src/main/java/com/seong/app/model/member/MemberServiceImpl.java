package com.seong.app.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}
	@Override
	public int checkID(String id) {
		System.out.println("checkID : " + memberDAO.checkID(id));
		return memberDAO.checkID(id);
	}
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
	@Override
	public int updateMember(MemberVO vo) {
		return memberDAO.updateMember(vo);
	}
	@Override 
	@Transactional
	public int deleteMember(MemberVO vo) {
		int res = 0;
		res += memberDAO.deleteMember(vo);
		res += memberDAO.updateBoard(vo);
		res += memberDAO.updateReply(vo);
		res += memberDAO.deleteLikes(vo);
		return res;
	}
}
