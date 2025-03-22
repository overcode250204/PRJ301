/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ACER
 */
public class OrderDetailDTO {
    private int orderDetailID;
    private String productID;
    private int orderID;
    private int quantity;
    private double price;
    private ProductDTO product;

    public OrderDetailDTO() {
    }

    
    
    
    public OrderDetailDTO(int orderDetailID, String productID, int orderID, int quantity, double price, ProductDTO product) {
        this.orderDetailID = orderDetailID;
        this.productID = productID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    
    
    
    
    
}
