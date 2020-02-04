package data.hibernate.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @Column(name = "title")
    String title;

    @OneToMany(mappedBy = "target", orphanRemoval = true,cascade = CascadeType.ALL)
    List<Rating> rating;

    @OneToMany(mappedBy = "commentTarget", orphanRemoval = true,cascade = CascadeType.ALL)
    List<Comment> comments;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_genre",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "genre_id")})
    List<Genre> genres;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_actors",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "participant_id")})
    List<Participant> actors;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_directors",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "participant_id")})
    List<Participant> directors;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_idea_authors",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "participant_id")})
    List<Participant> ideaAuthors;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_producers",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "participant_id")})
    List<Participant> producers;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "film_writers",
    joinColumns = {@JoinColumn(name = "film_id")},
    inverseJoinColumns = {@JoinColumn(name = "participant_id")})
    List<Participant> writers;

    public Film() {
    }

    public Film(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Rating> getRating() {
        return rating;
    }

    public void setRating(List<Rating> rating) {
        this.rating = rating;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }

    public List<Participant> getActors() {
        return actors;
    }

    public void setActors(List<Participant> actors) {
        this.actors = actors;
    }

    public List<Participant> getDirectors() {
        return directors;
    }

    public void setDirectors(List<Participant> directors) {
        this.directors = directors;
    }

    public List<Participant> getIdeaAuthors() {
        return ideaAuthors;
    }

    public void setIdeaAuthors(List<Participant> ideaAuthors) {
        this.ideaAuthors = ideaAuthors;
    }

    public List<Participant> getProducers() {
        return producers;
    }

    public void setProducers(List<Participant> producers) {
        this.producers = producers;
    }

    public List<Participant> getWriters() {
        return writers;
    }

    public void setWriters(List<Participant> writers) {
        this.writers = writers;
    }
}
