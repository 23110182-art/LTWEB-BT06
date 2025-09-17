package vn.silver.Services;

import java.util.List;

import vn.silver.Entities.User;

public interface UserService {
	public void create(User user);
	public void update(User user);
	public void delete(int id);
	public List<User> findAll();
	public User findById(int id);
	
	public User getUser(String taikhoan);
	public User Login(String taikhoan, String matkhau);
	public List<User> searchByKeyword(String keyword);
}
