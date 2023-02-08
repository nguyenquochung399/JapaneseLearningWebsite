/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Result;

import DAOs.Account.UserDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TestDAO;
import Models.ChoiceDetail;
import Models.ChoiceOfUser;
import Models.Result;
import Models.ResultUser;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saing
 */
public class resultControl extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet resultControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet resultControl at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
//        processRequest(request, response);

        ResultDAO dao = new ResultDAO();
        List<Result> listResult = dao.getAllResults();
        List<ResultUser> list = new ArrayList<ResultUser>();
        for (Result o : listResult) {
            
            UserDAO userDAO = new UserDAO();
            String username = userDAO.getUserByID2(o.getUserID()).getUsername();
            
            TestDAO testDAO = new TestDAO();
            String test = testDAO.getTestByID(o.getTestID()).getName();
            
            list.add(new ResultUser(o.getResultID(),username, test, o.getTimeBigin(),o.getTimeExpire(),o.getScore(), o.getTrueQuestion()));
        }
        
        request.setAttribute("listResult", list);
        
        request.getRequestDispatcher("Test_manage_detailResult.jsp").forward(request, response);
        
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
//        processRequest(request, response);
        
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
