package vn.silver.DAO;

import java.util.List;

public interface GenericDAO<T, ID> {
    void insert(T entity);
    T findById(ID id);
    List<T> findAll();
    void update(T entity);
    void delete(T entity);
}
