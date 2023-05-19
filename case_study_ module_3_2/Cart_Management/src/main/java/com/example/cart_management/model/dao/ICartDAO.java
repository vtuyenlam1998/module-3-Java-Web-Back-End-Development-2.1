package com.example.cart_management.model.dao;

import java.sql.SQLException;

public interface ICartDAO {
    void insertCart(int id) throws SQLException;
    int getQuantityProduct(int id) throws SQLException;
}
