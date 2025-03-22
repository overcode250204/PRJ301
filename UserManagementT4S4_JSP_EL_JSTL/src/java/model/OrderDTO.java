/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author ACER
 */
public class OrderDTO {

    private int orderID;
    private String userID;
    private double total;
    private Timestamp date;
    private List<OrderDetailDTO> orderDetails;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String userID, double total, Timestamp date) {
        this.orderID = orderID;
        this.userID = userID;
        this.total = total;
        this.date = date;
    }
    
    

    public OrderDTO(int orderID, String userID, double total, Timestamp date, List<OrderDetailDTO> orderDetails) {
        this.orderID = orderID;
        this.userID = userID;
        this.total = total;
        this.date = date;
        this.orderDetails = orderDetails;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public List<OrderDetailDTO> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetailDTO> orderDetails) {
        this.orderDetails = orderDetails;
    }

    
    

}
