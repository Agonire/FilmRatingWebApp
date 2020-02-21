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

    @Column(name = "username")
    String username;

    @Column(name = "password")
    String password;

    @ManyToOne
    @JoinColumn(name = "role_id")
    Role role;

    @Type(type = "numeric_boolean")
    @Column(name = "enabled")
    boolean enabled;

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

    public Account(String firstName, String lastName, Role role, boolean enabled) {
        this.username = firstName;
        this.password = lastName;
        this.role = role;
        this.enabled = enabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
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
