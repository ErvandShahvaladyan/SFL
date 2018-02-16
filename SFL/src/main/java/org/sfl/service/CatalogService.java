package org.sfl.service;

import org.sfl.model.Catalog;
import java.util.List;

public interface CatalogService {

    void save(Catalog catalog);

    Catalog findById(long id);

    List<Catalog> findAll();

    void delete(long id);

    List<Catalog> findAllByUserId(long userId);
}
