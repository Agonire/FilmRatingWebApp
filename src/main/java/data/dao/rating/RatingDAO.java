package data.dao.rating;

import data.hibernate.entity.Rating;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class RatingDAO implements IRatingDAO{
    SessionFactory sessionFactory;

    @Autowired
    public RatingDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Rating> getRatings() {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Rating").list();
    }

    @Override
    @Transactional
    public void createRating(Rating rating) {
        Session session = sessionFactory.getCurrentSession();

        session.save(rating);
    }

    @Override
    @Transactional
    public void removeRating(Rating rating) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(rating);
    }
}
