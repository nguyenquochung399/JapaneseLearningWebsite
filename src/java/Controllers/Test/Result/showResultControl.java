/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Result;

import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import Models.Level;
import Models.Question;
import Models.Result;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saing
 */
public class showResultControl extends HttpServlet {

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
//            out.println("<title>Servlet showResultControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet showResultControl at " + request.getContextPath() + "</h1>");
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
        
        
        HttpSession session = request.getSession();
        String resultID = session.getAttribute("newresultID").toString();   
        
        String type = "Kết quả bài kiểm tra";
        
        ResultDAO resultdao = new ResultDAO();
        Result result = resultdao.getResultbyID(Integer.parseInt(resultID));
        
        TestDAO testdao = new TestDAO();
        Test test = testdao.getTestByID(result.getTestID());
        
        //step: lấy tất cả Id của question trong test a
        QuestionDAO quesdao = new QuestionDAO();
        List<Question> QuestionOfTest = quesdao.getByTest(result.getTestID());
        
        
        int totalScore = QuestionOfTest.size();
        
        LevelDAO leveldao = new LevelDAO();
        Level level = leveldao.getLevelbyID(test.getLevelID());
        
        TagDAO tagdao = new TagDAO();
        Tag tag = tagdao.getTagByID(test.getTagID());
        
        
        List<Tag> listtag = tagdao.getAllTag();
         
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);
        
        request.setAttribute("type", type);
        request.setAttribute("result", result);
        request.setAttribute("test", test);
        request.setAttribute("level", level);        
        request.setAttribute("tag", tag);
        request.setAttribute("totalScore", String.valueOf(totalScore));
        request.setAttribute("resultID", resultID);
        
        // document
        String typeID = request.getParameter("typeID");
        String levelID = request.getParameter("levelID");

        MaterialDAO dao = new MaterialDAO();
        List<Type> listT = dao.getAllType();
        List<Level> listL = dao.getAllLevel();

        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);
        // end document
        
        request.getRequestDispatcher("Test_multichoice_showResult.jsp").forward(request, response);
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
