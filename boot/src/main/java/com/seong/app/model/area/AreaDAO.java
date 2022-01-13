package com.seong.app.model.area;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AreaDAO {
	public int insertArea(AreaVO vo);
	public int deleteArea(AreaVO vo);
	public List<AreaVO> getAreaList();
}
