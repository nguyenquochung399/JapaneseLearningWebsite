/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Account;

import DAOs.Account.UserDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.Level;
import Models.Tag;
import Models.Type;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ProfileUserControl", urlPatterns = {"/ProfileUserControl"})
public class ProfileUserControl extends HttpServlet {

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
        
        String typeID = request.getParameter("type");
        String levelID = request.getParameter("level");

        MaterialDAO dao = new MaterialDAO();
        List<Type> listT = dao.getAllType();
        List<Level> listL = dao.getAllLevel();

        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);
        
         // test
        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();
        
        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);
        // end test
        
        
        
        HttpSession session = request.getSession();
        User user = new User();
        String email = user.getEmail();
        UserDAO dao2 = new UserDAO();

        User u = dao2.getUserByEmail(email);
        u = (User) request.getSession().getAttribute("acc");
        session.setAttribute("acc", u);

        request.getRequestDispatcher("account_profile.jsp").forward(request, response);
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
