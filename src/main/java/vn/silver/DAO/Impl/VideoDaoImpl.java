package vn.silver.DAO.Impl;

import vn.silver.DAO.AbstractDAO;
import vn.silver.Entities.User;
import vn.silver.Entities.Video;

public class VideoDaoImpl extends AbstractDAO<Video, Integer> {
	public VideoDaoImpl() {
		super(Video.class);
	}
}
