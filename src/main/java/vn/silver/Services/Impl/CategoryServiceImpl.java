package vn.silver.Services.Impl;

import java.util.List;

import vn.silver.DAO.Impl.CategoryDaoImpl;
import vn.silver.Entities.Category;
import vn.silver.Entities.User;
import vn.silver.Services.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	
	CategoryDaoImpl categoryDao = new CategoryDaoImpl();
	@Override
	public void create(Category category) {
		categoryDao.create(category);
		
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);
		
	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
		
	}

	@Override
	public List<Category> findAll() {
		
		return categoryDao.findAll();
	}

	@Override
	public Category findById(int id) {
		
		return categoryDao.findById(id);
	}
	
	
	public List<Category> getCategoryByUser(User user) {
		return categoryDao.getCategoryByUser(user.getId());
	}
	
	public List<Category> searchByKeyword(String keyword) {
		return categoryDao.searchByKeyword(keyword);
	}

}
