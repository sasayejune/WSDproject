package org.example.springteamproject.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {
    @Autowired
    UserDAO userDAO;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginUser(){
        return "login";
    }
    @RequestMapping(value = "/auth/login", method = RequestMethod.POST)
    public String goHome(UserVO user){
        int result = userDAO.insertUser(user);
        System.out.println(result);
        return "redirect:/list";
    }

    @RequestMapping(value = "/list")
    public String home(){
        return "list";
    }
}
