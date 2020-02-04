
import data.dao.comment.ICommentDAO;
import data.dao.film.IFilmDAO;
import data.dao.genre.IGenreDAO;
import data.dao.participant.IParticipantDAO;
import data.dao.rating.IRatingDAO;
import data.hibernate.entity.*;
import mvc.config.BeanConfiguration;
import data.dao.account.IAccountDAO;
import data.dao.role.IRoleDAO;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.lang.reflect.GenericArrayType;
import java.util.List;


public class TestingHibernate {


    public static void main(String[] args) {

        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(BeanConfiguration.class);

        IAccountDAO accountDAO = context.getBean(IAccountDAO.class);
        IRoleDAO roleService = context.getBean(IRoleDAO.class);
        IGenreDAO genreDAO = context.getBean(IGenreDAO.class);
        IFilmDAO filmDAO = context.getBean(IFilmDAO.class);
        ICommentDAO commentDAO = context.getBean(ICommentDAO.class);
        IRatingDAO ratingDAO = context.getBean(IRatingDAO.class);
        

        System.out.println("done");
        context.close();
    }
}
