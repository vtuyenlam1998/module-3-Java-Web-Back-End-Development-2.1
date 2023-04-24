package model.Entity.User;

import model.abstraction.User;

public class Staff extends User {
    private int ID;
    private static int count;
    public Staff(int id,String fullName, String phoneNumber, String email, String address) {
        super(id,fullName, phoneNumber, address, email);
    }

    public Staff(int id,String userName, String passWord) {
        super(id,userName, passWord);
    }

    public Staff(int id,String userName, String fullName, String phoneNumber, String email, String passWord, String address) {
        super(id,userName, fullName, phoneNumber, email, passWord, address);
    }

    @Override
    public int getID() {
        return ID;
    }

    @Override
    public void setID(int ID) {
        this.ID = ID;
    }
}
