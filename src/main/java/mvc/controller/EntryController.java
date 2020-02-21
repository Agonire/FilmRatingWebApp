package mvc.controller;

import data.dao.account.IAccountDAO;
import data.dao.comment.ICommentDAO;
import data.dao.film.IFilmDAO;
import data.dao.genre.IGenreDAO;
import data.dao.rating.IRatingDAO;
import data.dao.role.IRoleDAO;
import data.hibernate.entity.Account;
import mvc.config.BeanConfiguration;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EntryController {

    @GetMapping("/")
    public String showHome(){
        return "home";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/accessDenied")
    public String accessDenied(){
        return "access-denied";
    }
}
