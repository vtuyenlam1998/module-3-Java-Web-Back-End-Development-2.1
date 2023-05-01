package com.example.book_managment.controller;

import com.example.book_managment.model.dao.BookDAO;
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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = {"/", "", "/home"})
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
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
                case "/add":
                    addBook(request, response);
                    break;
                case "/edit":
                    updateBook(request, response);
                    break;
                case "/search":
                    searchBook(request, response);
                    break;
                default:
                    listBook(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void searchBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keySearch = request.getParameter("search");
        List<Book> bookList = bookDAO.selectAllBook();
        List<Book> searchList = new ArrayList<>();
        for (Book book : bookList) {
            if (book.getName().toLowerCase().contains(keySearch.toLowerCase())) {
                searchList.add(book);
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/list.jsp");
        if (searchList.isEmpty()) {
            request.setAttribute("message", "Không tìm thấy sách theo yêu cầu");
        } else {
            request.setAttribute("message", "Tìm thấy " + searchList.size() + " sách theo yêu cầu");
        }
        request.getSession().setAttribute("bookList", searchList);
        requestDispatcher.forward(request, response);
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String tempYear = request.getParameter("year");
        java.util.Date year = new SimpleDateFormat("yyyy-MM-dd").parse(tempYear);
        String detail = request.getParameter("detail");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String img = request.getParameter("img");
        Book book = new Book(id, name, type, year, detail, price, quantity, img);
        bookDAO.updateBook(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/edit.jsp");
        request.setAttribute("message", "New book was updated");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void addBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
        String name =request.getParameter("name");
        String type =request.getParameter("type");
        String tempYear = request.getParameter("year");
        java.util.Date year = new SimpleDateFormat("yyyy-MM-dd").parse(tempYear);
        String detail =request.getParameter("detail");
        int price =Integer.parseInt(request.getParameter("price"));
        int quantity =Integer.parseInt(request.getParameter("quantity"));
        String img =request.getParameter("img");
        Book book = new Book(name,type,year,detail,price,quantity,img);
        bookDAO.insertBook(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/add.jsp");
        request.setAttribute("message","New book was added");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        String actionHref = request.getParameter("action");
        if (actionHref != null) {
            if (actionHref.equals("show")) {
                action = "/show";
            }
        }

        try {
            switch (action) {
                case "/show":
                    showDetailForm(request, response);
                    break;
                case "/add":
                    showAddForm(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deleteBookServlet(request, response);
                    break;
                case "/404":
                    show404Form(request,response);
                    break;
                default:
                    listBook(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void show404Form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/error-404.jsp");
        dispatcher.forward(request,response);
    }

    private void showDetailForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.selectBook(id);
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/detail.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBookServlet(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Staff) {
                int id = Integer.parseInt(request.getParameter("id"));
                bookDAO.deleteBook(id);
                List<Book> bookList = bookDAO.selectAllBook();
                request.getSession().setAttribute("bookList", bookList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Staff) {
                int id = Integer.parseInt(request.getParameter("id"));
                Book book = bookDAO.selectBook(id);
                RequestDispatcher dispatcher;
                if (book == null) {
                    dispatcher = request.getRequestDispatcher("error-404.jsp");
                } else {
                    request.setAttribute("book", book);
                    dispatcher = request.getRequestDispatcher("book/edit.jsp");
                }
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Staff) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/add.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> bookList = bookDAO.selectAllBook();
        request.getSession().setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}