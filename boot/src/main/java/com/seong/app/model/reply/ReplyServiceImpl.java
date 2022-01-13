package com.seong.app.model.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	@Transactional
	public int insertReply(ReplyVO vo) {
		int res = 0;
		res += replyDAO.insertReply(vo);
		res += replyDAO.rCntPlus(vo);
		return res;
	}
	@Override
	@Transactional
	public int deleteReply(ReplyVO vo) {
		int res = 0;
		res += replyDAO.deleteReply(vo);
		res += replyDAO.rCntMinus(vo);
		return res;
	}
	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return replyDAO.getReplyList(vo);
	}
}
