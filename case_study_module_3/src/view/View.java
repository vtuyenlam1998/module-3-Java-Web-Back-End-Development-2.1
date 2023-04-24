package view;

import model.ulti.MySQLConnection;

public class View {
    public static void main(String[] args){
//        BookStoreView bookStore = BookStoreView.getInstance();
//        bookStore.displayMainMenu();
        MySQLConnection mySQLConnection = new MySQLConnection();
        mySQLConnection.selectAllCustomers();
    }
}