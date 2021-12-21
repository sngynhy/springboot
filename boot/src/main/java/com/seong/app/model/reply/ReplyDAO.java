package com.seong.app.model.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDAO {
	public int insertReply(ReplyVO vo); // 트랜잭션 처리 - 댓글 등록 시 댓글 수 +1
	public int rCntPlus(ReplyVO vo);
	public int deleteReply(ReplyVO vo); // 트랜잭션 처리 - 댓글 삭제 시 댓글 수 -1
	public int rCntMinus(ReplyVO vo);
	public List<ReplyVO> getReplyList(ReplyVO vo);
}
