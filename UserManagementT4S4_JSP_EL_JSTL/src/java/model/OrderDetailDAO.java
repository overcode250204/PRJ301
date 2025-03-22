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
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDetailDAO {

    private static final String CREATE_ORDER_DETAIL = "INSERT INTO tblOrderDetails (productID, orderID, quantity, price) VALUES (?,?,?,?)";
    private static final String GET_ORDERS_DETAIL_BY_ORDER_ID = "SELECT orderDetailID, productID, quantity, price FROM tblOrderDetails WHERE orderID = ?";
    private static final String DELETE_ORDER_DETAIL = "DELETE tblOrderDetails WHERE productID = ?";

    public boolean createOrderDetail(int orderID, String id, int quantity, double price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
            ptm.setString(1, id);
            ptm.setInt(2, orderID);
            ptm.setInt(3, quantity);
            ptm.setDouble(4, price);
            check = ptm.executeUpdate() > 0 ? true : false;

        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public List<OrderDetailDTO> getOrderDetailsByOrderID(int orderID) throws SQLException {
        List<OrderDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_ORDERS_DETAIL_BY_ORDER_ID);
            ptm.setInt(1, orderID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int orderDetailID = rs.getInt("orderDetailID");
                String productID = rs.getString("productID");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                ProductDAO dao = new ProductDAO();
                ProductDTO product = dao.getProductByID(productID);
                list.add(new OrderDetailDTO(orderDetailID, productID, orderID, quantity, price, product));
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
    
    public boolean deleteOrderDeltail(String productID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DELETE_ORDER_DETAIL);
                ptm.setString(1, productID);
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    
    
}
