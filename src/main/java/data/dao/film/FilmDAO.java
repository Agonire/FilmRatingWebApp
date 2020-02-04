package data.dao.film;

import data.hibernate.entity.Film;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class FilmDAO implements IFilmDAO {

    SessionFactory sessionFactory;

    @Autowired
    public FilmDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Film> getFilms() {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Film").list();
    }

    @Override
    @Transactional
    public void createFilm(Film film) {
        Session session = sessionFactory.getCurrentSession();

        session.save(film);
    }

    @Override
    @Transactional
    public void removeFilm(Film film) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(film);
    }
}
