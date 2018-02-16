package org.sfl.repository;

import org.sfl.model.Catalog;
import java.util.List;

public interface CatalogRepository {

    void save(Catalog catalog);

    Catalog findById(long id);

    List<Catalog> findAll();

    void delete(long id);

    List<Catalog> findAllByUserId(long userId);
}
