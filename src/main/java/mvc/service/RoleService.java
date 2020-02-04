package mvc.service;

import data.dao.role.IRoleDAO;
import data.hibernate.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private IRoleDAO roleDAO;

    @Transactional(readOnly = true)
    public List<Role> getRoles() {
        return roleDAO.getRoles();
    }
}
