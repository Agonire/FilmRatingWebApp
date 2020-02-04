package data.dao.rating;

import data.hibernate.entity.Rating;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IRatingDAO {
    List<Rating> getRatings();
    void createRating(Rating rating);
    void removeRating(Rating rating);
}
