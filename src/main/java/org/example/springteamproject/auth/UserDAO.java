package org.example.springteamproject.auth;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    @Autowired
    SqlSession sqlSession;

    public int insertUser(UserVO user){
        return sqlSession.insert("USER.insertUser", user);
    }

    public UserVO getUser(UserVO user){
        return sqlSession.selectOne("USER.getUser", user);
    }
}