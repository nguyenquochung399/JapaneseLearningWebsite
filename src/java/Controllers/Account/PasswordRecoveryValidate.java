/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Account;

import DAOs.Account.CodeDAO;
import DAOs.Account.UserDAO;
import Models.Code;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class PasswordRecoveryValidate extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String recoverEmail = request.getParameter("recoverEmail");
            String recoverCode = request.getParameter("recoverCode");
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            // Get User
            UserDAO userdao = new UserDAO();
            User u = userdao.getUserByEmail(recoverEmail);

            // Set Expiry Date
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String currentTime = dtf.format(now);

            // Find if user already has a Code
            Code checkCode = CodeDAO.getCodeByUID(u.getUserID());
            if (checkCode != null) {
                String dbCode = checkCode.getCode();
                String dbExpiry = checkCode.getExpiryDate();
                long offset = 0;
                try {
                    offset = fmt.parse(dbExpiry).getTime() - fmt.parse(currentTime).getTime();
                } catch (ParseException ex) {
                    response.sendRedirect(request.getContextPath() + "/account_login.jsp");
                }

                // Check code equals
                if (recoverCode.equals(dbCode)) {
                    // Check expiry date
                    if (offset > 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("isAuthorizedPassChange", "Yes");
                        //response.sendRedirect(request.getContextPath() + "/account_recovery_password.jsp");
                        out.println("<div class='w-100 text-md-center validate-success' id='validate-msg'>Xác thực Email thành công! Đang chuyển hướng...</div>");

                    } else {
                        //response.sendRedirect(request.getContextPath() + "/account_recovery_validate.jsp?status=2");
                        out.println("<div class='w-100 text-md-center validate-failed' id='validate-msg'>Mã code đã hết hạn, vui lòng gửi lại mã!</div>");
                    }
                } else {
                    //response.sendRedirect(request.getContextPath() + "/account_recovery_validate.jsp?status=1");
                    out.println("<div class='w-100 text-md-center validate-failed' id='validate-msg'>Mã code sai, vui lòng thử lại!</div>");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/account_login.jsp");
            }
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
