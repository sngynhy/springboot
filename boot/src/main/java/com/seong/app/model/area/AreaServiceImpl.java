package com.seong.app.model.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("areaServiceImpl")
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaDAO areaDAO;
	
	@Override
	public int insertArea(AreaVO vo) {
		return areaDAO.insertArea(vo);
	}
	@Override
	public int deleteArea(AreaVO vo) {
		return areaDAO.deleteArea(vo);
	}
	@Override
	public List<AreaVO> getAreaList() {
		return areaDAO.getAreaList();
	}
}
