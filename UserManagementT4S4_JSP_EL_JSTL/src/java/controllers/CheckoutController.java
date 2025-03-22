   /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDTO;
import shopping.Cart;
import model.OrderDAO;
import model.OrderDetailDAO;
import model.ProductDTO;
import model.ProductDAO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String SUCCESS = "orderSuccess.jsp";
    private static final String ERROR = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");

            if (cart == null || cart.getCart().isEmpty()) {
                request.setAttribute("ERROR", "Your cart is empty!");
            } else {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

                if (user != null) {
                    ProductDAO productDAO = new ProductDAO();
                    boolean isStockEnough = true;
                    for (ProductDTO p : cart.getCart().values()) {
                        int stock = productDAO.getQuantityByID(p.getId());
                        if (p.getQuantity() > stock) {
                            request.setAttribute("ERROR", "Not enough stock for " + p.getName());
                            isStockEnough = false;
                            break;
                        }
                    }
                    if (isStockEnough) {
                        String userID = user.getUserID();
                        OrderDAO orderDAO = new OrderDAO();
                        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                        int orderID = orderDAO.createOrder(userID, cart.getTotalPrice());
                        if (orderID <= 0) {
                            request.setAttribute("ERROR", "Fail to create order");
                        } else {
                            boolean isOrderSuccessful = true;
                            for (ProductDTO p : cart.getCart().values()) {
                                boolean detailCreated = orderDetailDAO.createOrderDetail(orderID, p.getId(), p.getQuantity(), p.getPrice());
                                if (!detailCreated) {
                                    isOrderSuccessful = false;
                                    request.setAttribute("ERROR", "Failed to add order detail for " + p.getName());
                                    break;
                                }

                            }
                            if (isOrderSuccessful) {
                                for (ProductDTO p : cart.getCart().values()) {
                                    boolean stockUpdate = productDAO.updateStock(p.getId(), p.getQuantity());
                                    if (!stockUpdate) {
                                        isOrderSuccessful = false;
                                        request.setAttribute("ERROR", "Failed to update stock for " + p.getName());
                                        break;
                                    }
                                }
                            }
                            
                            if (isOrderSuccessful) {
                                session.removeAttribute("CART");
                                url = SUCCESS;
                            } else {
                                request.setAttribute("ERROR", "Order failed. Please try again.");
                            }
                            
                        }
                    }

                } else {
                    request.setAttribute("ERROR", "You are not login!!!");
                    url = ERROR;
                }
            }

        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
