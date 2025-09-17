package vn.silver.DAO.Impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import vn.silver.Configs.JPAConfig;
import vn.silver.DAO.AbstractDAO;
import vn.silver.Entities.User;

public class UserDaoImpl extends AbstractDAO<User, Integer> {

	public UserDaoImpl() {
		super(User.class);
	}

	public User getUser(String taikhoan) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			TypedQuery<User> query = em.createQuery("select c from Users c where c.taikhoan = :username", User.class);
			query.setParameter("username", taikhoan);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null; // Không tìm thấy thì trả về null
		} finally {
			em.close();
		}
	}

	public List<User> searchByKeyword(String keyword) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT u FROM Users u " + "WHERE u.taikhoan LIKE :kw "+ "OR u.bietdanh LIKE :kw";
//			String jpql = "SELECT u FROM Users u " + "WHERE u.taikhoan LIKE :kw " + "OR u.bietdanh LIKE :kw "
//					+ "OR u.email LIKE :kw " + "OR u.sodienthoai LIKE :kw";

			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("kw", "%" + keyword + "%");


			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}

}
