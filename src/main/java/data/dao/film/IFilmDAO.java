package data.dao.film;

import data.hibernate.entity.Film;

import java.util.List;

public interface IFilmDAO {
    List<Film> getFilms();
    void createFilm(Film film);
    void removeFilm(Film film);
}
