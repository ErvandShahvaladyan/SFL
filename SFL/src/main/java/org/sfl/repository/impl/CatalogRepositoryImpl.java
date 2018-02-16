package org.sfl.repository.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.sfl.model.Catalog;
import org.sfl.model.User;
import org.sfl.repository.CatalogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CatalogRepositoryImpl implements CatalogRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Catalog catalog) {
        sessionFactory.getCurrentSession().saveOrUpdate(catalog);
    }

    @Override
    public Catalog findById(long id) {
        return (Catalog) sessionFactory.getCurrentSession().get(Catalog.class, id);
    }

    @Override
    public List<Catalog> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(Catalog.class).list();
    }

    @Override
    public void delete(long id) {
        Query query = sessionFactory.getCurrentSession()
                .createQuery("DELETE Catalog c WHERE id = :id");
        query.setParameter("id", id).executeUpdate();
    }

    @Override
    public List<Catalog> findAllByUserId(long userId) {
        User user = (User) sessionFactory.getCurrentSession().get(User.class, userId);
        Query query = sessionFactory.getCurrentSession()
                .createQuery("FROM Catalog c WHERE c.user = :user");
        query.setParameter("user", user);

        return query.list();
    }
}
