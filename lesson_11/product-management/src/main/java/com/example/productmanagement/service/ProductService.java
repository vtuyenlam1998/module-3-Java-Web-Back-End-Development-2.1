package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findProductById(int id);
    void save(Product product);
    List<Product> findByName(String name,Product product);
    void update(int id, Product product);
    void remove(int id);
}
