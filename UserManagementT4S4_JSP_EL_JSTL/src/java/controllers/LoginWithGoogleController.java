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
import javax.servlet.http.HttpSession;
import model.GoogleAccount;
import model.UserDAO;
import model.UserDTO;
import utils.GoogleLoginUtils;

/**
 *
 * @author ACER
 */
@WebServlet(name = "LoginWithGoogleController", urlPatterns = {"/LoginWithGoogleController"})
public class LoginWithGoogleController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String ROLE = "US";
    private static final String US = "US";

    private static final String USER_PAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {


                String code = request.getParameter("code");
                String accessToken = GoogleLoginUtils.getToken(code);
                GoogleAccount account = GoogleLoginUtils.getUserInfor(accessToken);
                if (account != null) {
                    String email = account.getEmail();
                    String name = account.getName();

                    UserDAO dao = new UserDAO();
                    UserDTO user = dao.getUserByEmail(email);
                    if (user == null) {
                        String defaulRole = ROLE;
                        user = new UserDTO(email, name, defaulRole, "***", "");
                        dao.createV2(user);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);
                    if (ROLE.equals(US)) {
                        url = USER_PAGE;
                    }
                }

            

        } catch (Exception e) {
            log("Error at LoginWithGoogleController: " + e.toString());
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
