/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Test;

import DAOs.Test.AnswerDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TestDAO;
import Models.Answer;
import Models.Question;
import Models.Result;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saing
 */
public class testDeleteControl extends HttpServlet {

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
//            out.println("<title>Servlet testDeleteControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet testDeleteControl at " + request.getContextPath() + "</h1>");
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
        //step1: get AnswerID from jsp
        String TestID = request.getParameter("testID");
        //step2: pass AnswerID to DAO
        TestDAO testdao = new TestDAO();
        QuestionDAO quesdao = new QuestionDAO();
        List<Question> listques = quesdao.getByTest(Integer.parseInt(TestID));
        for (Question q : listques) {
                AnswerDAO ansdao = new AnswerDAO();
                List<Answer> listans = ansdao.getAnswerByQuestion(q.getQuestionID());
                for (Answer a : listans) {
                    ansdao.deleteAnswer(a.getAnswerID());
                }
            quesdao.deleteQuestion(q.getQuestionID());
        }
        
        ResultDAO resultDAO = new ResultDAO();
        List<Result> list_result = resultDAO.getResultByTest(Integer.parseInt(TestID));
        for (Result r : list_result) {
            resultDAO.deleteResult(r.getResultID());
        }
        
        testdao.deleteTest(Integer.parseInt(TestID));
        
        response.sendRedirect("testControl");
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
