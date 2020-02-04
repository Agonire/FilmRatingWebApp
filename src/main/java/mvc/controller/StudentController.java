package mvc.controller;

import data.dao.role.IRoleDAO;
import data.hibernate.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private IRoleDAO roleDAO;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        StringTrimmerEditor editor = new StringTrimmerEditor(true);

        binder.registerCustomEditor(String.class, editor);
    }

    @RequestMapping("/show")
    public String showStudent(Model model){

        Account account = new Account();

        model.addAttribute("student", account);

        return "studentForm";
    }
    @RequestMapping("/process")
    public String processForm(@ModelAttribute("student") Account account,
                              BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return "studentForm";
        }else {
            return "studentConfirm";
        }

    }

}
