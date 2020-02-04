package data.hibernate.entity;

import javax.persistence.*;

@Entity
@Table(name = "rating")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;
    @ManyToOne
    @JoinColumn(name = "account_id")
    Account owner;
    @ManyToOne
    @JoinColumn(name = "film_id")
    Film target;

    @Column(name = "atmosphere")
    Integer atmosphere;
    @Column(name = "plot")
    Integer plot;
    @Column(name = "acting")
    Integer acting;
    @Column(name = "ideas")
    Integer ideas; // Films ideas, are they new, interesting, discussed in different ways?
    @Column(name = "artistic")
    Integer artistic; // Some good features, like camera angles, music, filter
    @Column(name = "fun")
    Integer fun; // Overall impression

    public Rating() {
    }

    public Rating(Account owner, Film filmTarget) {
        this.owner = owner;
        this.target = filmTarget;
    }

    public Rating(Account owner, Film target, Integer atmosphere, Integer plot, Integer acting, Integer ideas, Integer artistic, Integer fun) {
        this.owner = owner;
        this.target = target;
        this.atmosphere = atmosphere;
        this.plot = plot;
        this.acting = acting;
        this.ideas = ideas;
        this.artistic = artistic;
        this.fun = fun;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getOwner() {
        return owner;
    }

    public void setOwner(Account owner) {
        this.owner = owner;
    }

    public Film getTarget() {
        return target;
    }

    public void setTarget(Film target) {
        this.target = target;
    }

    public Integer getAtmosphere() {
        return atmosphere;
    }

    public void setAtmosphere(Integer atmosphere) {
        this.atmosphere = atmosphere;
    }

    public Integer getPlot() {
        return plot;
    }

    public void setPlot(Integer plot) {
        this.plot = plot;
    }

    public Integer getActing() {
        return acting;
    }

    public void setActing(Integer acting) {
        this.acting = acting;
    }

    public Integer getIdeas() {
        return ideas;
    }

    public void setIdeas(Integer ideas) {
        this.ideas = ideas;
    }

    public Integer getArtistic() {
        return artistic;
    }

    public void setArtistic(Integer artistic) {
        this.artistic = artistic;
    }

    public Integer getFun() {
        return fun;
    }

    public void setFun(Integer fun) {
        this.fun = fun;
    }
}
