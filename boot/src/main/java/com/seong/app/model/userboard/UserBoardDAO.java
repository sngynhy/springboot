package com.seong.app.model.userboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserBoardDAO {
	public int insertBoard(UserBoardVO vo);
	public int updateBoard(UserBoardVO vo);
	public int deleteBoard(UserBoardVO vo); // 트랜잭션 처리 - 댓글, 찜 -1
	public int deleteReply(UserBoardVO vo);
	public int deleteLikes(UserBoardVO vo);
	public UserBoardVO getBoard(UserBoardVO vo);
	public List<UserBoardVO> getBoardList(UserBoardVO vo);
	public int getBoardListCount(UserBoardVO vo);
}
