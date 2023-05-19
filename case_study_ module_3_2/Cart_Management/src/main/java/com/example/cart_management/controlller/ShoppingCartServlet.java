package com.example.cart_management.controlller;

import com.example.cart_management.model.dao.ProductDAO;
import com.example.cart_management.model.entity.Product;
import com.example.cart_management.model.entity.ShoppingCart;
import com.example.cart_management.model.service.CartService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/cart"})
public class ShoppingCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private List<ShoppingCart> shoppingCarts;

    public void init() {
        productDAO = new ProductDAO();
        shoppingCarts = new ArrayList<>();
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

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                case "/cart":
                    showCartForm(request,response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showCartForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        CartService.getInstance().addProduct(id);
        List<Product> productCart = CartService.getInstance().checkCart();
        request.getSession().setAttribute("productCart",productCart);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/shoppingcart/cart.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
