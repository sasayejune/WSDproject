package org.example.springteamproject.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginUser(){
        return "list";
    }

}
