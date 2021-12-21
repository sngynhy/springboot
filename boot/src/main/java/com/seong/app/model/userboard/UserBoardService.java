package com.seong.app.model.userboard;

import java.util.List;

public interface UserBoardService {
	int insertBoard(UserBoardVO vo);
	int updateBoard(UserBoardVO vo);
	int deleteBoard(UserBoardVO vo);
	List<UserBoardVO> getBoardList(UserBoardVO vo);
	UserBoardVO getBoard(UserBoardVO vo);
	int getBoardListCount(UserBoardVO vo);
}
