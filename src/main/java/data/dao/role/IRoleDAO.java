package data.dao.role;

import data.hibernate.entity.Role;

import java.util.List;

public interface IRoleDAO {
    List<Role> getRoles();
    void createRole(Role role);
    void removeRole(Role role);
}
