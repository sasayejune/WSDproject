package org.example.springteamproject.service;

import org.apache.ibatis.session.SqlSession;
import org.example.springteamproject.auth.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SoldierDAO {
    @Autowired
    SqlSession sqlSession;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final String SOLDIER_UPDATE = "UPDATE SOLDIER SET name = ?, birthDate = ?, height = ?, weight = ?, bodyGrade = ?, desiredPosition = ?, desiredDate = ?, certificate = ? WHERE id = ?";
    private final String SOLDIER_DELETE = "DELETE FROM SOLDIER WHERE id = ?";
    private final String SOLDIER_GET = "SELECT * FROM SOLDIER WHERE id = ?";
    private final String SOLDIER_LIST = "SELECT * FROM SOLDIER ORDER BY id DESC";

    // 병사 추가
    public int addSoldier(SoldierVO vo){
        return sqlSession.insert("SOLDIER.insertSoldier", vo);
    }

    public int updateSoldier(SoldierVO vo) {
        return sqlSession.update("SOLDIER.updateSoldier", vo);
    }

    public int deleteSoldier(int id) { return sqlSession.delete("SOLDIER.deleteSoldier", id); }
    // 병사 삭제


    // 병사 조회
    public SoldierVO getSoldier(int id) {
        return jdbcTemplate.queryForObject(SOLDIER_GET, new Object[]{id}, new BeanPropertyRowMapper<>(SoldierVO.class));
    }

    public List<SoldierVO> getSoldierList(int userID){
        return sqlSession.selectList("SOLDIER.getAllSoldier", userID);
    }

    public List<SoldierVO> getAllSoldierList() { return sqlSession.selectList("SOLDIER.getSoldierList"); }
    // 병사 검색
    public List<SoldierVO> searchSoldiers(String query) {
        String sql = "SELECT * FROM SOLDIER WHERE name LIKE ? OR desiredPosition LIKE ?";
        return jdbcTemplate.query(sql, new Object[]{"%" + query + "%", "%" + query + "%"},
                new BeanPropertyRowMapper<>(SoldierVO.class));
    }

    // 병사 ID로 조회 (추가된 메서드)
    public SoldierVO getSoldierById(long id) {
        return jdbcTemplate.queryForObject(SOLDIER_GET, new Object[]{id}, new BeanPropertyRowMapper<>(SoldierVO.class));
    }
}