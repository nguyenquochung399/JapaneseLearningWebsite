/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Alphabet;

import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.Alphabet;
import Models.Level;
import Models.Tag;
import Models.Type;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author A Hi
 */
@WebServlet(name = "AlphabetControl", urlPatterns = {"/AlphabetControl"})
public class AlphabetControl extends HttpServlet {

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

        String type = request.getParameter("type");
        String alphabetID = request.getParameter("alphabetID");

        MaterialDAO dao = new MaterialDAO();
        List<Type> listT = dao.getAllType();
        List<Level> listL = dao.getAllLevel();
        List<Alphabet> listA = dao.getAlphabetByType(type);

        request.setAttribute("type", type);
        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);
        request.setAttribute("listA", listA);

         // test
        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();
        
        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);
        // end test
        
        request.getRequestDispatcher("alphabet_alphabet.jsp").forward(request, response);

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
