package data.hibernate.entity;


import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "account")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @Column(name = "first_name")
    String firstName;

    @Column(name = "last_name")
    String lastName;

    @ManyToOne
    @JoinColumn(name = "role_id")
    Role role;

    @Type(type = "numeric_boolean")
    @Column(name = "banned")
    boolean banned;

    @OneToMany(mappedBy = "owner", orphanRemoval = true,cascade = CascadeType.ALL)
    List<Rating> rates;

    @OneToMany(mappedBy = "owner", orphanRemoval = true,cascade = CascadeType.ALL)
    List<Comment> comments;

    @ManyToMany(mappedBy = "likedByAccounts")
    List<Comment> likedComments;

    public Account() {
    }

    public Account(String firstName, String lastName, Role role) {
        this(firstName, lastName, role, false);
    }

    public Account(String firstName, String lastName, Role role, boolean banned) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.banned = banned;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isBanned() {
        return banned;
    }

    public void setBanned(boolean banned) {
        this.banned = banned;
    }

    public List<Rating> getRates() {
        return rates;
    }

    public void setRates(List<Rating> rates) {
        this.rates = rates;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Comment> getLikedComments() {
        return likedComments;
    }

    public void setLikedComments(List<Comment> likedComments) {
        this.likedComments = likedComments;
    }
}
