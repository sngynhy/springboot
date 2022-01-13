package com.seong.app.model.userboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userboardServiceImpl")
public class UserBoardServiceImpl implements UserBoardService {
	
	@Autowired
	private UserBoardDAO boardDAO;
	
	@Override
	public int insertBoard(UserBoardVO vo) {
		return boardDAO.insertBoard(vo);
	}
	@Override
	public int updateBoard(UserBoardVO vo) {
		return boardDAO.updateBoard(vo);
	}
	@Override
	@Transactional
	public int deleteBoard(UserBoardVO vo) {
		int res = 0;
		res += boardDAO.deleteBoard(vo);
		res += boardDAO.deleteReply(vo);
		res += boardDAO.deleteLikes(vo);
		return res;
	}
	@Override
	public List<UserBoardVO> getBoardList(UserBoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
	@Override
	public UserBoardVO getBoard(UserBoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	@Override
	public int getBoardListCount(UserBoardVO vo) {
		return boardDAO.getBoardListCount(vo);
	}
}
