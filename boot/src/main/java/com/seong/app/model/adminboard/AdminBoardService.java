package com.seong.app.model.adminboard;

import java.util.List;

public interface AdminBoardService {
	int insertBoard(AdminBoardVO vo);
	int updateBoard(AdminBoardVO vo);
	int deleteBoard(AdminBoardVO vo);
	AdminBoardVO getBoard(AdminBoardVO vo);
	List<AdminBoardVO> getBoardList(AdminBoardVO vo);
}