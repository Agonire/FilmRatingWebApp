package data.dao.comment;

import data.hibernate.entity.Comment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CommentDAO implements ICommentDAO{
    SessionFactory sessionFactory;

    @Autowired
    public CommentDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Comment> getComments() {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Comment").list();
    }

    @Override
    @Transactional
    public void createComment(Comment comment) {
        Session session = sessionFactory.getCurrentSession();

        session.save(comment);
    }

    @Override
    @Transactional
    public void removeComment(Comment comment) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(comment);
    }
}
