package com.example.book_managment.model.dao;

import com.example.book_managment.model.entity.Book;

import java.sql.SQLException;
import java.util.List;

public interface IBookDAO {
    void insertBook(Book book) throws SQLException;
    Book selectBook(int id);
    List<Book> selectAllBook();
    boolean deleteBook(int id) throws SQLException;
    boolean updateBook(Book book) throws SQLException;
}
