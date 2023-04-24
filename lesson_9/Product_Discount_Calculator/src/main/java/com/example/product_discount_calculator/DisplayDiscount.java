package com.example.product_discount_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "displayDiscount", urlPatterns = "/display-discount")
public class DisplayDiscount extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("price"));
        double discountRate = Double.parseDouble(request.getParameter("discount"));
        String detail = request.getParameter("detail");

        double discountAmount = price * discountRate * 0.01;
        double discountPrice = price - discountAmount;

        String formatPrice = Converter.formatPrice(price);
        String formatDiscountRate = Converter.formatPrice(discountRate);
        String formatAmount = Converter.formatPrice(discountAmount);
        String formatDiscountPrice = Converter.formatPrice(discountPrice);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
        out.println("<h1>Product Description: " + detail + "<h1>");
        out.println("<h1>List Price: " + formatPrice + "<h1>");
        out.println("<h1>Discount Percent(%): " + formatDiscountRate + "</h1>");
        out.println("<h1>Discount Amount: " + formatAmount + "<h1>");
        out.println("<h1>Discount Price: " + formatDiscountPrice + "<h1>");
        out.println("</html>");
    }

    public void destroy() {
    }
}