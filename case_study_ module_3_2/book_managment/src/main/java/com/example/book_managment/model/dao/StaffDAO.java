package com.example.book_managment.model.dao;

import com.example.book_managment.connection.JdbcConnection;
import com.example.book_managment.model.entity.Staff;
import com.example.book_managment.model.entity.User;
import com.example.book_managment.model.exception.SQL_Exception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO implements IStaffDAO{
    private static final String INSERT_STAFF_SQL = "INSERT INTO staff (user_name,full_name,phone_number,email,password,address,avatar) VALUES (?,?,?,?,?,?,?)";
    private static final String SELECT_STAFF_BY_ID = "SELECT user_name,full_name,phone_number,email,password,address,avatar FROM staff WHERE id =? AND IS_DELETED = 0";
    private static final String SELECT_ALL_STAFFS = "select * from staff WHERE IS_DELETED = 0;";
    private static final String DELETE_STAFF_SQL = "UPDATE staff SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_STAFF_SQL = "update staff set user_name = ?,full_name= ?, phone_number =?, email=?, password=?, address=?, avatar=?  where id = ?;";
    public StaffDAO(){}
    @Override
    public User get(int id) {
        User user = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String user_name = rs.getString("user_name");
                String full_name = rs.getString("full_name");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                user = new Staff(user_name,full_name,phone_number,email,password,address,avatar);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return user;
    }

    @Override
    public void insertStaff(User user) throws SQLException {
        System.out.println(INSERT_STAFF_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassWord());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getAvatar());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public List<User> selectAllStaff() {
        List<User> users = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFFS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String user_name = rs.getString("user_name");
                String full_name = rs.getString("full_name");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                users.add(new Staff(id,user_name,full_name,phone_number,email,password,address,avatar));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return users;
    }

    @Override
    public boolean deleteStaff(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_STAFF_SQL);) {
            statement.setInt(1,1);
            statement.setInt(2,id);
            if(statement.executeUpdate() > 0) {
                System.out.println("Removed user successfully.");
                rowDeleted = true;
            } else {
                System.out.println("Failed to remove user.");
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateStaff(User user) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STAFF_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassWord());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getAvatar());
            preparedStatement.setInt(8,user.getID());
            if(preparedStatement.executeUpdate() > 0) {
                System.out.println("Edited user successfully.");
                rowUpdated = true;
            } else {
                System.out.println("Failed to edit user.");
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
        return rowUpdated;
    }
}
