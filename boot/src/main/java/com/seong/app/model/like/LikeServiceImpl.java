package com.seong.app.model.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("likeServiceImpl")
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDAO likeDAO;
	
	@Override
	@Transactional
	public int insertLike(LikeVO vo) {
		int res = 0;
		res += likeDAO.insertLike(vo);
		res += likeDAO.likeCntPlus(vo);
		return res;
	}
	@Override
	@Transactional
	public int deleteLike(LikeVO vo) {
		int res = 0;
		res += likeDAO.deleteLike(vo);
		res += likeDAO.likeCntMinus(vo);
		return res;
	}
}
