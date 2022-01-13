package com.seong.app.model.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryDAO {
	public int insertCategory(CategoryVO vo);
	public int deleteCategory(CategoryVO vo);
	public List<CategoryVO> getCategoryList();
}
