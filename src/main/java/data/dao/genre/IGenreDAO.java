package data.dao.genre;

import data.hibernate.entity.Genre;

import java.util.List;

public interface IGenreDAO {
    List<Genre> getGenres();
    void createGenre(Genre genre);
    void removeGenre(Genre genre);
}
