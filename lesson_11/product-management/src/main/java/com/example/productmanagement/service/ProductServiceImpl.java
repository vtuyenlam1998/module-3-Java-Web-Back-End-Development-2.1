package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Quần xì Thái", 50000, "siêu co dãn", "Chợ Đồng Xuân"));
        products.put(2, new Product(2, "Áo ngực Thái", 150000, "siêu nâng đỡ", "Chợ Đồng Ba"));
        products.put(3, new Product(3, "Áo dài Việt", 300000, "siêu xuyên thấu", "Chợ Bàn Cờ"));
        products.put(4, new Product(4, "Váy xẻ Trung Quốc", 150000, "siêu can lộ lộ", "Chợ nổi Cái Răng"));
        products.put(5, new Product(5, "Áo croptop Trung Quốc", 250000, "siêu ngắn", "Chợ Đồng Xuân"));
        products.put(6, new Product(6, "Áo sơ mi Việt Nam", 450000, "siêu lộ ti", "Chợ nổi Cái Răng"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product findProductById(int id) {
        return products.get(id);
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public List<Product> findByName(String name, Product product) {
        List<Product> products1 = new ArrayList<>(products.values());
        List<Product> products2 = new ArrayList<>();
        for (Product product1 : products1) {
            if (name.toUpperCase().trim().contains(product1.getName().toUpperCase().trim())) {
                products2.add(product1);
            }
        }
        return products2;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
