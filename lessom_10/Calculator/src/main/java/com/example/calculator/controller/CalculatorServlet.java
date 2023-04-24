package com.example.calculator.controller;

import com.example.calculator.model.Calculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
        out.println("<h1> Result: </h1>");
        try {
            float result = Calculator.calculate(firstOperand,secondOperand,operator);
            out.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        out.println("</html>");
    }

    public void destroy() {
    }
}