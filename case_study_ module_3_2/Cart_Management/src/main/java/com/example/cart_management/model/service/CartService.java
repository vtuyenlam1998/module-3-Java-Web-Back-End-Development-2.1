package com.example.cart_management.model.service;

import com.example.cart_management.model.dao.ProductDAO;
import com.example.cart_management.model.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class CartService {
    private List<Product> shoppingCarts = new ArrayList<>();
    private ProductDAO productDAO = new ProductDAO();
    private static final CartService CART_SERVICE = new CartService();
    private CartService(){}
    public static CartService getInstance() {
        return CART_SERVICE;
    }
    public List<Product> checkCart() {
        return shoppingCarts;
    }
    public void addProduct(int id) {
        shoppingCarts.add(productDAO.selectProduct(id));
    }
//    public int countQuantity(){
//        for (Product product : shoppingCarts) {
//            if ()
//        }
//    }
}
