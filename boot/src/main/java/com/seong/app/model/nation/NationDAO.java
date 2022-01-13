package com.seong.app.model.nation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NationDAO {
	public int insertNation(NationVO vo);
	public int deleteNation(NationVO vo);
	public List<NationVO> getNationList();
}
