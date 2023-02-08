/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Answer;

import DAOs.Test.AnswerDAO;
import DAOs.Test.QuestionDAO;
import Models.Answer;
import Models.Question;
import java.io.IOException;
import java.io.PrintWriter;
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
public class answerEditControl extends HttpServlet {

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
//            out.println("<title>Servlet answerEditControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet answerEditControl at " + request.getContextPath() + "</h1>");
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
        
        //step1: get AnswerID from jsp
        String AnswerID = request.getParameter("answerID");
        AnswerDAO dao = new AnswerDAO();
        Answer answer = dao.getAnswerByID(Integer.parseInt(AnswerID));
        
        //get questionID for show question
        QuestionDAO quesdao = new QuestionDAO();
        Question ques = quesdao.getQuestionByID(answer.getQuestionID());
        
        //step2: load data to jsp
        request.setAttribute("answer", answer);
        request.setAttribute("ques", ques);
        HttpSession session = request.getSession();
        session.setAttribute("AnswerID", AnswerID);
        request.getRequestDispatcher("Test_manage_editAnswer.jsp").forward(request, response);

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
        //set utf-8 for input vietnamese word
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        
        String question = request.getParameter("Question");
        int questionID = 0;

        QuestionDAO quesdao = new QuestionDAO();
        List<Question> listques = quesdao.getAllQuestion();
        
        for (Question o : listques) {
            if(o.getQuestion().equals(question)){
                questionID = o.getQuestionID();
            }
        }
        //get data from jsp
        String answerID = session.getAttribute("AnswerID").toString();
        String answer = request.getParameter("Answer");
        String isCorrect = request.getParameter("isCorrect");
        //insert data into database
        AnswerDAO dao = new AnswerDAO();
        dao.editAnswer(Integer.parseInt(answerID), questionID, answer, Integer.parseInt(isCorrect));
        response.sendRedirect("answerControl");
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
