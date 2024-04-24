package com.mycompany.entity;

public class Category {
     private int category_id;
    private String category_title;
    private String category_description;

    public int getCategory_id() {
        return category_id;
    }

    public String getCategory_title() {
        return category_title;
    }

    public String getCategory_description() {
        return category_description;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public void setCategory_title(String category_title) {
        this.category_title = category_title;
    }

    public void setCategory_description(String category_description) {
        this.category_description = category_description;
    }

    public Category(int category_id, String category_title, String category_description) {
        this.category_id = category_id;
        this.category_title = category_title;
        this.category_description = category_description;
    }

    public Category() {
    }

    @Override
    public String toString() {
        return "Product{" + "category_id=" + category_id + ", category_title=" + category_title + ", category_description=" + category_description + '}';
    }
      
}
