package org.example.springteamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class SoldierDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final String SOLDIER_INSERT = "INSERT INTO SOLDIER (name, birthDate, height, weight, bodyGrade, desiredPosition, desiredDate, certificate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SOLDIER_UPDATE = "UPDATE SOLDIER SET name = ?, birthDate = ?, height = ?, weight = ?, bodyGrade = ?, desiredPosition = ?, desiredDate = ?, certificate = ? WHERE id = ?";
    private final String SOLDIER_DELETE = "DELETE FROM SOLDIER WHERE id = ?";
    private final String SOLDIER_GET = "SELECT * FROM SOLDIER WHERE id = ?";
    private final String SOLDIER_LIST = "SELECT * FROM SOLDIER ORDER BY id DESC";

    // 병사 추가
    public int addSoldier(SoldierVO vo) {
        return jdbcTemplate.update(SOLDIER_INSERT, new Object[]{
                vo.getName(), vo.getBirthDate(), vo.getHeight(), vo.getWeight(),
                vo.getBodyGrade(), vo.getDesiredPosition(), vo.getDesiredDate(), vo.getCertificate()
        });
    }

    // 병사 수정
    public int updateSoldier(SoldierVO vo) {
        return jdbcTemplate.update(SOLDIER_UPDATE, new Object[]{
                vo.getName(), vo.getBirthDate(), vo.getHeight(), vo.getWeight(),
                vo.getBodyGrade(), vo.getDesiredPosition(), vo.getDesiredDate(), vo.getCertificate(), vo.getId()
        });
    }

    // 병사 삭제
    public int deleteSoldier(int id) {
        return jdbcTemplate.update(SOLDIER_DELETE, new Object[]{id});
    }

    // 병사 조회
    public SoldierVO getSoldier(int id) {
        return jdbcTemplate.queryForObject(SOLDIER_GET, new Object[]{id}, new BeanPropertyRowMapper<>(SoldierVO.class));
    }

    // 병사 목록 조회
    public List<SoldierVO> getSoldierList() {
        return jdbcTemplate.query(SOLDIER_LIST, new RowMapper<SoldierVO>() {
            @Override
            public SoldierVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                SoldierVO data = new SoldierVO();
                data.setId(rs.getInt("id"));
                data.setName(rs.getString("name"));
                data.setBirthDate(rs.getString("birthDate"));
                data.setHeight(rs.getInt("height"));
                data.setWeight(rs.getInt("weight"));
                data.setBodyGrade(rs.getInt("bodyGrade"));
                data.setDesiredPosition(rs.getString("desiredPosition"));
                data.setDesiredDate(rs.getString("desiredDate"));
                data.setCertificate(rs.getString("certificate"));
                return data;
            }
        });
    }

    // 병사 검색
    public List<SoldierVO> searchSoldiers(String query) {
        String sql = "SELECT * FROM SOLDIER WHERE name LIKE ? OR desiredPosition LIKE ?";
        return jdbcTemplate.query(sql, new Object[]{"%" + query + "%", "%" + query + "%"},
                new BeanPropertyRowMapper<>(SoldierVO.class));
    }
}
