package com.example.book_managment.model.dto;

public class UserDto {
    private int ID;
    private String userName;
    private String fullName;
    private String phoneNumber;
    private String email;
    private String passWord;
    private String address;
    private String avatar;
    public UserDto(){}
    public UserDto(int id,String userName, String fullName, String phoneNumber, String email, String passWord, String address,String avatar) {
        super();
        this.ID = id;
        this.userName = userName;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.passWord = passWord;
        this.email = email;
        this.address = address;
        this.avatar = avatar;
    }
}
