package com.seong.app.model.adminboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminBoardDAO {
	public int insertBoard(AdminBoardVO vo);
	public int updateBoard(AdminBoardVO vo);
	public int deleteBoard(AdminBoardVO vo); // 트랜잭션 처리 - 댓글, like 삭제
	public int deleteReply(AdminBoardVO vo);
	public int deleteLikes(AdminBoardVO vo);
	public AdminBoardVO getBoard(AdminBoardVO vo);
	public List<AdminBoardVO> getBoardList(AdminBoardVO vo);
}
