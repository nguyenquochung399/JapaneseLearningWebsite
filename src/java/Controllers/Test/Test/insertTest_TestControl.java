/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Test;

import DAOs.Test.LevelDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import Models.Level;
import Models.Question;
import Models.QuestionOfTest;
import Models.Result;
import Models.Tag;
import Models.Test;
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
public class insertTest_TestControl extends HttpServlet {

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
//        processRequest(request, response);
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        //khai báo
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        String TestID = session.getAttribute("testID").toString();
        Test test = new TestDAO().getTestByID(Integer.parseInt(TestID));

        QuestionDAO quesdao = new QuestionDAO();
        List<Question> QuestionOfTest = quesdao.getByTest(Integer.parseInt(TestID));
        int numberques = 0;
        for (Question o : QuestionOfTest) {
                numberques += 1;
        }

        //step: lấy câu hỏi từ list câu hỏi trong quiz
        List<QuestionOfTest> list = new ArrayList<QuestionOfTest>();
        for (Question o : QuestionOfTest) {
            list.add(new QuestionOfTest(o.getTestID(), o.getQuestionID(), o.getQuestion(), new TestDAO().getTestByID(o.getTestID()).getName()));
        }

        int hasResult = 0;
        List<Result> listresult = new ResultDAO().getResultByTest(Integer.parseInt(TestID));
        if (!listresult.isEmpty()) {
            hasResult += 1;
        }

        session.setAttribute("hasResult", hasResult);
        session.setAttribute("status", test.getStatus());
        session.setAttribute("numberques", numberques);
        session.setAttribute("testID", TestID);

        //step2: load data to jsp
        request.setAttribute("listQuestion", list);
        request.setAttribute("nameTest", test.getName());
        request.getRequestDispatcher("Test_manage_insretTest_Test.jsp").forward(request, response);
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
