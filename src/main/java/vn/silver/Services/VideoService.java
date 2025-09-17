package vn.silver.Services;

import java.util.List;
import vn.silver.Entities.Video;

public interface VideoService {

	public void create(Video user);
	public void update(Video user);
	public void delete(int id);
	public List<Video> findAll();
	public Video findById(int id);

}
