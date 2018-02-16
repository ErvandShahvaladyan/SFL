package org.sfl.service;

import org.sfl.model.User;
import java.util.List;

public interface UserService {

    void save(User user);

    User findById(long id);

    List<User> findAll();

    void delete(long id);

    void update(User user);
}
