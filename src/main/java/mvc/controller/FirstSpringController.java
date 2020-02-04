package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FirstSpringController {

    @RequestMapping("/")
    public String showHomePage(){
        return "home";
    }

    @RequestMapping("/enteredInfo")
    public String processInput(@RequestParam("info") String info, Model model){

        model.addAttribute("info", info);

        return "enteredInfo";
    }
}
