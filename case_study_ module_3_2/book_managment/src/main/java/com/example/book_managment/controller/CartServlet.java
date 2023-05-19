package com.example.book_managment.controller;

import com.example.book_managment.model.dao.BookDAO;
import com.example.book_managment.model.dao.UserDAO;
import com.example.book_managment.model.entity.Book;
import com.example.book_managment.model.entity.Staff;
import com.example.book_managment.model.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart","/payment"})
public class CartServlet extends HttpServlet {
    private BookDAO bookDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
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
                case "/cart":
                    showCartPage(request, response);
                    break;
                case "/payment":
                    paymentPage(request, response);
                    break;
//                case "/search":
//                    searchBook(request, response);
//                    break;
//                default:
//                    listBook(request, response);
//                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void paymentPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/cart/payment.jsp");
        dispatcher.forward(request,response);
    }

    private void showCartPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof User) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/cart/cartpage.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/home.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
