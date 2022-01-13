package com.seong.app.model.nation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("nationServiceImpl")
public class NationServiceImpl implements NationService {
	
	@Autowired
	private NationDAO nationDAO;
	
	@Override
	public int insertNation(NationVO vo) {
		return nationDAO.insertNation(vo);
	}
	@Override
	public int deleteNation(NationVO vo) {
		return nationDAO.deleteNation(vo);
	}
	
	@Override
	public List<NationVO> getNationList() {
		return nationDAO.getNationList();
	}
}
