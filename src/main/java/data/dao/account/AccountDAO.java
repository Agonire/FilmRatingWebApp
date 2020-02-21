package data.dao.account;

import data.hibernate.entity.Account;
import data.hibernate.entity.Comment;
import data.hibernate.entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class AccountDAO implements IAccountDAO{
    private SessionFactory sessionFactory;

    @Autowired
    public AccountDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void createAccount(Account account) {
        Session session = sessionFactory.getCurrentSession();

        session.save(account);
    }

    @Override
    @Transactional
    public List<Account> getAccounts() {
        Session session = sessionFactory.getCurrentSession();

        return (List<Account>) session.createQuery("From Account").list();
    }

    @Override
    @Transactional
    public List<Comment> getComments(Account account) {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Comment c where c.owner = :account")
                .setParameter("account", account)
                .list();
    }

    @Override
    @Transactional
    public List<Role> getRoles(Account account) {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("select r From Role r join r.accounts a where a.id = :id")
                .setParameter("id", account.getId())
                .list();
    }

    @Override
    @Transactional
    public Account getAccount(int id) {
        Session session = sessionFactory.getCurrentSession();

        Account account = session.get(Account.class, id);

        return account;
    }

    @Override
    @Transactional
    public void deleteAccount(int id) {
        Session session = sessionFactory.getCurrentSession();

        Account account = session.get(Account.class, id);

        session.remove(account);
    }

    @Override
    @Transactional
    public void deleteAccount(Account account) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(account);
    }



}
