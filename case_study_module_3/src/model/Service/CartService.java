package model.Service;

import model.abstraction.Book;
import model.exception.InvalidChoiceException;
import model.ulti.Input;
import model.ulti.ReturnFunction;
import model.ulti.WriteFileUlti;

import java.util.List;

public class CartService {
    private static final CartService cartService = new CartService();

    private CartService() {
    }

    public static CartService getInstance() {
        return cartService;
    }

    private static final BookService bookService = BookService.getInstance();
    private static final List<Book> bookList = bookService.getBookList();
    private static final List<Book> BOOK_CART;
    private static final UserService userService = UserService.getInstance();
    private static boolean isPaid = false;
    static {
        BOOK_CART = bookService.getBookCart();
    }
    public boolean checkPaidCart() {
        return isPaid;
    }
    public void checkCart() {
        int totalCart = 0;
        if (BOOK_CART.isEmpty()) {
            System.out.print("""
                    Giỏ hàng:
                    Không có gì trong giỏ hàng
                    Bạn muốn mua thêm sách không?
                    """);
            ReturnFunction.backPage();
        } else {
            System.out.println("Giỏ hàng:" + "\n" + "Tổng số sản phẩm: " + BOOK_CART.size());
            for (Book book : BOOK_CART) {
                System.out.println("ID " + book.getId() + ". " + book.getName() + " - Giá tiền: " + book.getPrice() + "₫");
                totalCart += book.getPrice();
            }
            System.out.println("----------------------------------------------");
            System.out.println("\t\t\t\t\t\t\t" + "Tổng tiền " + totalCart + "₫");
            buyBookOnline();
        }
    }
    public void buyBookOnline() {
        do {
            try {
                System.out.println("""
                        1. Thanh toán bằng QR, thẻ ATM
                        2. Ship COD tới tận nhà
                        3. Quay lại
                        """);
                int transactionChoice = Input.choiceIntegerInput("Chọn hình thức thanh toán: ");
                switch (transactionChoice) {
                    case 1:
                        System.out.println("""
                                ** ***** ***** **
                                *** *** * *** ***
                                **** * *** * ****
                                ***** ***** *****
                                ****  *****  ****
                                *** ** *** ** ***
                                ** **** * **** **
                                                        
                                Quét mã để thanh toán sản phẩm:
                                1. Quét mã
                                2. Quay lại
                                """);
                        int choice = Input.choiceIntegerInput("Nhập lựa chọn: ");
                        switch (choice) {
                            case 1:
                                    for (int i = 0; i < BOOK_CART.size(); i++) {
                                        for (int j = 0; j < bookList.size(); j++) {
                                            if (BOOK_CART.get(i).getId() == (bookList.get(j).getId())) {
                                                bookList.get(j).setQuantity();
                                                bookList.get(j).setNumberOfBookPurchase();
                                                isPaid = true;
                                            }
                                        }
                                    }
                                System.out.println("Đang thực hiện giao dịch ...");
                                System.out.println("Bạn đã thanh toán thành công, sách sẽ được chuyển tới từ 3 - 5 ngày ");
                                WriteFileUlti.writeFileInvoice("src\\model\\data\\invoice.txt", userService.getCurrentUser());
                                WriteFileUlti.writeFileAppendInvoice("src\\model\\data\\invoice.txt",BOOK_CART);
                                WriteFileUlti.writeFileAppendInvoiceHistory("src\\model\\data\\invoiceHistory.csv", userService.getCurrentUser(), BOOK_CART);
                                BOOK_CART.clear();
                                return;
                            case 2:
                                return;
                        }
                    case 2:
                        System.out.println(userService.getCurrentUser().getAddress());
                        String verify = Input.promt("Xác định đúng địa chỉ nhà (Y/N): ");
                        if (verify.equalsIgnoreCase("Y")) {
                            if (bookList.contains(BOOK_CART)) {
                                for (int i = 0; i < BOOK_CART.size(); ) {
                                    for (int j = 0; j < bookList.size(); j++) {
                                        if (BOOK_CART.get(i).getId() == (bookList.get(j).getId())) {
                                            bookList.get(j).setQuantity();
                                            bookList.get(j).setNumberOfBookPurchase();
                                            isPaid = true;
                                        }
                                    }
                                }
                            }
                            System.out.println("Bạn đã đặt hàng thành công, sách sẽ được chuyển tới từ 3 - 5 ngày, vui lòng thanh toán khi nhận hàng!");
                            WriteFileUlti.writeFileInvoice("src\\model\\data\\invoice.txt", userService.getCurrentUser());
                            WriteFileUlti.writeFileAppendInvoice("src\\model\\data\\invoice.txt",BOOK_CART);
                            WriteFileUlti.writeFileAppendInvoiceHistory("src\\model\\data\\invoiceHistory.csv", userService.getCurrentUser(), BOOK_CART);
                            return;
                        } else if (verify.equalsIgnoreCase("N")) {
                            return;
                        } else throw new InvalidChoiceException("Đầu vào không hợp lệ");
                    case 3:
                        return;
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } while (true);
    }
}
