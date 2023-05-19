package com.example.cart_management.model.dao;

import com.example.cart_management.connection.JdbcConnection;
import com.example.cart_management.model.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO PRODUCT (NAME,PRICE,DESCRIPTION,IMAGE_URL) VALUES (?,?,?,?)";
    private static final String SELECT_PRODUCT_SQL = "SELECT ID,NAME,PRICE,DESCRIPTION,IMAGE_URL FROM PRODUCT WHERE id =? AND IS_DELETED = 0;";
    private static final String SELECT_ALL_PRODUCTS = "select * from product WHERE IS_DELETED = 0;";
    private static final String DELETE_PRODUCT_SQL = "UPDATE PRODUCT SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update PRODUCT set NAME = ?,PRICE= ?, DESCRIPTION =?, IMAGE_URL=?  where id = ?;";

    public ProductDAO() {

    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCT_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getImage_url());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_SQL)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String img = rs.getString("image_url");
                product = new Product(id,name,price,description,img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String image_url = rs.getString("image_url");
                products.add(new Product(id,name,price,description,image_url));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return products;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return false;
    }
}
