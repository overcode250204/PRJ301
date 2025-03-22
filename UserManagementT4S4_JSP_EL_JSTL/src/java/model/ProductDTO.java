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
public class ProductDTO {
    private String id;
    private String name;
    private double price;
    private int quantity;

    public ProductDTO() {
        this.id = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
    }

    public ProductDTO(String id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
    
    

    public ProductDTO(String id, String name, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
