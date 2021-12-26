package com.seong.app.model.adminboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("adminboardServiceImpl")
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDAO boardDAO;
	
	@Override
	public int insertBoard(AdminBoardVO vo) {
		return boardDAO.insertBoard(vo);
	}
	@Override
	public int updateBoard(AdminBoardVO vo) {
		return boardDAO.updateBoard(vo);
	}
	@Override
	@Transactional
	public int deleteBoard(AdminBoardVO vo) {
		int res = 0;
		res += boardDAO.deleteBoard(vo);
		res += boardDAO.deleteLikes(vo);
		return res;
	}
	@Override
	public AdminBoardVO getBoard(AdminBoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	@Override
	public List<AdminBoardVO> getBoardList(AdminBoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
}
