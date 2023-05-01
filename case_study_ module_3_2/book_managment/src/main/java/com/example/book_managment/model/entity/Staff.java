package com.example.book_managment.model.entity;

public class Staff extends User{
    public Staff(){
        super();
    }

    public Staff(String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(userName, fullName, phoneNumber, email, passWord, address, avatar);
    }

    public Staff(int id, String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(id, userName, fullName, phoneNumber, email, passWord, address, avatar);
    }

    public Staff(String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(fullName, phoneNumber, email, passWord, address, avatar);
    }

}
