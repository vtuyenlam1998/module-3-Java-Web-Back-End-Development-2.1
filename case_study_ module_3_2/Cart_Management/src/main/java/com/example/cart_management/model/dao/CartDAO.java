package com.example.cart_management.model.dao;

import java.sql.SQLException;

public class CartDAO implements ICartDAO {
    private static final String INSERT_PRODUCT_INTO_CART = "INSERT INTO PRODUCT (NAME,PRICE,DESCRIPTION,IMAGE_URL) VALUES (?,?,?,?)";
    private static final String GET_QUANTITY_PRODUCT = "SELECT COUNT() FROM CART WHERE id =? AND IS_DELETED = 0;";

    @Override
    public void insertCart(int id) throws SQLException {

    }

    @Override
    public int getQuantityProduct(int id) throws SQLException {
        return 0;
    }
}
