package com.example.book_managment.model.dao;

import com.example.book_managment.model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IStaffDAO {
    User get(int id);
    void insertStaff(User user) throws SQLException;
    List<User> selectAllStaff();
    boolean deleteStaff(int id) throws SQLException;
    boolean updateStaff(User user) throws SQLException;
}
