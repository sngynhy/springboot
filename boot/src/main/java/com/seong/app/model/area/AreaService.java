package com.seong.app.model.area;

import java.util.List;

public interface AreaService {
	public int insertArea(AreaVO vo);
	public int deleteArea(AreaVO vo);
	public List<AreaVO> getAreaList();
}
