package com.example.book_managment.model.exception;

import java.sql.SQLException;

public class SQL_Exception extends java.sql.SQLException {
    public static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQL_Exception) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQL_Exception) e).getSQLState());
                System.err.println("Error Code: " + ((SQL_Exception) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
