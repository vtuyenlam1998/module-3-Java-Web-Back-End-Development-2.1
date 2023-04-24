package com.example.product_discount_calculator;

import java.text.NumberFormat;
import java.util.Locale;

public class Converter {
    public static String formatPrice(double price) {
        Locale localeVN = new Locale("vi","VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(localeVN);
        return numberFormat.format(price);
    }
}
