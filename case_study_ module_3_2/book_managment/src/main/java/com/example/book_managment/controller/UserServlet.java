package com.example.book_managment.controller;

import com.example.book_managment.model.dao.BookDAO;
import com.example.book_managment.model.dao.StaffDAO;
import com.example.book_managment.model.dao.UserDAO;
import com.example.book_managment.model.entity.Book;
import com.example.book_managment.model.entity.User;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/users", "/login", "/signup", "/term", "/user", "/logout","/register"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private StaffDAO staffDAO;

    public void init() {
        userDAO = new UserDAO();
        bookDao = new BookDAO();
        staffDAO = new StaffDAO();
    }

    private User currentUser;

    private User getCurrentUser() {
        return currentUser;
    }

    private BookDAO bookDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "/term":
                    showTermOfService(request, response);
                    break;
                case "/signup":
                    signupPage(request, response);
                    break;
                case "/login":
                    loginPage(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showTermOfService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/common/termofservice.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void signupPage(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/signup.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void loginPage(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
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
                case "/register":
                    registerUser(request, response);
                    break;
                case "/user":
                    authUser(request, response);
                    break;
                case "/logout":
                    logoutUser(request,response);
                    break;
                case "/editUser":
                    editUser(request,response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.editUser(fullName,phoneNumber,address,id);
        request.setAttribute("message","Thông tin đã được cập nhật!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/cart/payment.jsp");
        dispatcher.forward(request,response);
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) {
        currentUser = null;
        request.getSession().setAttribute("user",getCurrentUser());
        List<Book> bookList = bookDao.selectAllBook();
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/home/home.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");
        List<User> userList = userDAO.selectAllUser();
        userList.addAll(staffDAO.selectAllStaff());
        boolean isExisted = false;
        for (User user : userList) {
            if (email.equalsIgnoreCase(user.getEmail()) | phoneNumber.equalsIgnoreCase(user.getPhoneNumber())) {
                isExisted = true;
                break;
            }
        }
       if (isExisted) {
           RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/signup.jsp");
           request.setAttribute("message","Email hoặc số điện thoại đã tồn tại");
           try {
               dispatcher.forward(request, response);
           } catch (ServletException | IOException e) {
               e.printStackTrace();
           }
       } else {
           User user = new User(fullName, phoneNumber, email, password, address, avatar);
           userDAO.insertUser(user);
           RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/common/registerNotify.jsp");
           try {
               dispatcher.forward(request, response);
           } catch (ServletException | IOException e) {
               e.printStackTrace();
           }
       }

    }

    private void authUser(HttpServletRequest request, HttpServletResponse response) {
        String emailOrPhone = request.getParameter("email");
        String password = request.getParameter("password");
        List<User> userList = userDAO.selectAllUser();
        userList.addAll(staffDAO.selectAllStaff());
        HttpSession session = request.getSession();
        for (User user : userList) {
            if (emailOrPhone.equals(user.getEmail()) | emailOrPhone.equals(user.getPhoneNumber())) {
                if (password.equals(user.getPassWord())) {
                    System.out.println("Log in successfully!");
                    currentUser = user;
                    List<Book> bookList = bookDao.selectAllBook();
                    request.setAttribute("bookList", bookList);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/view/home/home.jsp");
                    session.setAttribute("user", getCurrentUser());
                    session.setAttribute("avatar", getCurrentUser().getAvatar());
                    try {
                        requestDispatcher.forward(request, response);
                        break;
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        if (getCurrentUser() == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            request.setAttribute("message","Sai thông tin đăng nhập");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }
}
