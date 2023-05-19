package com.example.cart_management.model.service;

import com.example.cart_management.model.dao.ProductDAO;
import com.example.cart_management.model.entity.Product;

import java.util.List;

public class ProductService {
    private static final ProductService PRODUCT_SERVICE = new ProductService();
    private ProductService(){}
    public static ProductService getInstance(){
        return PRODUCT_SERVICE;
    }
    private static ProductDAO productDAO = new ProductDAO();
    public List<Product> getProductList(){
        List<Product> productList = productDAO.selectAllProduct();
        return productList;
    }
}
