package com.example.book_managment.model.dao;

import com.example.book_managment.connection.JdbcConnection;
import com.example.book_managment.model.entity.User;
import com.example.book_managment.model.exception.SQL_Exception;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (user_name,full_name,phone_number,email,password,address,avatar) VALUES (?,?,?,?,?,?,?)";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT user_name,full_name,phone_number,email,password,address,avatar FROM customer WHERE id =? AND IS_DELETED = 0";
    private static final String SELECT_ALL_CUSTOMERS = "select * from customer WHERE IS_DELETED = 0;";
    private static final String DELETE_CUSTOMER_SQL = "UPDATE customer SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set user_name = ?,full_name= ?, phone_number =?, email=?, password=?, address=?, avatar=?  where id = ?;";
    private static final String EDIT_CUSTOMER_SQL = "update customer set full_name= ?, phone_number =?, address=? where id = ?;";
    public UserDAO(){}
    @Override
    public User get(int id) {
        User user = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID)) {
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
                user = new User(user_name,full_name,phone_number,email,password,address,avatar);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return user;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_CUSTOMER_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
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
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);) {
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
                users.add(new User(id,user_name,full_name,phone_number,email,password,address,avatar));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
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
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
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

    public boolean editUser(String name,String phone,String address, int id) {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER_SQL)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phone);
            preparedStatement.setString(3, address);
            preparedStatement.setInt(4,id);
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
