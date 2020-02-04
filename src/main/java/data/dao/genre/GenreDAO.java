package data.dao.genre;

import data.hibernate.entity.Genre;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class GenreDAO implements IGenreDAO {
    SessionFactory sessionFactory;

    @Autowired
    public GenreDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Genre> getGenres() {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Genre").list();
    }

    @Override
    @Transactional
    public void createGenre(Genre genre) {
        Session session = sessionFactory.getCurrentSession();

        session.save(genre);
    }

    @Override
    @Transactional
    public void removeGenre(Genre genre) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(genre);
    }
}
