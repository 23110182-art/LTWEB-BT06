package vn.silver.DAO.Impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import vn.silver.Configs.JPAConfig;
import vn.silver.DAO.AbstractDAO;
import vn.silver.Entities.Category;

public class CategoryDaoImpl extends AbstractDAO<Category, Integer> {
	public CategoryDaoImpl() {
		super(Category.class);
	}

	public List<Category> getCategoryByUser(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			TypedQuery<Category> query = em.createQuery("select c from Category c where c.user.id = :userid",Category.class);
			query.setParameter("userid", id);
			return query.getResultList();
		}catch (NoResultException e) {
	        return null; // Không tìm thấy thì trả về null
	    } finally {
	        em.close();
	    }
	}
	
	public List<Category> searchByKeyword(String keyword) {
	    EntityManager em = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT c FROM Category c " +
	                      "WHERE c.tensanpham LIKE :kw ";

	        TypedQuery<Category> query = em.createQuery(jpql, Category.class);
	        query.setParameter("kw", "%" + keyword + "%");
	        return query.getResultList();
	    } catch (NoResultException e) {
	        return null;
	    } finally {
	        em.close();
	    }
	}


}
