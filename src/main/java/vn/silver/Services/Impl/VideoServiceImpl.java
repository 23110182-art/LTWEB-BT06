package vn.silver.Services.Impl;

import java.util.List;

import vn.silver.DAO.Impl.VideoDaoImpl;
import vn.silver.Entities.Video;
import vn.silver.Services.VideoService;

public class VideoServiceImpl implements VideoService {
	VideoDaoImpl userDao = new VideoDaoImpl();

	@Override
	public void create(Video user) {
		userDao.create(user);
		
	}

	@Override
	public void update(Video user) {
		userDao.update(user);
		
	}

	@Override
	public void delete(int id) {
		userDao.delete(id);
		
	}

	@Override
	public List<Video> findAll() {
		return userDao.findAll();
		
	}

	@Override
	public Video findById(int id) {
		return userDao.findById(id);
	}
}
