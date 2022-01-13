package com.seong.app.model.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("categoryServiceImpl")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public int insertCategory(CategoryVO vo) {
		return categoryDAO.insertCategory(vo);
	}
	@Override
	public int deleteCategory(CategoryVO vo) {
		return categoryDAO.deleteCategory(vo);
	}
	@Override
	public List<CategoryVO> getCategoryList() {
		return categoryDAO.getCategoryList();
	}
}
