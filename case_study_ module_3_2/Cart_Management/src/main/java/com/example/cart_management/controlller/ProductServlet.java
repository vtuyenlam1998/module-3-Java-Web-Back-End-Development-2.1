package com.example.cart_management.controlller;

import com.example.cart_management.model.dao.ProductDAO;
import com.example.cart_management.model.entity.Product;
import com.example.cart_management.model.service.ProductService;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductServlet", urlPatterns = {"/home","","/"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
//                case "/add":
//                case "/add":
//                case "/add":
//                case "/home":
//                case "/":
//                case "":
            }
        } catch (Exception e) { throw new ServletException(e);}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
//                case "/add":
//                case "/add":
//                case "/add":
                case "/home":
                case "/":
                case "":
                    showProductList(request,response);
                    break;
                case "/404":
                default:
                    error_404(request,response);
                    break;
            }
        } catch (Exception e) { throw new ServletException(e);}
    }

    private void error_404(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/home/error-404.jsp");
        dispatcher.forward(request,response);
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = ProductService.getInstance().getProductList();
        request.getSession().setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/home/productList.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}