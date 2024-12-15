package org.example.springteamproject.auth;

public class UserVO {
    private int id;
    private String username;
    private String password;

    public UserVO(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}