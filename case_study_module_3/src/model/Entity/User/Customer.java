package model.Entity.User;

import model.abstraction.User;

public class Customer extends User {
    private int ID;
    private static int count;

    public Customer(int id,String fullName, String phoneNumber, String email, String passWord) {
        super(id,fullName, phoneNumber, email, passWord);
    }

    public Customer(int id,String userName, String passWord) {
        super(id,userName, passWord);
    }

    public Customer(int id,String userName, String fullName, String phoneNumber, String email, String passWord, String address) {
        super(id, userName, fullName, phoneNumber, email, passWord, address);
    }
    @Override
    public int getID() {
        return ID;
    }
}
