/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Test;

import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import Models.Level;

import Models.Tag;
import Models.Test;
import Models.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saing
 */
public class showAllTestControl extends HttpServlet {

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
//            out.println("<title>Servlet showAllTestControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet showAllTestControl at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String type = "Tất cả bài kiểm tra";
//        String tagID = request.getParameter("tagID");
                String tagID = "1";

        
        TestDAO dao = new TestDAO();
        
        List<Test> listTestN5 = new ArrayList<>();
        List<Test> listTestN4 = new ArrayList<>();
        List<Test> listTestN3 = new ArrayList<>();
        List<Test> listTestN2 = new ArrayList<>();
        
        listTestN5 = dao.getByLevelandTag(Integer.valueOf(tagID), 5);
        listTestN4 = dao.getByLevelandTag(Integer.valueOf(tagID), 4);
        listTestN3 = dao.getByLevelandTag(Integer.valueOf(tagID), 3);
        listTestN2 = dao.getByLevelandTag(Integer.valueOf(tagID), 2);
        
        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();
        
        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();
        
        MaterialDAO materialdao = new MaterialDAO();
        List<Type> listT = materialdao.getAllType();
        List<Level> listL = materialdao.getAllLevel();
        
        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);
        
        
        request.setAttribute("listTestN5", listTestN5);
        request.setAttribute("listTestN4", listTestN4);
        request.setAttribute("listTestN3", listTestN3);
        request.setAttribute("listTestN2", listTestN2);
        
        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);
        request.setAttribute("type", type);
        
        request.getRequestDispatcher("Test_multichoice_viewAllTest.jsp").forward(request, response);
//                        request.getRequestDispatcher("template_user.jsp").forward(request, response);

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
