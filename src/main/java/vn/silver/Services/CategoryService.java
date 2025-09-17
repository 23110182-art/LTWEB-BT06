package vn.silver.Services;

import java.util.List;

import vn.silver.Entities.Category;

public interface CategoryService {
	public void create(Category category);
	public void update(Category category);
	public void delete(int id);
	public List<Category> findAll();
	public Category findById(int id);
}
