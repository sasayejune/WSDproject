package org.example.springteamproject.service;

import org.example.springteamproject.service.SoldierDAO;
import org.example.springteamproject.service.SoldierVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SoldierService {
    private final SoldierDAO soldierDAO;

    @Autowired
    public SoldierService(SoldierDAO soldierDAO) {
        this.soldierDAO = soldierDAO;
    }

    public List<SoldierVO> getSoldierList() {
        return soldierDAO.getSoldierList();
    }

    public int addSoldier(SoldierVO soldier) {
        return soldierDAO.addSoldier(soldier);
    }

    public SoldierVO getSoldierById(Long id) {
        return soldierDAO.getSoldierById(id);
    }

    public int updateSoldier(SoldierVO soldier) {
        return soldierDAO.updateSoldier(soldier);
    }
}
