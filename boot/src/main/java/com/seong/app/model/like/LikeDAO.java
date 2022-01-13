package com.seong.app.model.like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeDAO {
	public int insertLike(LikeVO vo); // 트랜잭션 처리 - 해당 게시글에 찜 수 +1
	public int likeCntPlus(LikeVO vo);
	public int deleteLike(LikeVO vo); // 트랜잭션 처리 - 해당 게시글에 찜 수 -1
	public int likeCntMinus(LikeVO vo);
}
