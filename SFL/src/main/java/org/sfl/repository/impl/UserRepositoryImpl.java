package org.sfl.repository.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.sfl.model.User;
import org.sfl.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @Override
    public User findById(long id) {
        return (User) sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public List<User> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(User.class).list();
    }

    @Override
    public void delete(long id) {
        User user = findById(id);
        sessionFactory.getCurrentSession().delete(user);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().merge(user);
    }

    @Override
    public User findByUsername(String firstname) {
        Query query = sessionFactory.getCurrentSession()
                .createQuery("FROM User u WHERE u.firstname = :firstname");
        query.setParameter("firstname", firstname);

        return (User) query.uniqueResult();
    }
}
