package org.sfl.repository.impl;

import org.hibernate.SessionFactory;
import org.sfl.model.Role;
import org.sfl.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class RoleRepositoryImpl implements RoleRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Role> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(Role.class).list();
    }
}
