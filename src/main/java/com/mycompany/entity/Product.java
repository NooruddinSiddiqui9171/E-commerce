package com.mycompany.entity;

public class Product {
   private int product_id;
   private String Product_title;
   private String product_description;
   private String product_photo;
   private String product_price;
   private String product_discount;
   private String product_quantity;
   private int category_id;

    public int getProduct_id() {
        return product_id;
    }

    public String getProduct_title() {
        return Product_title;
    }

    public String getProduct_description() {
        return product_description;
    }

    public String getProduct_photo() {
        return product_photo;
    }

    public String getProduct_price() {
        return product_price;
    }

    public String getProduct_discount() {
        return product_discount;
    }

    public String getProduct_quantity() {
        return product_quantity;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setProduct_title(String Product_title) {
        this.Product_title = Product_title;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public void setProduct_photo(String product_photo) {
        this.product_photo = product_photo;
    }

    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }

    public void setProduct_discount(String product_discount) {
        this.product_discount = product_discount;
    }

    public void setProduct_quantity(String product_quantity) {
        this.product_quantity = product_quantity;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public Product(int product_id, String Product_title, String product_description, String product_photo, String product_price, String product_discount, String product_quantity, int category_id) {
        this.product_id = product_id;
        this.Product_title = Product_title;
        this.product_description = product_description;
        this.product_photo = product_photo;
        this.product_price = product_price;
        this.product_discount = product_discount;
        this.product_quantity = product_quantity;
        this.category_id = category_id;
    }

    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", Product_title=" + Product_title + ", product_description=" + product_description + ", product_photo=" + product_photo + ", product_price=" + product_price + ", product_discount=" + product_discount + ", product_quantity=" + product_quantity + ", category_id=" + category_id + '}';
    }
   
   
   
}
