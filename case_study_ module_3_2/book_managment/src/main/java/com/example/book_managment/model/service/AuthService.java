package com.example.book_managment.model.service;

import com.example.book_managment.model.dao.UserDAO;
import com.example.book_managment.model.dto.LoginDTO;
import com.example.book_managment.model.dto.UserDto;

public class AuthService {
    private UserDAO userDAO = null;
    public AuthService() {userDAO = new UserDAO();}
//    public UserDto login(String email,String password) {
//        UserDto userDto = userDAO.get(email);
//        LoginDto loginDto = new LoginDto()(userDto.getEmail(),userDto.getPassword());
//
//    }
}
