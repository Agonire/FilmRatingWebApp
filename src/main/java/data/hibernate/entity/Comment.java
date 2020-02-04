package data.hibernate.entity;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @Type(type = "numeric_boolean")
    @Column(name = "banned")
    boolean banned;

    @Column(name = "message")
    String message;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "account_id")
    Account owner;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "film_id")
    Film commentTarget;

    @ManyToMany
    @JoinTable(name = "comment_liked_by",
    joinColumns = {@JoinColumn(name = "comment_id")},
    inverseJoinColumns = {@JoinColumn(name = "account_id")})
    List<Account> likedByAccounts = new ArrayList<>();

    public Comment() {
    }

    public Comment(String message, Account owner, Film commentTarget) {
        this.message = message;
        this.owner = owner;
        this.commentTarget = commentTarget;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isBanned() {
        return banned;
    }

    public void setBanned(boolean banned) {
        this.banned = banned;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Account> getLikedByAccounts() {
        return likedByAccounts;
    }

    public void setLikedByAccounts(List<Account> likedByAccounts) {
        this.likedByAccounts = likedByAccounts;
    }

    public Account getOwner() {
        return owner;
    }

    public void setOwner(Account owner) {
        this.owner = owner;
    }

    public Film getCommentTarget() {
        return commentTarget;
    }

    public void setCommentTarget(Film commentTarget) {
        this.commentTarget = commentTarget;
    }
}
