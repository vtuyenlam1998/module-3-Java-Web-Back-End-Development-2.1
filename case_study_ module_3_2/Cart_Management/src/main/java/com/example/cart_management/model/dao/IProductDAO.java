package com.example.cart_management.model.dao;

import com.example.cart_management.model.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    void insertProduct(Product product) throws SQLException;
    Product selectProduct (int id);
    List<Product> selectAllProduct();
    boolean deleteProduct(int id) throws SQLException;
    boolean updateProduct(Product product) throws SQLException;
}
