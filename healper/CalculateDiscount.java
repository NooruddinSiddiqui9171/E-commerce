package com.mycompany.healper;

public class CalculateDiscount 
{
    public static int calculateDiscount(String priceString, String discountPercentage)
    {
        int price = Integer.parseInt(priceString);
        int discount = Integer.parseInt(discountPercentage);
        int discountedPrice = price - (price * discount / 100);

        return discountedPrice;
    }
}
