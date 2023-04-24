package model.factory;

import model.Entity.User.Customer;
import model.Entity.User.Staff;
import model.abstraction.User;

public class UserFactory {
    private static final UserFactory userFactory = new UserFactory();
    private UserFactory(){}
    public static UserFactory getInstance(){
        return userFactory;
    }
    public User getUser(int id,String userName,String fullName, String phoneNumber, String email, String passWord,String address, String typeUser) {
        String typeUserToUpperCase = typeUser.toUpperCase();
        return switch (typeUserToUpperCase) {
            case "CUSTOMER" -> new Customer(id,userName,fullName, phoneNumber, email, passWord, address);
            case "STAFF" -> new Staff(id,userName,fullName, phoneNumber, email, passWord,address);
            default -> null;
        };
    }
}
