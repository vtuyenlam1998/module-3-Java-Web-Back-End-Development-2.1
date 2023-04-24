package model.ulti;

import model.Entity.User.Customer;
import model.abstraction.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLConnection {
    private String jdbcURL = "jdbc:mysql://localhost:3306/BOOK_MANAGEMENT?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";
    private static final String INSERT_USERS_SQL = "INSERT INTO CUSTOMER (id, user_name, full_name, phone_number, email, password, address) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from CUSTOMER";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    public MySQLConnection() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    public void insertCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1,customer.getID());
            preparedStatement.setString(2,customer.getUserName());
            preparedStatement.setString(3,customer.getFullName());
            preparedStatement.setString(4,customer.getPhoneNumber());
            preparedStatement.setString(5,customer.getEmail());
            preparedStatement.setString(6,customer.getPassWord());
            preparedStatement.setString(7,customer.getAddress());
            System.out.println(preparedStatement);
            
        }
    }

    public List<Customer> selectAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id =rs.getInt("ID");
                String name = rs.getString("USER_NAME");
                String fullname = rs.getString("FULL_NAME");
                String phone = rs.getString("PHONE_NUMBER");
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                String address = rs.getString("ADDRESS");
                customers.add(new Customer(id,name,fullname,phone,email,password,address));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
}
