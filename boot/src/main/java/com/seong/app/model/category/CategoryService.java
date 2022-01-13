package com.seong.app.model.category;

import java.util.List;

public interface CategoryService {
	public int insertCategory(CategoryVO vo);
	public int deleteCategory(CategoryVO vo);
	public List<CategoryVO> getCategoryList();
}
