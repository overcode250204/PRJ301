/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDAO {

    private static final String CREATE_ORDER = "INSERT INTO tblOrders (userID, total, date) VALUES (?,?, GETDATE())";
    private static final String GET_LIST_ORDERS_BY_USERID = "SELECT orderID, userID, total, date FROM tblOrders WHERE userID = ? ORDER BY date DESC";

    public int createOrder(String userID, double totalPrice) throws SQLException {
        int orderID = -1;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CREATE_ORDER, Statement.RETURN_GENERATED_KEYS);
            ptm.setString(1, userID);
            ptm.setDouble(2, totalPrice);
            check = ptm.executeUpdate() > 0 ? true : false;
            if (check) {
                rs = ptm.getGeneratedKeys();
                if (rs.next()) {
                    orderID = rs.getInt(1);
                }
            }

        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return orderID;
    }

    public List<OrderDTO> getListOrdersByUserID(String userID) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ORDERS_BY_USERID);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                double total = rs.getDouble("total");
                Timestamp date = rs.getTimestamp("date");   
                OrderDetailDAO dao = new OrderDetailDAO();
                List<OrderDetailDTO> details = dao.getOrderDetailsByOrderID(orderID);
                list.add(new OrderDTO(orderID, userID, total, date, details));
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
