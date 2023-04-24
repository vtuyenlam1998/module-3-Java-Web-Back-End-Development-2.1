package com.example.book_managment.model.entity;

import java.util.Date;

public class Book {
    private int id;
    private String name;
    private String type;
    private Date year;
    private String detail;
    private int price;
    private int quantity;
    private int numberOfBookPurchase = 0;
    private String img;

    public Book() {
    }
    public Book(int id, String name, String type, Date year, String detail, int price, int quantity, String img) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.year = year;
        this.detail = detail;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public Book(String name, String type, Date year, String detail, int price, int quantity, String img) {
        this.name = name;
        this.type = type;
        this.year = year;
        this.detail = detail;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getNumberOfBookPurchase() {
        return numberOfBookPurchase;
    }

    public void setNumberOfBookPurchase(int numberOfBookPurchase) {
        this.numberOfBookPurchase = numberOfBookPurchase;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setQuantity() {
        this.quantity = quantity - 1;
    }
    @Override
    public String toString() {
        return "THÔNG TIN SẢN PHẨM: "
                + "\n" + "✨ Tác phẩm: " + getId()
                + "\n" + "❒ Sách: " + getName()
                + "\n" + "❒ Năm xuất bản: " + getYear()
                + "\n" + "❒ Thể loại: " + getType()
                + "\n" + "❒ Nội dung: " + getDetail()
                + "\n" + "❒ Giá bán: " + getPrice() + " ₫"
                + "\n" + "❒ Số lượng trong kho: " + getQuantity();
    }
}

