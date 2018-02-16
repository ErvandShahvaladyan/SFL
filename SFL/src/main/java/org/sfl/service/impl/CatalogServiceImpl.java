package org.sfl.service.impl;

import org.sfl.model.Catalog;
import org.sfl.repository.CatalogRepository;
import org.sfl.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    private CatalogRepository catalogRepository;

    @Override
    public void save(Catalog catalog) {
        catalogRepository.save(catalog);
    }

    @Override
    public Catalog findById(long id) {
        return catalogRepository.findById(id);
    }

    @Override
    public List<Catalog> findAll() {
        return catalogRepository.findAll();
    }

    @Override
    public void delete(long id) {
        catalogRepository.delete(id);
    }

    @Override
    public List<Catalog> findAllByUserId(long userId) {
        return catalogRepository.findAllByUserId(userId);
    }
}
