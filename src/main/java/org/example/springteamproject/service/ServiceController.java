package org.example.springteamproject.service;

import org.example.springteamproject.auth.UserVO;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;
import javax.servlet.http.HttpSession;

@Controller
public class ServiceController {

    @Autowired
    SoldierDAO soldierDAO;
  
    private final SoldierService soldierService;

    @Autowired
    public ServiceController(SoldierService soldierService) {
        this.soldierService = soldierService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String goList(Model model) {
        List<SoldierVO> soldierList = soldierService.getSoldierList();
        model.addAttribute("soldierList", soldierList);
        return "list"; // list.jsp로 이동
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addSoldier() {
        return "add"; // add.jsp로 이동
    }

    @RequestMapping(value = "/add_ok", method = RequestMethod.POST)
    public String addSoldierOK(HttpSession session, SoldierVO soldier) {
        UserVO user = (UserVO) session.getAttribute("login");
        soldier.setUserID(user.getId());

        int result = soldierService.addSoldier(soldier);
        System.out.println(result);
        return "redirect:/"; // 추가 후 병사 목록으로 리다이렉트
    }

    @RequestMapping(value = "/soldier/edit", method = RequestMethod.GET)
    public String editSoldier(@RequestParam("id") Long id, Model model) {
        SoldierVO soldier = soldierService.getSoldierById(id);
        model.addAttribute("soldier", soldier);
        return "edit"; // edit.jsp로 이동
    }

    @RequestMapping(value = "/soldier/edit_ok", method = RequestMethod.POST)
    public String editOK(@ModelAttribute SoldierVO soldier, Model model) {
        // soldier 객체는 이미 ID를 포함하고 있어야 합니다.
        System.out.println(soldier.getDesiredPosition());
        int result = soldierService.updateSoldier(soldier);
        if (result > 0) {
            System.out.println("병사 정보 수정 성공: " + soldier);
        } else {
            System.out.println("병사 정보 수정 실패: " + soldier);
        }

        return "redirect:/"; // 수정 후 병사 목록으로 리다이렉트
    }

    @RequestMapping(value = "/soldier/delete_ok/{id}", method = RequestMethod.GET)
    public String deleteOK(@PathVariable("id") int id) {
        // soldier 객체는 이미 ID를 포함하고 있어야 합니다.

        int result = soldierDAO.deleteSoldier(id);
        if (result > 0) {
            System.out.println("병사 정보 삭제 성공: ");
        } else {
            System.out.println("병사 정보 삭제 실패: ");
        }

        return "redirect:/"; // 수정 후 병사 목록으로 리다이렉트
    }
  
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String goView(HttpSession session, Model model){
        UserVO user = (UserVO)session.getAttribute("login");
        model.addAttribute("list", soldierDAO.getSoldierList(user.getId()));
        return "view";
    }

}
