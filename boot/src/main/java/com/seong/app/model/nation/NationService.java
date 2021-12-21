package com.seong.app.model.nation;

import java.util.List;

public interface NationService {
	int insertNation(NationVO vo);
	int deleteNation(NationVO vo);
	List<NationVO> getNationList();
}
