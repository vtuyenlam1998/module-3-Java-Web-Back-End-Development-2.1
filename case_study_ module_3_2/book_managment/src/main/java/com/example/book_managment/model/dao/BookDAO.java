package com.example.book_managment.model.dao;

import com.example.book_managment.connection.JdbcConnection;
import com.example.book_managment.model.entity.Book;
import com.example.book_managment.model.exception.SQL_Exception;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO implements IBookDAO {
    private static final String INSERT_BOOKS_SQL = "INSERT INTO book (name,type,year,detail,price,quantity,img) VALUES (?,?,?,?,?,?,?)";
    private static final String SELECT_BOOK_BY_ID = "SELECT id,name,type,year,detail,price,quantity,img FROM book WHERE id =? AND IS_DELETED = 0";
    private static final String SELECT_ALL_BOOKS = "select * from book WHERE IS_DELETED = 0;";
    private static final String DELETE_BOOK_SQL = "UPDATE book SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_BOOK_SQL = "update book set name = ?,type= ?, year =?, detail=?, price=?, quantity=?, img=?  where id = ?;";

    public BookDAO() {
    }

    @Override
    public void insertBook(Book book) throws SQLException {
        System.out.println(INSERT_BOOKS_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOKS_SQL)) {
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getType());
            preparedStatement.setDate(3, new Date(book.getYear().getTime()));
            preparedStatement.setString(4, book.getDetail());
            preparedStatement.setInt(5, book.getPrice());
            preparedStatement.setInt(6, book.getQuantity());
            preparedStatement.setString(7, book.getImg());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public Book selectBook(int id) {
        Book book = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String type = rs.getString("type");
                Date year = rs.getDate("year");
                String detail = rs.getString("detail");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("img");
                book = new Book(id,name,type,year,detail,price,quantity,img);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return book;
    }

    @Override
    public List<Book> selectAllBook() {
        List<Book> books = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String type = rs.getString("type");
                Date year = rs.getDate("year");
                String detail = rs.getString("detail");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("img");
                books.add(new Book(id,name,type,year,detail,price,quantity,img));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return books;
    }

    @Override
    public boolean deleteBook(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_BOOK_SQL);) {
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
    public boolean updateBook(Book book) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK_SQL)) {
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getType());
            preparedStatement.setDate(3, new Date(book.getYear().getTime()));
            preparedStatement.setString(4, book.getDetail());
            preparedStatement.setInt(5, book.getPrice());
            preparedStatement.setInt(6, book.getQuantity());
            preparedStatement.setString(7, book.getImg());
            preparedStatement.setInt(8,book.getId());
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
