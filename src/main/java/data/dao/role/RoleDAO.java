package data.dao.role;

import data.hibernate.entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public class RoleDAO implements IRoleDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public RoleDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void createRole(Role role) {
        Session session = sessionFactory.getCurrentSession();

        session.save(role);
    }

    @Override
    @Transactional
    public void removeRole(Role role) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(role);
    }

    @Override
    @Transactional
    public List<Role> getRoles() {
        Session session = sessionFactory.getCurrentSession();

        return (List<Role>) session.createQuery("From Role").list();
    }
}
