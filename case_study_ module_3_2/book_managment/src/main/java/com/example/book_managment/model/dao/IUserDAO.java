package com.example.book_managment.model.dao;

import com.example.book_managment.model.dto.UserDto;
import com.example.book_managment.model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    User get(int id);
    void insertUser(User user) throws SQLException;
    List<User> selectAllUser();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
}
