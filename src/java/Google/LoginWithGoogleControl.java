/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Google;

import DAOs.Account.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author A Hi
 */
@WebServlet(name = "LoginWithGoogleControl", urlPatterns = {"/LoginWithGoogleControl"})
public class LoginWithGoogleControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("signup.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtilsLogin.getToken(code);
            GooglePojo googlePojo = GoogleUtilsLogin.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("email", googlePojo.getEmail());
            request.setAttribute("picture", googlePojo.getPicture());

            String id = request.getAttribute("id").toString();
            String email = request.getAttribute("email").toString();
            String picture = request.getAttribute("picture").toString();

            UserDAO dao = new UserDAO();
            User u = dao.loginWithEmail(email);
            User a = dao.checkAdmin(email);
            User b = dao.checkContentManager(email);

            if (u == null) {
//            request.setAttribute("mess", "Email hoặc mật khẩu không đúng.");
                request.setAttribute("email", email);
                request.getRequestDispatcher("account_login.jsp").forward(request, response);
            } else {
                if (a != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("acc", u);
                    response.sendRedirect("ManageAccountControl");
                } else {
                    if (b != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("acc", u);
                        response.sendRedirect("ManageAlphabetControl");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("acc", u);
                        response.sendRedirect("HomeControl");
                    }
                }
            }
        }
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
