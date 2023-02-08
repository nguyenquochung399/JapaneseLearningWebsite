/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Answer;

import DAOs.Test.AnswerDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TestDAO;
import Models.Answer;
import Models.Question;
import Models.Result;
import Models.Test;
import Models.ansofques;
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
public class insertTest_AnswerControl extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet insertTest_AnswerControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet insertTest_AnswerControl at " + request.getContextPath() + "</h1>");
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
        //set utf-8 for input vietnamese word
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String questionID = request.getParameter("questionID");

        String ques = new QuestionDAO().getQuestionByID(Integer.parseInt(questionID)).getQuestion();

        //khai báo
        AnswerDAO ansdao = new AnswerDAO();
        List<Answer> listAnswer = ansdao.getAnswerByQuestion(Integer.parseInt(questionID));
        List<ansofques> aoq = new ArrayList<ansofques>();
        for (Answer a : listAnswer) {
            aoq.add(new ansofques(a.getAnswerID(), a.getAnswer(), a.getQuestionID(), ques, a.getIsCorrect()));
        }

        Test test = new TestDAO().getTestByID(new QuestionDAO().getQuestionByID(Integer.parseInt(questionID)).getTestID());
        
        int hasResult = 0;
        List<Result> listresult = new ResultDAO().getResultByTest(test.getTestID());
        if (!listresult.isEmpty()) {
            hasResult += 1;
        }

        //step2: load data to jsp
        request.setAttribute("listAnswer", aoq);

        HttpSession session = request.getSession();
        session.setAttribute("questionID", questionID);
        session.setAttribute("question", ques);
        session.setAttribute("hasResult", hasResult);
        session.setAttribute("status", test.getStatus());
        request.getRequestDispatcher("Test_manage_insretTest_question.jsp").forward(request, response);
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
