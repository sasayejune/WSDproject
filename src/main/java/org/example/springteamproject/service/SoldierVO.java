package org.example.springteamproject.service;

public class SoldierVO {
    private int id;
    private int userID;
    private String name;
    private String birthDate;
    private int height;
    private int weight;
    private int bodyGrade;
    private String desiredPosition;
    private String desiredDate;
    private String certificate; // 파일명

    // Getter 및 Setter 메서드

    public int getUserID() { return userID; }

    public void setUserID(int userID) { this.userID = userID; }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getBodyGrade() {
        return bodyGrade;
    }

    public void setBodyGrade(int bodyGrade) {
        this.bodyGrade = bodyGrade;
    }

    public String getDesiredPosition() {
        return desiredPosition;
    }

    public void setDesiredPosition(String desiredPosition) {
        this.desiredPosition = desiredPosition;
    }

    public String getDesiredDate() {
        return desiredDate;
    }

    public void setDesiredDate(String desiredDate) {
        this.desiredDate = desiredDate;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }
}
