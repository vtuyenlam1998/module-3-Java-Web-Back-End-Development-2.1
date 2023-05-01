package com.example.book_managment.controller;

import com.example.book_managment.model.dto.UserDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "authServlet", urlPatterns = {})
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AuthServlet authServlet = null;

    @Override
    public void init() throws ServletException {
        authServlet = new AuthServlet();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/login":
                request.getRequestDispatcher("/home/login.jsp").forward(request,response);
                break;
            case "/logout":
                if (request.getServletPath().startsWith("/logout")) {
                    request.getSession().removeAttribute("userLogged");
                }
                response.sendRedirect(request.getContextPath()+"/login");
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String action = request.getServletPath();
        HttpSession session = request.getSession();

        switch (action) {
            case "/login":
//                UserDto userDto = authServlet.login(email,password);
//                if (userDto != null) {
//                    session.setAttribute("userLogged",userDto);
//                    response.sendRedirect(request.getContextPath() + "/home");
//                } else {
//                    request.setAttribute("loginFailedMessage","Invalid login info!");
//                    request.getRequestDispatcher("/home/login.jsp").forward(request,response);
//                }
//                break;
            default:
                break;
        }
    }
}
