package com.example.book_managment.model.service;

import com.example.book_managment.model.dao.BookDAO;
import com.example.book_managment.model.entity.Book;

import java.sql.SQLException;
import java.util.List;

public class BookService {
    private static final BookService BOOK_SERVICE = new BookService();
    private BookService(){}
    public static BookService getInstance() {
        return BOOK_SERVICE;
    }
    private BookDAO bookDAO = new BookDAO();
    public List<Book> getAllBook() {
        return bookDAO.selectAllBook();
    }
    public Book getDetailBook(int id) {
        return bookDAO.selectBook(id);
    }
    public boolean deleteBook(int id) throws SQLException {
        return bookDAO.deleteBook(id);
    }
    public void insertBook(Book book) throws SQLException {
        bookDAO.insertBook(book);
    }
    public boolean updateBook(Book book) throws SQLException {
        return bookDAO.updateBook(book);
    }
}
