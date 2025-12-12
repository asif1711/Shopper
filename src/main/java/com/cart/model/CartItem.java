package com.cart.model;

public class CartItem {
    private int productId;
    private String name;
    private double price;
    private int quantity;

    public CartItem(int productId, String name, double price) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = 1; // start with 1
    }

    public int getProductId() { return productId; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
