package com.seong.app.model.reply;

import java.util.List;

public interface ReplyService {
	int insertReply(ReplyVO vo);
	int deleteReply(ReplyVO vo);
	List<ReplyVO> getReplyList(ReplyVO vo);
}
