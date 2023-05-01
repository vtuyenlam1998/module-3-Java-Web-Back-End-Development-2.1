package com.example.book_managment.model.entity;

public class User {
    private int ID;
    private String userName;
    private String fullName;
    private String phoneNumber;
    private String email;
    private String passWord;
    private String address;
    private String avatar;

    public User() {
    }

    public User(String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super();
        this.userName = userName;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.passWord = passWord;
        this.address = address;
        this.avatar = avatar;
    }

    public User(int id, String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        this.ID = id;
        this.userName = userName;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.passWord = passWord;
        this.email = email;
        this.address = address;
        this.avatar = avatar;
    }

    public User(String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.passWord = passWord;
        this.address = address;
        this.avatar = avatar;
    }



    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
