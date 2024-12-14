package org.example.springteamproject.service;

import org.example.springteamproject.auth.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ServiceController {
    @Autowired
    SoldierDAO soldierDAO;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String goList(){
        return "list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addSoldier(){
        return "add";
    }

    @RequestMapping(value = "/add_ok", method = RequestMethod.POST)
    public String addSoldierOK(HttpSession session, SoldierVO soldier){
        UserVO user = (UserVO)session.getAttribute("login");
        soldier.setUserID(user.getId());

        int result = soldierDAO.addSoldier(soldier);
        System.out.println(result);
        return "redirect:/";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String goView(HttpSession session, Model model){
        UserVO user = (UserVO)session.getAttribute("login");
        model.addAttribute("list", soldierDAO.getSoldierList(user.getId()));
        return "view";
    }
}
