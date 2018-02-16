package org.sfl.repository;

import org.sfl.model.Role;
import java.util.List;

public interface RoleRepository {

    List<Role> findAll();
}
