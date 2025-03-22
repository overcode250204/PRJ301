/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderDetailDAO;
import model.ProductDAO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "DeleteProductController", urlPatterns = {"/DeleteProductController"})
public class DeleteProductController extends HttpServlet {

    private static final String ERROR = "SearchProductController";
    private static final String SUCCESS = "SearchProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check = false;
        boolean checkProductDetail = false;
        try {
            String productID = request.getParameter("productID");
            String confrimDelete = request.getParameter("confirmDelete");
            ProductDAO dao = new ProductDAO();
            OrderDetailDAO daoOrderDetail = new OrderDetailDAO();
            check = dao.delete(productID);

            if (!check) {
                if ("true".equals(confrimDelete)) {
                    checkProductDetail = daoOrderDetail.deleteOrderDeltail(productID);
                    if (checkProductDetail) {
                        check = dao.delete(productID);
                    }
                } else {
                    request.setAttribute("CONFIRM_DELETE", "Product này có đơn hàng liên quan. Bạn có muốn xóa luôn không?");
                    request.setAttribute("PRODUCT_ID", productID);
                }

            }
            if (check) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at DeleteProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
