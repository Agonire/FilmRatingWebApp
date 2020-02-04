package mvc.service;

import data.hibernate.entity.Role;

import java.util.List;

public interface IRoleService {
    List<Role> getRoles();
}
