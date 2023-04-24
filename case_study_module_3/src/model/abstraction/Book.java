package model.abstraction;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book {
    private int id;
    private String name;
    private String type;
    private Date year;
    private String detail;
    private int price;
    private long quantity;
    private int numberOfBookPurchase = 0;
    private String img;
    public Book(int id, String name, String type, Date year, String detail, int price, long quantity,String img) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.year = year;
        this.detail = detail;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }
    public Book() {
    }
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getDetail() {
        return detail;
    }

    public int getPrice() {
        return price;
    }

    public long getQuantity() {
        return quantity;
    }
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getYear() {
        return year;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setYear(String year) throws ParseException {
        this.year = new SimpleDateFormat("dd-MM-yyyy").parse(year);
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getFormatYearOfPublication() {
        return new SimpleDateFormat("dd-MM-yyyy").format(year);
    }

    public int getNumberOfBookPurchase() {
        return numberOfBookPurchase;
    }

    public void setNumberOfBookPurchase() {
        this.numberOfBookPurchase++;
    }



    public void setQuantity() {
        this.quantity = quantity - 1;
    }

    @Override
    public String toString() {
        return "THÔNG TIN SẢN PHẨM: "
                + "\n" + "✨ Tác phẩm: " + id
                + "\n" + "❒ Sách: " + name
                + "\n" + "❒ Năm xuất bản: " + getFormatYearOfPublication()
                + "\n" + "❒ Thể loại: " + getType()
                + "\n" + "❒ Nội dung: " + getDetail()
                + "\n" + "❒ Giá bán: " + price + " ₫"
                + "\n" + "❒ Số lượng trong kho: " + quantity;
    }
}
