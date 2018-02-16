package org.sfl.repository;

import org.sfl.model.User;
import java.util.List;

public interface UserRepository {

    void save(User user);

    User findById(long id);

    List<User> findAll();

    void delete(long id);

    void update(User user);

    User findByUsername(String username);
}
