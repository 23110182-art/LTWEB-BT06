package vn.silver.Services.Impl;

import java.util.List;

import vn.silver.DAO.Impl.UserDaoImpl;
import vn.silver.Entities.User;
import vn.silver.Services.UserService;

public class UserServiceImpl implements UserService {
	UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void create(User user) {
		userDao.create(user);
		
	}

	@Override
	public void update(User user) {
		userDao.update(user);
		
	}

	@Override
	public void delete(int id) {
		userDao.delete(id);
		
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
		
	}

	@Override
	public User findById(int id) {
		return userDao.findById(id);
	}

	@Override
	public User getUser(String taikhoan) {
		return userDao.getUser(taikhoan);
	}

	@Override
	public User Login(String taikhoan, String matkhau) {
		User user = this.getUser(taikhoan);
		if (user != null && matkhau.equals(user.getMatkhau())) {
			return user;
		}
		return null;
		
	}
	
	@Override
	public List<User> searchByKeyword(String keyword) {
		return userDao.searchByKeyword(keyword);
	}
	
}
