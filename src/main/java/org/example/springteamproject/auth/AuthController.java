package org.example.springteamproject.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/auth")
public class AuthController {
    @Autowired
    UserDAO userDAO;

    @RequestMapping(value = "/login")
    public String Login(){
        return "login";
    }

    @RequestMapping(value = "/login_ok", method = RequestMethod.POST)
    public String LoginCheck(HttpSession session, UserVO user){
        String returnURL;
        if(session.getAttribute("login") != null) session.removeAttribute("login");

        UserVO loginUser = userDAO.getUser(user);
        if(loginUser != null){
            System.out.println("로그인 성공");
            session.setAttribute("login", loginUser);
            returnURL = "redirect:/";
        } else {
            System.out.println("로그인 실패");
            returnURL = "redirect:/auth/login";
        }
        return returnURL;
    }

    @RequestMapping(value = "/logout")
    public String Logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
